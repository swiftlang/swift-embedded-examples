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

/// Read Multiple Request
///
/// The *Read Multiple Request* is used to request the server to read two or more values
/// of a set of attributes and return their values in a *Read Multiple Response*.
///
/// Only values that have a known fixed size can be read, with the exception of the last value that can have a variable length.
/// The knowledge of whether attributes have a known fixed size is defined in a higher layer specification.
@frozen
public struct ATTReadMultipleRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readMultipleRequest }
    
    /// The handles of the attributes to read.
    public let handles: [UInt16]
    
    public init?(handles: [UInt16]) {
        guard handles.count >= 2
            else { return nil }
        self.handles = handles
    }
}

// MARK: - DataConvertible

extension ATTReadMultipleRequest: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 5,
            Self.validateOpcode(data)
            else { return nil }
        
        let handleCount = (data.count - 1) / 2
        
        guard (data.count - 1) % 2 == 0
            else { return nil }
        
        // preallocate handle buffer
        let handles = (0 ..< handleCount).map { index in
            let handleIndex = 1 + (index * 2)
            return UInt16(littleEndian: UInt16(bytes: (data[handleIndex], data[handleIndex + 1])))
        }
        
        self.init(handles: handles)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handles
    }
    
    public var dataLength: Int {
        1 + (2 * handles.count)
    }
}
