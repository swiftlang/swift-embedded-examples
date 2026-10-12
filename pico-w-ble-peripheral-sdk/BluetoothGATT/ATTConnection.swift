//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

/// Manages a Bluetooth connection using the ATT protocol.
internal final class ATTConnection <Socket: L2CAPConnection> {
    
    public typealias Data = Socket.Data
    
    public typealias Error = ATTConnectionError<Socket.Error, Socket.Data>
        
    // MARK: - Properties
    
    /// Actual number of bytes for PDU ATT exchange.
    public var maximumTransmissionUnit: ATTMaximumTransmissionUnit = .default
    
    internal var socket: Socket
    
    internal let log: ((String) -> ())?
        
    // MARK: - Private Properties
    
    /// There's a pending incoming request.
    private var incomingRequest = false
    
    /// IDs for "send" ops.
    private var nextSendOpcodeID: UInt = 0
    
    /// Pending request state.
    private var pendingRequest: SendOperation?
    
    /// Pending indication state.
    private var pendingIndication: SendOperation?
    
    /// Queued ATT protocol requests
    private var requestQueue = [SendOperation]()
    
    /// Queued ATT protocol indications
    private var indicationQueue = [SendOperation]()
    
    /// Queue of PDUs ready to send
    private var writeQueue = [SendOperation]()
    
    /// List of registered callbacks.
    private var notifyList = [ATTOpcode: Notification]()
    
    // MARK: - Initialization
    
    public init(
        socket: Socket,
        log: ((String) -> ())? = nil
    ) {
        self.socket = socket
        self.log = log
    }
    
    deinit {
        socket.close()
    }
    
    // MARK: - Methods
    
    public func run() throws(Error) {
        // throw underlying error
        if let error = socket.status.error {
            throw .socket(error)
        }
        // read pending packets
        while socket.status.recieve {
            try read()
        }
        var didWrite = true
        // write pending packets
        while socket.status.send, didWrite {
            didWrite = try write()
        }
    }
    
    /// Performs the actual IO for recieving data.
    internal func read() throws(Error) {
        
        //log?("Attempt read")
        
        let bytesToRead = Int(self.maximumTransmissionUnit.rawValue)
        let receivedData: Data
        do {
            receivedData = try socket.receive(bytesToRead) // will fail if not ready
        }
        catch {
            throw .socket(error)
        }
        
        //log?("Received data (\(receivedData.count) bytes)")
        
        // valid PDU data length
        guard receivedData.count >= 1 // at least 1 byte for ATT opcode
            else { throw .garbageResponse(receivedData) }
        
        let opcodeByte = receivedData[0]
        
        // valid opcode
        guard let opcode = ATTOpcode(rawValue: opcodeByte)
            else { throw .garbageResponse(receivedData) }
        
        //log?("Received opcode \(opcode)")
        
        // Act on the received PDU based on the opcode type
        switch opcode.type {
        case .response:
            try handle(response: receivedData, opcode: opcode)
        case .confirmation:
            try handle(confirmation: receivedData, opcode: opcode)
        case .request:
            try handle(request: receivedData, opcode: opcode)
        case .command,
             .notification,
             .indication:
            // For all other opcodes notify the upper layer of the PDU and let them act on it.
            try handle(notify: receivedData, opcode: opcode)
        }
    }
    
    /// Performs the actual IO for sending data.
    @discardableResult
    internal func write() throws(Error) -> Bool {
        
        //log?("Attempt write")
        
        guard let sendOperation = pickNextSendOpcode()
            else { return false }
        
        //log?("Sending data... (\(sendOperation.data.count) bytes)")
        
        do {
            try socket.send(sendOperation.data)
        }
        catch {
            throw .socket(error)
        }
        let opcode = sendOperation.opcode
        
        //log?("Did write \(opcode)")
        
        /* Based on the operation type, set either the pending request or the
        * pending indication. If it came from the write queue, then there is
        * no need to keep it around.
        */
        switch opcode.type {
        case .request:
            pendingRequest = sendOperation
        case .indication:
            pendingRequest = sendOperation
        case .response:
            // Set `incomingRequest` to false to indicate that no request is pending
            incomingRequest = false
        case .command,
             .notification,
             .confirmation:
            break
        }
        
        return true
    }
    
