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

/// GATT Peripheral Manager
public final class BTStackPeripheral: PeripheralManager, @unchecked Sendable {
    
    /// Peripheral Options
    public typealias Options = BTStackPeripheralOptions
    
    /// Peripheral Advertising Options
    public typealias AdvertisingOptions = BTStackPeripheralAdvertisingOptions
    
    public typealias Data = [UInt8]
    
    internal typealias Socket = BTStackPeripheral.L2CAP.Server
    
    // MARK: - Properties
    
    public let hostController: HostController
    
    public let options: Options
    
    /// Logging
    public var log: (@Sendable (String) -> ())? {
        get {
            storage.log
        }
        set {
            storage.log = newValue
        }
    }
    
    public var willRead: ((GATTReadRequest<Central, Data>) -> ATTError?)? {
        get {
            storage.willRead
        }
        set {
            storage.willRead = newValue
        }
    }
    
    public var willWrite: ((GATTWriteRequest<Central, Data>) -> ATTError?)? {
        get {
            storage.willWrite
        }
        set {
            storage.willWrite = newValue
        }
    }
    
    public var didWrite: ((GATTWriteConfirmation<Central, Data>) -> ())? {
        get {
            storage.didWrite
        }
        set {
            storage.didWrite = newValue
        }
    }
    
    public var connections: Set<Central> {
        Set(storage.connections.values.lazy.map { $0.central })
    }
    
    public var isAdvertising: Bool {
        storage.isAdvertising
    }
        
    private var _storage = Storage()
    
    internal var storage: Storage {
        get {
            #if canImport(Foundation)
            lock.lock()
            defer { lock.unlock() }
            #endif
            return _storage
        }
        set {
            #if canImport(Foundation)
            lock.lock()
            defer { lock.unlock() }
            #endif
            _storage = newValue
        }
    }
    
    #if canImport(Foundation)
    private let lock = NSLock()
    #endif
    
    // MARK: - Initialization
    
    public init(
        hostController: HostController = .default,
        options: Options = Options()
    ) {
        self.hostController = hostController
        self.options = options
    }
    
    deinit {
        if storage.isAdvertising {
            storage.stop()
        }
    }
    
    // MARK: - Methods
    
    public func start() throws(Error) {
        try start(options: AdvertisingOptions())
    }
    
    internal func start(
        address: BluetoothAddress,
        isRandom: Bool
    ) throws(Error) {
        // create server socket
        let socket: Socket
        do {
            socket = try Socket.lowEnergyServer(
                address: address,
                isRandom: isRandom,
                backlog: self.options.socketBacklog
            )
        }
        catch {
            throw .connection(.socket(error))
        }
        
        // start listening for connections
        self.storage.socket = socket
        self.log?("Started GATT Server")
        // listen for
        while self.storage.isAdvertising, let socket = self.storage.socket {
            self.accept(socket)
        }
    }
    
    public func start(options: BTStackPeripheralAdvertisingOptions) throws(Error) {
        assert(isAdvertising == false)
        
        // use public or random address
        let address: BluetoothAddress
        if let randomAddress = options.randomAddress {
            address = randomAddress
            //try await hostController.lowEnergySetRandomAddress(randomAddress)
        } else {
            address = hostController.address
        }
        
        // set advertising data and scan response
        if options.advertisingData != nil || options.scanResponse != nil {
            hostController.isAdvertising = false
        }
        if let advertisingData = options.advertisingData {
            hostController.advertisement = advertisingData
        }
        if let scanResponse = options.scanResponse {
            hostController.scanResponse = scanResponse
        }
        
        // enable advertising
        hostController.isAdvertising = true
        
        // start listening thread
        try start(
            address: address,
            isRandom: options.randomAddress != nil
        )
    }
    
    public func stop() {
        storage.stop()
        log?("Stopped GATT Server")
    }
    
    public func add(service: GATTAttribute<Data>.Service) -> (UInt16, [UInt16]) {
        return storage.add(service: service)
    }
    
    public func remove(service handle: UInt16) {
        storage.remove(service: handle)
    }
    
    public func removeAllServices() {
        storage.removeAllServices()
    }
    
    /// Modify the value of a characteristic, optionally emiting notifications if configured on active connections.
    public func write(_ newValue: Data, forCharacteristic handle: UInt16) {
        write(newValue, forCharacteristic: handle, ignore: .none)
    }
    
