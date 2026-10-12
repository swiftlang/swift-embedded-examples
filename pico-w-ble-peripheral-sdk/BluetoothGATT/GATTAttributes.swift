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

/// GATT Attribute
@frozen
public enum GATTAttribute <Data: DataContainer>: Equatable, Hashable, Sendable {
    
    case service(Service)
    case include(Include)
    case characteristic(Characteristic)
    case descriptor(Descriptor)
}

public extension GATTAttribute {
    
    typealias Permissions = ATTAttributePermissions
    
    /// GATT Service
    struct Service: Equatable, Hashable, Sendable {
        
        public var uuid: BluetoothUUID
        
        public var isPrimary: Bool
        
        public var characteristics: [Characteristic]
        
        public var includedServices: [Include]
        
        public init(
            uuid: BluetoothUUID,
            isPrimary: Bool = true,
            characteristics: [Characteristic] = [],
            includedServices: [Include] = []
        ) {
            self.uuid = uuid
            self.characteristics = characteristics
            self.isPrimary = isPrimary
            self.includedServices = includedServices
        }
    }
    
    /// GATT Include Declaration
    struct Include: Equatable, Hashable, Sendable {
        
        /// Included service handle
        public var serviceHandle: UInt16
        
        /// End group handle
        public var endGroupHandle: UInt16
        
        /// Included Service UUID
        public var serviceUUID: BluetoothUUID
        
        public init(
            serviceHandle: UInt16,
            endGroupHandle: UInt16,
            serviceUUID: BluetoothUUID
        ) {
            self.serviceHandle = serviceHandle
            self.endGroupHandle = endGroupHandle
            self.serviceUUID = serviceUUID
        }
    }
    
    /// GATT Characteristic
    struct Characteristic: Equatable, Hashable, Sendable {
        
        public typealias Properties = GATTCharacteristicProperties
        
        public var uuid: BluetoothUUID
        
        public var value: Data
        
        public var permissions: Permissions
        
        public var properties: Properties
        
        public var descriptors: [Descriptor]
        
        public init(
            uuid: BluetoothUUID,
            value: Data = Data(),
            permissions: Permissions = [.read],
            properties: Properties = [.read],
            descriptors: [Descriptor] = []
        ) {
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
            self.descriptors = descriptors
            self.properties = properties
        }
    }
    
    /// GATT Characteristic Descriptor
    struct Descriptor: Equatable, Hashable, Sendable {
                
        public var uuid: BluetoothUUID
        
        public var value: Data
        
        public var permissions: Permissions
        
        public init(
            uuid: BluetoothUUID = BluetoothUUID(),
            value: Data = Data(),
            permissions: Permissions = [.read]
        ) {
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
        }
    }
}