    // write all pending PDUs
    private func writePending() {
        // TODO: Wakeup writer
        
    }
    
    /// Registers a callback for an opcode and returns the ID associated with that callback.
    public func register <T: ATTProtocolDataUnit> (_ callback: @escaping (T) -> ()) {
                
        // create notification
        let opcode = T.attributeOpcode
        let notify = Notification(callback)
        
        // add to queue
        notifyList[opcode] = notify
    }
    
    /// Unregisters the callback associated with the specified identifier.
    ///
    /// - Returns: Whether the callback was unregistered.
    @discardableResult
    public func unregister<T: ATTProtocolDataUnit>(_ type: T.Type) -> Bool {
        
        guard let index = notifyList.index(forKey: type.attributeOpcode)
            else { return false }
        notifyList.remove(at: index)
        return true
    }
    
    /// Registers all callbacks.
    public func unregisterAll() {
        notifyList.removeAll()
    }
    
    /// Adds a PDU to the queue to send.
    ///
    /// - Returns: Identifier of queued send operation or `nil` if the PDU cannot be sent.
    @discardableResult
    public func queue <Request: ATTProtocolDataUnit> (
        _ pdu: Request
    ) -> UInt {
        let attributeOpcode = Request.attributeOpcode
        // Only request and indication PDUs should have response callbacks.
        switch attributeOpcode.type {
        case .request,
             .indication: // Indication handles confirmation
            assertionFailure("Missing response")
        case .response,
             .command,
             .confirmation,
             .notification:
            break
        }
        let operation = SendOperation(
            id: nextSendOpcodeID,
            opcode: attributeOpcode,
            data: encode(pdu)
        )
        return queue(operation)
    }
    
    /// Adds a PDU to the queue to send.
    ///
    /// - Returns: Identifier of queued send operation or `nil` if the PDU cannot be sent.
    @discardableResult
    public func queue <Request: ATTProtocolDataUnit, Response: ATTProtocolDataUnit> (
        _ request: Request,
        response: @escaping ((Result<Response, ATTErrorResponse>) -> ())
    ) -> UInt {
        let attributeOpcode = Request.attributeOpcode
        // Only request and indication PDUs should have response callbacks.
        switch attributeOpcode.type {
        case .request,
             .indication: // Indication handles confirmation
            break
        case .response,
             .command,
             .confirmation,
             .notification:
            assertionFailure()
        }
        let operation = SendOperation(
            id: nextSendOpcodeID,
            opcode: attributeOpcode,
            data: encode(request),
            response: response
        )
        return queue(operation)
    }
    
    // MARK: - Private Methods
    
    private func queue (
        _ operation: SendOperation
    ) -> UInt {
        // increment ID
        nextSendOpcodeID += 1
        
        // Add the op to the correct queue based on its type
        switch operation.opcode.type {
        case .request:
            requestQueue.append(operation)
        case .indication:
            indicationQueue.append(operation)
        case .response,
             .command,
             .confirmation,
             .notification:
            writeQueue.append(operation)
        }
        
        writePending()
        
        return operation.id
    }
    
    private func encode <T: ATTProtocolDataUnit> (_ request: T) -> Data {
        
        var data = Data(request)
        /// MTU must be large enough to hold PDU.
        if data.count > Int(maximumTransmissionUnit.rawValue) {
            assertionFailure()
            data = Data(data.prefix(Int(maximumTransmissionUnit.rawValue)))
        }
        
        // TODO: Sign (encrypt) data
        
        return data
    }
    
