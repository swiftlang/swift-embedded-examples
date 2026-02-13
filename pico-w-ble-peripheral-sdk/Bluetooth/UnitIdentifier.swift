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

@frozen
public struct UnitIdentifier: RawRepresentable, Equatable, Hashable, Sendable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UnitIdentifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension UnitIdentifier: CustomStringConvertible {
    
    public var description: String {
        let valueString = "0x" + rawValue.toHexadecimal()
        #if !os(WASI) && !hasFeature(Embedded)
        if let name = self.name {
            return valueString + " " + "(" + name + ")"
        } else {
            return valueString
        }
        #else
        return valueString
        #endif
    }
}

// MARK: - Definitions

#if !os(WASI) && !hasFeature(Embedded)
public extension UnitIdentifier {
    
    /// The name of the unit.
    var name: String? {
        return Self.unitIdentifiers[rawValue]?.name
    }
    
    /// The Bluetooth type namespace of the unit.
    var type: String? {
        return Self.unitIdentifiers[rawValue]?.type
    }
}
#endif
