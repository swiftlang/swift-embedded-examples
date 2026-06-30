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

/// Type that represents a unit of measurement defined by Bluetooth.
public protocol BluetoothUnit: RawRepresentable {
    
    /// The unit of measurement type.
    static var unitType: UnitIdentifier { get }
}