    private func handle(response data: Data, opcode: ATTOpcode) throws(Error) {
        
        // If no request is pending, then the response is unexpected. Disconnect the bearer.
        guard let sendOperation = self.pendingRequest else {
            throw .unexpectedResponse(data)
        }
        
        // If the received response doesn't match the pending request, or if the request is malformed, 
        // end the current request with failure.
        
        let requestOpcode: ATTOpcode
        
        // Retry for error response
        if opcode == .errorResponse {
            
            guard let errorResponse = ATTErrorResponse(data: data)
                else { throw .garbageResponse(data) }
            
            let (errorRequestOpcode, didRetry) = handle(errorResponse: errorResponse)
            
            requestOpcode = errorRequestOpcode
            
            writePending()
            
            /// Return if error response caused a retry
            guard didRetry == false
                else { return }
            
        } else {
            
            guard let mappedRequestOpcode = opcode.request
                else { throw .unexpectedResponse(data) }
            
            requestOpcode = mappedRequestOpcode
        }
        
        // clear current pending request
        defer { self.pendingRequest = nil }
        
        /// Verify the received response belongs to the pending request
        guard sendOperation.opcode == requestOpcode else {
            throw ATTConnectionError.unexpectedResponse(data)
        }
        
        // success!
        try sendOperation.response(data)
        
        writePending()
    }
    
    private func handle(confirmation data: Data, opcode: ATTOpcode) throws(Error) {
        
        // Disconnect the bearer if the confirmation is unexpected or the PDU is invalid.
        guard let sendOperation = pendingIndication
            else { throw .unexpectedResponse(data) }
        
        self.pendingIndication = nil
        
        // success!
        try sendOperation.response(data)
        
        // send the remaining indications
        if indicationQueue.isEmpty == false {
            writePending()
        }
    }
    
    private func handle(request data: Data, opcode: ATTOpcode) throws(Error) {
        
        /*
        * If a request is currently pending, then the sequential
        * protocol was violated. Disconnect the bearer, which will
        * promptly notify the upper layer via disconnect handlers.
        */
        
        // Received request while another is pending.
        guard incomingRequest == false
            else { throw .unexpectedResponse(data) }
        
        incomingRequest = true
        
        // notify
        try handle(notify: data, opcode: opcode)
    }
    
    private func handle(notify data: Data, opcode: ATTOpcode) throws(Error) {
        // handle notification
        if let notification = self.notifyList[opcode] {
            try notification.notification(data)
        }
        
        // If this was a request and no handler was registered for it, respond with "Not Supported"
        if self.notifyList[opcode] == nil && opcode.type == .request {
            let errorResponse = ATTErrorResponse(
                request: opcode,
                attributeHandle: 0x00,
                error: .requestNotSupported
            )
            let _ = queue(errorResponse)
        }
    }
    
    /// Handle the error reponse for a pending request and attempt to retry. 
    ///
    /// - Returns: The opcode of the request that errored 
    /// and whether the request will be sent again.
    private func handle(errorResponse: ATTErrorResponse) -> (opcode: ATTOpcode, didRetry: Bool) {
        
        let opcode = errorResponse.request
        
        guard let pendingRequest = self.pendingRequest
            else { return (opcode, false)  }
        
        // Attempt to change security
        guard changeSecurity(for: errorResponse.error)
            else { return (opcode, false) }
        
        //print("Retrying operation \(pendingRequest)")
        
        self.pendingRequest = nil
        
        // Push operation back to request queue
        requestQueue.insert(pendingRequest, at: 0)
        
        return (opcode, true)
    }
    
    private func pickNextSendOpcode() -> SendOperation? {
        
        // See if any operations are already in the write queue
        if let sendOpcode = writeQueue.popFirst() {
            return sendOpcode
        }
        
        // If there is no pending request, pick an operation from the request queue.
        if pendingRequest == nil,
            let sendOpcode = requestQueue.popFirst() {
            return sendOpcode
        }
        
        // There is either a request pending or no requests queued. 
        // If there is no pending indication, pick an operation from the indication queue.
        if pendingIndication == nil,
            let sendOpcode = indicationQueue.popFirst() {
            // can't send more indications until the last one is confirmed
            pendingIndication = sendOpcode
            return sendOpcode
        }
        
        return nil
    }
    
