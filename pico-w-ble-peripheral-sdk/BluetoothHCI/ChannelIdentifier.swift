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

/// Bluetooth Channel Identifier
@frozen
public struct ChannelIdentifier: RawRepresentable, Equatable, Hashable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
}

public extension ChannelIdentifier {
    
    static var att: ChannelIdentifier { return 4 }
}

// MARK: - ExpressibleByIntegerLiteral

extension ChannelIdentifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension ChannelIdentifier: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