    public func write(_ newValue: Data, forCharacteristic handle: UInt16, for central: Central) throws(Error) {
        guard let connection = storage.connections[central] else {
            throw .disconnected(central)
        }
        connection.write(newValue, forCharacteristic: handle)
    }
    
    /// Read the value of the characteristic with specified handle.
    public subscript(characteristic handle: UInt16) -> Data {
        storage.database[handle: handle].value
    }
    
    public func value(for characteristicHandle: UInt16, central: Central) throws(Error) -> Data {
        guard let connection = storage.connections[central] else {
            throw .disconnected(central)
        }
        return connection[characteristicHandle]
    }
    
    /// Return the handles of the characteristics matching the specified UUID.
    public func characteristics(for uuid: BluetoothUUID) -> [UInt16] {
        return storage.database
            .lazy
            .filter { $0.uuid == uuid }
            .map { $0.handle }
    }
}

internal extension BTStackPeripheral {
    
    func log(_ central: Central, _ message: String) {
        log?("[\(central)]: " + message)
    }
    
    /// Modify the value of a characteristic, optionally emiting notifications if configured on active connections.
    func write(_ newValue: Data, forCharacteristic handle: UInt16, ignore central: Central? = nil) {
        // write to master DB
        storage.write(newValue, forAttribute: handle)
        // propagate changes to active connections
        let connections = storage.connections
            .values
            .lazy
            .filter { $0.central != central }
        // update the DB of each connection, and send notifications concurrently
        for connection in connections {
            connection.write(newValue, forCharacteristic: handle)
        }
    }
    
    func callback(for central: Central) -> GATTServer<Socket.Connection>.Callback {
        var callback = GATTServer<Socket.Connection>.Callback()
        callback.willRead = {
            self.willRead(central: central, uuid: $0, handle: $1, value: $2, offset: $3)
        }
        callback.willWrite = {
            self.willWrite(central: central, uuid: $0, handle: $1, value: $2, newValue: $3)
        }
        callback.didWrite = { (uuid, handle, value) in
            self.didWrite(central: central, uuid: uuid, handle: handle, value: value)
        }
        return callback
    }
    
    func maximumUpdateValueLength(for central: Central) -> Int {
        guard let maximumUpdateValueLength = self.storage.connections[central]?.maximumUpdateValueLength else {
            assertionFailure()
            return Int(ATTMaximumTransmissionUnit.min.rawValue - 3)
        }
        return maximumUpdateValueLength
    }
    
    func willRead(central: Central, uuid: BluetoothUUID, handle: UInt16, value: Data, offset: Int) -> ATTError? {
        let maximumUpdateValueLength = maximumUpdateValueLength(for: central)
        let request = GATTReadRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: uuid,
            handle: handle,
            value: value,
            offset: offset
        )
        return willRead?(request)
    }
    
    func willWrite(central: Central, uuid: BluetoothUUID, handle: UInt16, value: Data, newValue: Data) -> ATTError? {
        let maximumUpdateValueLength = maximumUpdateValueLength(for: central)
        let request = GATTWriteRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: uuid,
            handle: handle,
            value: value,
            newValue: newValue
        )
        return willWrite?(request)
    }
    
    func didWrite(central: Central, uuid: BluetoothUUID, handle: UInt16, value: Data) {
        let maximumUpdateValueLength = maximumUpdateValueLength(for: central)
        let confirmation = GATTWriteConfirmation(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: uuid,
            handle: handle,
            value: value
        )
        // update DB and inform other connections
        write(confirmation.value, forCharacteristic: confirmation.handle, ignore: confirmation.central)
        // notify delegate
        didWrite?(confirmation)
    }
    
    func accept(
        _ socket: Socket
    ) {
        let log = self.log
        do {
            // wait for pending socket
            while socket.status.accept == false, socket.status.error == nil {
                sleep_ms(500)
            }
            let newSocket = try socket.accept()
            let central = Central(id: newSocket.address)
            log?("[\(central)]: New connection")
            let connection = GATTServerConnection<Socket.Connection>(
                central: central,
                socket: newSocket,
                maximumTransmissionUnit: options.maximumTransmissionUnit,
                maximumPreparedWrites: options.maximumPreparedWrites,
                database: storage.database,
                callback: callback(for: central),
                log: {
                    log?("[\(central)]: " + $0)
                }
            )
            storage.newConnection(connection)
            do {
                    while true {
                        sleep_ms(10)
                        // read and write
                        try connection.run()
                    }
                }
                catch {
                    //log?("[\(central)]: " + error.rawValue.description)
                }
                self.didDisconnect(central, log: log)
        }
        catch {
            log?("Error waiting for new connection: \(error)")
            sleep_ms(1000)
        }
    }
    
    func didDisconnect(
        _ central: Central,
        log: (@Sendable (String) -> ())?
    ) {
        // try advertising again
        hostController.isAdvertising = true
        // remove connection cache
        storage.removeConnection(central)
        // log
        log?("[\(central)]: " + "Did disconnect.")
    }
}

