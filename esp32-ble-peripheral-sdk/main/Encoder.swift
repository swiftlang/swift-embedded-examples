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

/// GAP Data Encoder
public struct GAPDataEncoder <Data: DataContainer> {
    
    // MARK: - Methods
    
    internal static func encode<T>(
        _ value: T,
        length: Int? = nil,
        to data: inout Data
    ) where T: GAPData {
        let length = length ?? value.dataLength // try to use precalculated length
        data += UInt8(length + 1)
        data += T.dataType.rawValue
        value.append(to: &data)
    }
}

// Generic specializations

public extension GAPDataEncoder {
    
    static func encode<T: GAPData>(_ value: T) -> Data {
        var data = Data()
        data.reserveCapacity(value.dataLength + 2)
        Self.encode(value, to: &data)
        return data
    }
    
    static func encode<T0: GAPData, T1: GAPData>(_ value0: T0, _ value1: T1) -> Data {
        var data = Data()
        let length = value0.dataLength
            + value1.dataLength
            + (2 * 2)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        return data
    }
    
    static func encode<T0: GAPData, T1: GAPData, T2: GAPData>(_ value0: T0, _ value1: T1, _ value2: T2) -> Data {
        var data = Data()
        let length = value0.dataLength
            + value1.dataLength
            + value2.dataLength
            + (2 * 3)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        Self.encode(value2, to: &data)
        return data
    }
    
    static func encode<T0: GAPData, T1: GAPData, T2: GAPData, T3: GAPData>(_ value0: T0, _ value1: T1, _ value2: T2, _ value3: T3) -> Data {
        var data = Data()
        let length = value0.dataLength
            + value1.dataLength
            + value2.dataLength
            + value3.dataLength
            + (2 * 4)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        Self.encode(value2, to: &data)
        Self.encode(value3, to: &data)
        return data
    }
}
