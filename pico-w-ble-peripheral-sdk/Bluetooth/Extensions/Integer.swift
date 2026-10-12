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

internal extension UInt16 {
    
    /// Initializes value from two bytes.
    init(bytes: (UInt8, UInt8)) {
        self = unsafeBitCast(bytes, to: UInt16.self)
    }
    
    /// Converts to two bytes. 
    var bytes: (UInt8, UInt8) {
        return unsafeBitCast(self, to: (UInt8, UInt8).self)
    }
}

internal extension UInt32 {
    
    /// Initializes value from four bytes.
    init(bytes: (UInt8, UInt8, UInt8, UInt8)) {
        self = unsafeBitCast(bytes, to: UInt32.self)
    }
    
    /// Converts to four bytes.
    var bytes: (UInt8, UInt8, UInt8, UInt8) {
        return unsafeBitCast(self, to: (UInt8, UInt8, UInt8, UInt8).self)
    }
}

internal extension UInt64 {
    
    /// Initializes value from four bytes.
    init(bytes: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)) {
        self = unsafeBitCast(bytes, to: UInt64.self)
    }
    
    /// Converts to eight bytes.
    var bytes: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
        return unsafeBitCast(self, to: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8).self)
    }
}

internal extension BinaryInteger {
    
    @inlinable
    var bytes: [UInt8] {
        withUnsafeBytes(of: self) { Array($0) }
    }
    
    func forEachByte(_ block: (UInt8) -> ()) {
        withUnsafeBytes(of: self) {
            $0.forEach(block)
        }
    }
}

internal extension UInt8 {
    
    /// Initialize a byte from 2 bit enums.
    static func bit2(_ enum1: UInt8, _ enum2: UInt8, _ enum3: UInt8, _ enum4: UInt8) -> UInt8 {
        var value: UInt8 = 0
        value += enum1 << 6
        value += enum2 << 4
        value += enum3 << 2
        value += enum4
        return value
    }
    
    /// Get 2 bit values from a byte.
    func bit2() -> (UInt8, UInt8, UInt8, UInt8) {
        return (self >> 6, (self << 2) >> 6, (self << 4) >> 6, (self << 6) >> 6)
    }
}

internal extension UInt64 {
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    init?<Data: DataContainer>(bitmaskArray data: Data) {
        
        if data.count == MemoryLayout<UInt64>.size {
            self = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
        } else if data.count >= MemoryLayout<UInt32>.size {
            let rawValue = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
            self = UInt64(rawValue)
        } else if data.count >= MemoryLayout<UInt16>.size {
            let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            self = UInt64(rawValue)
        } else if data.count >= MemoryLayout<UInt8>.size {
            let rawValue = data[0]
            self = UInt64(rawValue)
        } else {
            return nil
        }
    }
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    var bitmaskArray: [UInt8] {
        
        if self <= numericCast(UInt8.max) {
            return [UInt8]([UInt8(self)])
        } else if self <= numericCast(UInt16.max) {
            let bytes = UInt16(self).littleEndian.bytes
            return [UInt8]([bytes.0, bytes.1])
        } else if self <= numericCast(UInt32.max) {
            let bytes = UInt32(self).littleEndian.bytes
            return [UInt8]([bytes.0, bytes.1, bytes.2, bytes.3])
        } else {
            let bytes = self.littleEndian.bytes
            return [UInt8]([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7])
        }
    }
}
