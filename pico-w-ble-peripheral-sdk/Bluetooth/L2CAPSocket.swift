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

/// L2CAP Socket protocol.
public protocol L2CAPSocket {
        
    associatedtype Error: Swift.Error
    
    /// Socket address
    var address: BluetoothAddress { get }
    
    /// Socket status
    var status: L2CAPSocketStatus<Error> { get }
    
    /// Close socket.
    func close()
}

public protocol L2CAPServer: L2CAPSocket {
    
    associatedtype Connection: L2CAPConnection
    
    /// Creates a new server,
    static func lowEnergyServer(
        address: BluetoothAddress,
        isRandom: Bool,
        backlog: Int
    ) throws(Self.Error) -> Self
    
    func accept() throws(Self.Error) -> Connection
}

public protocol L2CAPConnection: L2CAPSocket {
    
    associatedtype Data: DataContainer
    
    /// Creates a new socket connected to the remote address specified.
    static func lowEnergyClient(
        address: BluetoothAddress,
        destination: BluetoothAddress,
        isRandom: Bool
    ) throws(Self.Error) -> Self
    
    var destination: BluetoothAddress { get }
    
    /// Write to the socket.
    func send(_ data: Data) throws(Self.Error)
    
    /// Reads from the socket.
    func receive(_ bufferSize: Int) throws(Self.Error) -> Self.Data
        
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws(Self.Error)
    
    /// Get security level
    //var securityLevel: SecurityLevel { get throws(Self.Error) }
    func securityLevel() throws(Self.Error) -> SecurityLevel
}

/// L2CAP Socket Status
public struct L2CAPSocketStatus<Error: Swift.Error>: Sendable {
    
    /// Socket is ready for a write operation.
    public var send: Bool
    
    /// Socket is ready for a read operation.
    public var recieve: Bool
    
    /// Socket has a pending new connection.
    public var accept: Bool
    
    /// Socket encountered an error.
    public var error: Error?
    
    public init(
        send: Bool = false,
        recieve: Bool = false,
        accept: Bool = false,
        error: Error? = nil
    ) {
        self.send = send
        self.recieve = recieve
        self.accept = accept
        self.error = error
    }
}

extension L2CAPSocketStatus: Equatable where Error: Equatable { }

extension L2CAPSocketStatus: Hashable where Error: Hashable { }
