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
///
/// Implementation varies by operating system.
public protocol PeripheralManager {
    
    /// Central Peer
    ///
    /// Represents a remote central device that has connected to an app implementing the peripheral role on a local device.
    associatedtype Central: Peer
    
    associatedtype Data: DataContainer
    
    associatedtype Error: Swift.Error
    
    var log: (@Sendable (String) -> ())? { get set }
    
    /// Start advertising the peripheral and listening for incoming connections.
    func start() throws(Error)
    
    /// Stop the peripheral.
    func stop()
    
    /// A Boolean value that indicates whether the peripheral is advertising data.
    var isAdvertising: Bool { get }
    
    /// Attempts to add the specified service to the GATT database.
    ///
    /// - Returns: Handle for service declaration and handles for characteristic value handles.
    func add(service: GATTAttribute<Data>.Service) throws(Error) -> (UInt16, [UInt16])
    
    /// Removes the service with the specified handle.
    func remove(service: UInt16)
    
    /// Clears the local GATT database.
    func removeAllServices()
    
    /// Callback to handle GATT read requests.
    var willRead: ((GATTReadRequest<Central, Data>) -> ATTError?)? { get set }
    
    /// Callback to handle GATT write requests.
    var willWrite: ((GATTWriteRequest<Central, Data>) -> ATTError?)? { get set }
    
    /// Callback to handle post-write actions for GATT write requests.
    var didWrite: ((GATTWriteConfirmation<Central, Data>) -> ())? { get set }
    
    /// Modify the value of a characteristic, optionally emiting notifications if configured on active connections.
    func write(_ newValue: Data, forCharacteristic handle: UInt16)
    
    /// Modify the value of a characteristic, optionally emiting notifications if configured on the specified connection.
    ///
    /// Throws error if central is unknown or disconnected.
    func write(_ newValue: Data, forCharacteristic handle: UInt16, for central: Central) throws(Error)
    
    /// Read the value of the characteristic with specified handle.
    subscript(characteristic handle: UInt16) -> Data { get }
    
    /// Read the value of the characteristic with specified handle for the specified connection.
    func value(for characteristicHandle: UInt16, central: Central) throws(Error) -> Data
}

// MARK: - Supporting Types

public protocol GATTRequest {
    
    associatedtype Central: Peer
    
    associatedtype Data: DataContainer
    
    var central: Central { get }
    
    var maximumUpdateValueLength: Int { get }
    
    var uuid: BluetoothUUID { get }
    
    var handle: UInt16 { get }
    
    var value: Data { get }
}

public struct GATTReadRequest <Central: Peer, Data: DataContainer> : GATTRequest, Equatable, Hashable, Sendable {
    
    public let central: Central
    
    public let maximumUpdateValueLength: Int
    
    public let uuid: BluetoothUUID
    
    public let handle: UInt16
    
    public let value: Data
    
    public let offset: Int
    
    public init(central: Central,
                maximumUpdateValueLength: Int,
                uuid: BluetoothUUID,
                handle: UInt16,
                value: Data,
                offset: Int) {
        
        self.central = central
        self.maximumUpdateValueLength = maximumUpdateValueLength
        self.uuid = uuid
        self.handle = handle
        self.value = value
        self.offset = offset
    }
}

public struct GATTWriteRequest <Central: Peer, Data: DataContainer> : GATTRequest, Equatable, Hashable, Sendable {
    
    public let central: Central
    
    public let maximumUpdateValueLength: Int
    
    public let uuid: BluetoothUUID
    
    public let handle: UInt16
    
    public let value: Data
    
    public let newValue: Data
    
    public init(central: Central,
                maximumUpdateValueLength: Int,
                uuid: BluetoothUUID,
                handle: UInt16,
                value: Data,
                newValue: Data) {
        
        self.central = central
        self.maximumUpdateValueLength = maximumUpdateValueLength
        self.uuid = uuid
        self.handle = handle
        self.value = value
        self.newValue = newValue
    }
}

public struct GATTWriteConfirmation <Central: Peer, Data: DataContainer> : GATTRequest, Equatable, Hashable, Sendable {
    
    public let central: Central
    
    public let maximumUpdateValueLength: Int
    
    public let uuid: BluetoothUUID
    
    public let handle: UInt16
    
    public let value: Data
    
    public init(central: Central,
                maximumUpdateValueLength: Int,
                uuid: BluetoothUUID,
                handle: UInt16,
                value: Data) {
        
        self.central = central
        self.maximumUpdateValueLength = maximumUpdateValueLength
        self.uuid = uuid
        self.handle = handle
        self.value = value
    }
}

