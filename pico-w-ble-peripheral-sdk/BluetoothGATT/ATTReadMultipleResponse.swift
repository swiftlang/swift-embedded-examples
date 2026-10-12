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

/// Read Multiple Response
///
/// The read response is sent in reply to a received *Read Multiple Request* and
/// contains the values of the attributes that have been read.
@frozen
public struct ATTReadMultipleResponse<Values: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { return .readMultipleResponse }
    
    public var values: Values
    
    public init(values: Values) {
        self.values = values
    }
}

extension ATTReadMultipleResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        guard Self.validateOpcode(data)
            else { return nil }
        self.values = data.suffixCheckingBounds(from: 1)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.values
    }
    
    public var dataLength: Int {
        1 + values.count
    }
}