// MARK: - Supporting Types

public struct BTStackPeripheralOptions: Equatable, Hashable, Sendable {
    
    public var maximumTransmissionUnit: ATTMaximumTransmissionUnit
    
    public var maximumPreparedWrites: Int
    
    public var socketBacklog: Int
    
    public init(
        maximumTransmissionUnit: ATTMaximumTransmissionUnit = .max,
        maximumPreparedWrites: Int = 100,
        socketBacklog: Int = 20
    ) {
        assert(maximumPreparedWrites > 0)
        assert(socketBacklog > 0)
        self.maximumTransmissionUnit = maximumTransmissionUnit
        self.maximumPreparedWrites = maximumPreparedWrites
        self.socketBacklog = socketBacklog
    }
}

public struct BTStackPeripheralAdvertisingOptions: Equatable, Hashable, Sendable {
    
    public var advertisingData: LowEnergyAdvertisingData?
    
    public var scanResponse: LowEnergyAdvertisingData?
    
    public var randomAddress: BluetoothAddress?
    
    public init(
        advertisingData: LowEnergyAdvertisingData? = nil,
        scanResponse: LowEnergyAdvertisingData? = nil,
        randomAddress: BluetoothAddress? = nil
    ) {
        self.advertisingData = advertisingData
        self.scanResponse = scanResponse
        self.randomAddress = randomAddress
    }
}

public extension BTStackPeripheral {
    
    enum Error: Swift.Error {
        
        case library(BTStackError)
        case disconnected(Central)
        case connection(ATTConnectionError<BTStackError, [UInt8]>)
    }
}

internal extension BTStackPeripheral {
    
    struct Storage {
        
        var database = GATTDatabase<Data>()
        
        var willRead: ((GATTReadRequest<Central, Data>) -> ATTError?)?
        
        var willWrite: ((GATTWriteRequest<Central, Data>) -> ATTError?)?
        
        var didWrite: ((GATTWriteConfirmation<Central, Data>) -> ())?
        
        var log: (@Sendable (String) -> ())?
        
        var socket: Socket?
        
        var connections = [Central: GATTServerConnection<Socket.Connection>](minimumCapacity: 2)
                
        fileprivate init() { }
        
        var isAdvertising: Bool {
            socket != nil
        }
        
        mutating func stop() {
            assert(socket != nil)
            socket = nil
        }
        
        mutating func add(service: GATTAttribute<Data>.Service) -> (UInt16, [UInt16]) {
            var includedServicesHandles = [UInt16]()
            var characteristicDeclarationHandles = [UInt16]()
            var characteristicValueHandles = [UInt16]()
            var descriptorHandles = [[UInt16]]()
            let serviceHandle = database.add(
                service: service,
                includedServicesHandles: &includedServicesHandles,
                characteristicDeclarationHandles: &characteristicDeclarationHandles,
                characteristicValueHandles: &characteristicValueHandles,
                descriptorHandles: &descriptorHandles
            )
            return (serviceHandle, characteristicValueHandles)
        }
        
        mutating func remove(service handle: UInt16) {
            database.remove(service: handle)
        }
        
        mutating func removeAllServices() {
            database.removeAll()
        }
        
        mutating func write(_ value: Data, forAttribute handle: UInt16) {
            database.write(value, forAttribute: handle)
        }
        
        mutating func newConnection(
            _ connection: GATTServerConnection<Socket.Connection>
        ) {
            connections[connection.central] = connection
        }
        
        mutating func removeConnection(_ central: Central) {
            connections[central] = nil
        }
        
        mutating func maximumUpdateValueLength(for central: Central) -> Int? {
            connections[central]?.maximumUpdateValueLength
        }
    }
}