    /// Attempts to change security level based on an error response.
    private func changeSecurity(for error: ATTError) -> Bool {
        
        let securityLevel: SecurityLevel
        do { securityLevel = try socket.securityLevel() }
        catch {
            log?("Unable to get security level. \(error)")
            return false
        }
        
        // only change if security is Auto
        guard securityLevel == .sdp
            else { return false }
        
        // get security from IO
        var newSecurityLevel: SecurityLevel
        
        if error == .insufficientEncryption,
           securityLevel < .medium {
            newSecurityLevel = .medium
        } else if error == .insufficientAuthentication {
            
            if (securityLevel < .medium) {
                newSecurityLevel = .medium
            } else if (securityLevel < .high) {
                newSecurityLevel = .high
            } else if (securityLevel < .fips) {
                newSecurityLevel = .fips
            } else {
                return false
            }
        } else {
            return false
        }
        
        // attempt to change security level on Socket IO
        do { try socket.setSecurityLevel(newSecurityLevel) }
        catch {
            log?("Unable to set security level. \(error)")
            return false
        }
        
        return true
    }
}

// MARK: - Supporting Types

/// ATT Connection Error
public enum ATTConnectionError<SocketError: Swift.Error, Data: DataContainer>: Error, Sendable {
    
    /// The received data could not be parsed correctly.
    case garbageResponse(Data)
    
    /// Response is unexpected.
    case unexpectedResponse(Data)
    
    /// Error ocurred at the socket layer.
    case socket(SocketError)
}

internal typealias ATTResponse<Success: ATTProtocolDataUnit> = Result<Success, ATTErrorResponse>

internal extension ATTConnection {
    
    struct SendOperation {
        
        /// The operation identifier.
        let id: UInt
        
        /// The request data.
        let data: Data
        
        /// The sent opcode
        let opcode: ATTOpcode
        
        /// The response callback.
        let response: ((Data) throws(ATTConnection.Error) -> ())
        
        init(
            id: UInt,
            opcode: ATTOpcode,
            data: Data
        ) {
            self.id = id
            self.opcode = opcode
            self.data = data
            self.response = { (data: Data) throws(ATTConnection.Error) -> () in
                assertionFailure("Unexpected response")
                throw .unexpectedResponse(data)
            }
        }
        
        init<Response: ATTProtocolDataUnit>(
            id: UInt,
            opcode: ATTOpcode,
            data: Data,
            response: @escaping ((Result<Response, ATTErrorResponse>) -> ())
        ) {
            self.id = id
            self.opcode = opcode
            self.data = data
            self.response = { (data: Data) throws(ATTConnection.Error) -> () in
                // invalid ATT code
                guard let responseOpcode = data.first.flatMap(ATTOpcode.init(rawValue:))
                    else { throw .garbageResponse(data) }
                // response is error response
                if responseOpcode == .errorResponse {
                    guard let errorResponse = ATTErrorResponse(data: data)
                        else { throw .garbageResponse(data) }
                    response(.failure(errorResponse))
                    return
                } else if responseOpcode == opcode.response {
                    // response is expected
                    guard let value = Response.init(data: data) else {
                        throw .garbageResponse(data)
                    }
                    response(.success(value))
                    return
                } else {
                    // other ATT response
                    throw .garbageResponse(data)
                }
            }
        }
    }
    
    struct Notification {
                
        let opcode: ATTOpcode
        
        let notification: (Data) throws(Error) -> ()
        
        init<T: ATTProtocolDataUnit>(
            _ notification: @escaping (T) -> ()
        ) {
            self.opcode = T.attributeOpcode
            self.notification = { (data: Data) throws(ATTConnection.Error) -> () in
                guard let value = T.init(data: data) else {
                    throw .garbageResponse(data)
                }
                notification(value)
            }
        }
    }
}

internal extension Array {
    
    mutating func popFirst() -> Element? {
        guard let first = self.first else { return nil }
        self.removeFirst()
        return first
    }
}