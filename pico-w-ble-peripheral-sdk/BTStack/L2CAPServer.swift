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

internal extension BTStackPeripheral {
    
    final class L2CAP {
        
        public nonisolated(unsafe) static var shared = BTStackPeripheral.L2CAP()
        
        internal var l2capCallbackRegistration = btstack_packet_callback_registration_t()
        
        private var hciCallbackRegistration = btstack_packet_callback_registration_t()
            
        public var log: (@Sendable (String) -> ())?

        internal fileprivate(set) var connections = [UInt16: BTStackPeripheral.L2CAP.Connection]()
        
        internal fileprivate(set) var recievedData = [UInt16: [BTStackPeripheral.L2CAP.Connection.Data]]()
        
        internal fileprivate(set) var pendingConnections = [BTStackPeripheral.L2CAP.Connection]()
        
        private init() {
            // Set up L2CAP and register L2CAP with HCI layer.
            l2cap_init()
            // register for callbacks
            l2capCallbackRegistration.callback = _l2cap_gattserver_packet_handler
            l2cap_add_event_handler(&l2capCallbackRegistration)
            hciCallbackRegistration.callback = _l2cap_gattserver_packet_handler
            hci_add_event_handler(&hciCallbackRegistration)
        }
        
        deinit {
            l2cap_remove_event_handler(&l2capCallbackRegistration)
            hci_remove_event_handler(&hciCallbackRegistration)
        }
        
        public func register(channel: ChannelIdentifier) {
            l2cap_register_fixed_channel(_l2cap_gattserver_packet_handler, channel.rawValue)
        }
        
        public func disconnect(connection: UInt16) throws(BTStackError) {
            #if L2CAP_USES_CHANNELS
            try l2cap_disconnect(connection).throwsError()
            #endif
        }

        public func canRead(_ handle: UInt16) -> Bool {
            self.recievedData[handle, default: []].isEmpty == false
        }
        
        public func read(length: Int = 23, connection handle: UInt16) -> [UInt8]? {
            guard canRead(handle) else {
                return nil
            }
            return Array(self.recievedData[handle, default: []].removeFirst().prefix(length))
        }
        
        internal func recieved(_ connection: UInt16, _ buffer: UnsafeBufferPointer<UInt8>) {
            let data = Array(buffer)
            self.recievedData[connection, default: []].append(data)
        }
        
        public func canWrite(_ handle: UInt16) -> Bool {
            /*
            guard let channel = l2cap_fixed_channel_for_channel_id(handle) else {
                assertionFailure()
                return false
            }
            return channel.pointee.waiting_for_can_send_now != 0
             */
            return true
        }
        
        public func write(_ data: [UInt8], connection handle: UInt16) throws(BTStackError) {
            //try l2cap_send(handle, buffer.baseAddress, UInt16(buffer.count)).throwsError()
            try data.withUnsafeBytes {
                l2cap_send_connectionless(
                    handle,
                    UInt16(L2CAP_CID_ATTRIBUTE_PROTOCOL),
                    .init(mutating: $0.baseAddress?.assumingMemoryBound(to: UInt8.self)),
                    UInt16($0.count)
                )
            }.throwsError()
        }
        
        public func canAccept() -> Bool {
            pendingConnections.isEmpty == false
        }
        
        public func accept() -> Connection? {
            guard canAccept() else {
                return nil
            }
            let connection = self.pendingConnections.removeFirst()
            self.connections[connection.handle] = connection
            return connection
        }
    }
}

internal extension BTStackPeripheral.L2CAP {
    
    struct Server: L2CAPServer {
                
        public typealias Error = BTStackError
        
        public let address: BluetoothAddress
        
        /// Creates a new server,
        public static func lowEnergyServer(
            address: BluetoothAddress,
            isRandom: Bool,
            backlog: Int
        ) throws(BTStackError) -> Self {
            self.init(address: address, channel: .att)
        }
        
        internal init(address: BluetoothAddress, channel: ChannelIdentifier) {
            BTStackPeripheral.L2CAP.shared.register(channel: channel)
            self.address = address
        }
        
        public func close() {
            
        }
        
        public func accept() throws(BTStackError) -> Connection {
            guard let connection = BTStackPeripheral.L2CAP.shared.accept() else {
                throw BTStackError(.noConnection)
            }
            return connection
        }
        
        public var status: L2CAPSocketStatus<BTStackError> {
            return .init(
                send: false,
                recieve: false,
                accept: BTStackPeripheral.L2CAP.shared.canAccept(),
                error: nil
            )
        }
    }
}

internal extension BTStackPeripheral.L2CAP {
    
    struct Connection: L2CAPConnection {
        
        public typealias Error = BTStackError
        
        public typealias Data = [UInt8]
        
        public let handle: UInt16
                
        public let address: BluetoothAddress
        
        public let destination: BluetoothAddress
        
        internal var l2cap: BTStackPeripheral.L2CAP { BTStackPeripheral.L2CAP.shared }
        
