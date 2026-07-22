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

/// Bluetooth security level.
public enum SecurityLevel: UInt8, Sendable {
    
    case sdp        = 0
    case low        = 1
    case medium     = 2
    case high       = 3
    case fips       = 4
    
    public init() { self = .sdp }
}

// MARK: - Comparable

extension SecurityLevel: Comparable {
    
    public static func < (lhs: SecurityLevel, rhs: SecurityLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
