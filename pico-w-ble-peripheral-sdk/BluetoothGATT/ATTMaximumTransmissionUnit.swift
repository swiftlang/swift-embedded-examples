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

/// ATT Maximum Transmission Unit
@frozen
public struct ATTMaximumTransmissionUnit: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue <= ATTMaximumTransmissionUnit.max.rawValue,
            rawValue >= ATTMaximumTransmissionUnit.min.rawValue
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    fileprivate init(_ unsafe: UInt16) {
        self.rawValue = unsafe
    }
}

private extension ATTMaximumTransmissionUnit {
    
    var isValid: Bool {
        return (ATTMaximumTransmissionUnit.min.rawValue ... ATTMaximumTransmissionUnit.max.rawValue).contains(rawValue)
    }
}

public extension ATTMaximumTransmissionUnit {
    
    static var `default`: ATTMaximumTransmissionUnit { ATTMaximumTransmissionUnit(23) }
    
    static var min: ATTMaximumTransmissionUnit { .default }
    
    static var max: ATTMaximumTransmissionUnit { ATTMaximumTransmissionUnit(517) }
    
    init(
        server: UInt16,
        client: UInt16
    ) {
        let mtu = Swift.min(Swift.max(Swift.min(client, server), ATTMaximumTransmissionUnit.default.rawValue), ATTMaximumTransmissionUnit.max.rawValue)
        self.init(mtu)
        assert(isValid)
    }
}

// MARK: - CustomStringConvertible

extension ATTMaximumTransmissionUnit: CustomStringConvertible {
    
    public var description: String {
        return rawValue.description
    }
}

// MARK: - Comparable

extension ATTMaximumTransmissionUnit: Comparable {
    
    public static func < (lhs: ATTMaximumTransmissionUnit, rhs: ATTMaximumTransmissionUnit) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
