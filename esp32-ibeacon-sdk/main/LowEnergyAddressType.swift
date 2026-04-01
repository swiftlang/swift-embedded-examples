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

/// Bluetooth Low Energy Address type
public enum LowEnergyAddressType: UInt8 {
    
    /// Public Device Address
    case `public`           = 0x00
    
    /// Random Device Address
    case random             = 0x01
    
    /// Public Identity Address (Corresponds to peer’s Resolvable Private Address). 
    ///
    /// This value shall only be used by the Host if either the Host or the 
    /// Controller does not support the LE Set Privacy Mode command.
    ///
    /// - Note: Requires Bluetooth 5.0
    case publicIdentity     = 0x02
    
    /// Random (static) Identity Address (Corresponds to peer’s Resolvable Private Address). 
    ///
    /// This value shall only be used by a Host if either the Host or the Controller does 
    /// not support the LE Set Privacy Mode command.
    ///
    /// - Note: Requires Bluetooth 5.0
    case randomIdentity     = 0x03
    
    /// Default Low Energy Address type (`.public`).
    public init() { self = .public }
}
