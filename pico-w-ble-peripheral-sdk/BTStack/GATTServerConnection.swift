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

internal final class GATTServerConnection <Socket: L2CAPConnection>: @unchecked Sendable {
    
    typealias Data = Socket.Data
    
    typealias Error = Socket.Error
    
    // MARK: - Properties
    
    public let central: Central
        
    private let server: GATTServer<Socket>
    
    public var maximumUpdateValueLength: Int {
        // ATT_MTU-3
        Int(server.maximumTransmissionUnit.rawValue) - 3
    }
    
    #if canImport(Foundation)
    private let lock = NSLock()
    #endif
    
    // MARK: - Initialization
    
    internal init(
        central: Central,
        socket: Socket,
        maximumTransmissionUnit: ATTMaximumTransmissionUnit,
        maximumPreparedWrites: Int,
        database: GATTDatabase<Socket.Data>,
        callback: GATTServer<Socket>.Callback,
        log: (@Sendable (String) -> ())?
    ) {
        self.central = central
        self.server = GATTServer(
            socket: socket,
            maximumTransmissionUnit: maximumTransmissionUnit,
            maximumPreparedWrites: maximumPreparedWrites,
            database: database,
            log: log
        )
        self.server.callback = callback
    }
    
    // MARK: - Methods
    
    /// Modify the value of a characteristic, optionally emiting notifications if configured on active connections.
    public func write(_ value: Data, forCharacteristic handle: UInt16) {
        #if canImport(Foundation)
        lock.lock()
        defer { lock.unlock() }
        #endif
        server.writeValue(value, forCharacteristic: handle)
    }
    
    public func run() throws(ATTConnectionError<Socket.Error, Socket.Data>) {
        #if canImport(Foundation)
        lock.lock()
        defer { lock.unlock() }
        #endif
        try self.server.run()
    }
    
    public subscript(handle: UInt16) -> Data {
        #if canImport(Foundation)
        lock.lock()
        defer { lock.unlock() }
        #endif
        return server.database[handle: handle].value
    }
}