        /// Creates a new socket connected to the remote address specified.
        public static func lowEnergyClient(
            address: BluetoothAddress,
            destination: BluetoothAddress,
            isRandom: Bool
        ) throws(BTStackError) -> Self {
            // TODO: Outgoing connection
            throw .init(.unspecifiedError)
        }
        
        public func close() {
            try? l2cap.disconnect(connection: handle)
        }
        
        /// Write to the socket.
        public func send(_ data: Data) throws(BTStackError) {
            try l2cap.write(data, connection: handle)
        }
        
        /// Reads from the socket.
        public func receive(_ bufferSize: Int) throws(Self.Error) -> Self.Data {
            guard let data = l2cap.read(length: bufferSize, connection: handle) else {
                throw BTStackError(.unspecifiedError)
            }
            return data
        }
            
        /// Attempts to change the socket's security level.
        public func setSecurityLevel(_ securityLevel: SecurityLevel) throws(Self.Error) {
            throw BTStackError(.unspecifiedError)
        }
        
        /// Get security level
        //var securityLevel: SecurityLevel { get throws(Self.Error) }
        public func securityLevel() throws(Self.Error) -> SecurityLevel {
            .sdp
        }
        
        public var status: L2CAPSocketStatus<BTStackError> {
            return .init(
                send: l2cap.canWrite(handle),
                recieve: l2cap.canRead(handle),
                accept: false,
                error: l2cap.connections[handle] == nil ? BTStackError(.noConnection) : nil
            )
        }
    }
}


internal func _l2cap_gattserver_packet_handler(
    packetType: UInt8,
    connection: UInt16,
    packetPointer: UnsafeMutablePointer<UInt8>?,
    packetSize: UInt16
) {
    let l2cap = BTStackPeripheral.L2CAP.shared
    let buffer = UnsafeBufferPointer(start: packetPointer, count: Int(packetSize))
    switch Int32(packetType) {
        case HCI_EVENT_PACKET:
            switch UInt32(hci_event_packet_get_type(packetPointer)) {
                case L2CAP_EVENT_INCOMING_CONNECTION:
                    break
                case L2CAP_EVENT_CHANNEL_OPENED:
                    break
                case L2CAP_EVENT_CHANNEL_CLOSED:
                    break
                case L2CAP_EVENT_CAN_SEND_NOW:
                    break
                case HCI_EVENT_DISCONNECTION_COMPLETE:
                    l2cap.handle_HCI_EVENT_DISCONNECTION_COMPLETE(connection, buffer)
                case HCI_EVENT_META_GAP:
                    switch UInt32(hci_event_gap_meta_get_subevent_code(packetPointer)) {
                        case GAP_SUBEVENT_LE_CONNECTION_COMPLETE:
                        l2cap.handle_GAP_SUBEVENT_LE_CONNECTION_COMPLETE(connection, buffer)
                        default:
                            break
                }
                default:
                    break
            }
        case Int32(L2CAP_DATA_PACKET):
            l2cap.handle_L2CAP_DATA_PACKET(connection, buffer)
        case Int32(ATT_DATA_PACKET):
            l2cap.handle_ATT_DATA_PACKET(connection, buffer)
        default:
            break
    }
}

internal extension BTStackPeripheral.L2CAP {
    
    func handle_L2CAP_DATA_PACKET(_ connection: UInt16, _ data: UnsafeBufferPointer<UInt8>) {
        log?("L2CAP Packet - Handle \(connection)")
        recieved(connection, data)
    }
    
    func handle_ATT_DATA_PACKET(_ connection: UInt16, _ data: UnsafeBufferPointer<UInt8>) {
        log?("ATT Packet - Handle \(connection)")
        guard data.isEmpty == false, let opcode = ATTOpcode(rawValue: data[0]) else {
            return
        }
        recieved(connection, data)
    }
    
    func handle_HCI_EVENT_DISCONNECTION_COMPLETE(_ connection: UInt16, _ data: UnsafeBufferPointer<UInt8>) {
        let handle = hci_event_disconnection_complete_get_connection_handle(data.baseAddress)
        log?("Disconnected - Handle \(handle)")
        self.recievedData[handle] = nil
        self.connections[handle] = nil
        self.pendingConnections.removeAll(where: { $0.handle == handle })
    }
    
    func handle_GAP_SUBEVENT_LE_CONNECTION_COMPLETE(_ connection: UInt16, _ data: UnsafeBufferPointer<UInt8>) {
        let connectionHandle = gap_subevent_le_connection_complete_get_connection_handle(data.baseAddress)
        var peerAddress: BluetoothAddress = .zero
        gap_subevent_le_connection_complete_get_peer_address(data.baseAddress, &peerAddress)
        let connection = BTStackPeripheral.L2CAP.Connection(
            handle: connectionHandle,
            address: peerAddress,
            destination: HostController.default.address
        )
        self.pendingConnections.append(connection)
        log?("Connected - Handle \(connectionHandle) - Address \(peerAddress)")
    }
}
