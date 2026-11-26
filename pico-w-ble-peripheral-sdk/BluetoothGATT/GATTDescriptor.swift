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

/// GATT Characteristic Descriptor
public protocol GATTDescriptor: DataConvertible {
    
    /// Bluetooth UUID of the descriptor.
    static var uuid: BluetoothUUID { get }
    
    /// Decode from data.
    init?<Data: DataContainer>(data: Data)
    
    /// Encode to data.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension GATTAttribute.Descriptor {
    
    init<Descriptor: GATTDescriptor>(
        _ descriptor: Descriptor,
        permissions: ATTAttributePermissions = [.read]
    ) {
        self.init(
            uuid: Descriptor.uuid,
            value: Data(descriptor),
            permissions: permissions
        )
    }
}
