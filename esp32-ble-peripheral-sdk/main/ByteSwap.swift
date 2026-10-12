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

/// A Bluetooth value that is stored in the CPU native endianess format.
public protocol ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    var byteSwapped: Self { get }
}

public extension ByteSwap {
    
    /// Creates an instance from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new instance.
    init(littleEndian value: Self) {
        #if _endian(little)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// Creates an instance from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new instance.
    init(bigEndian value: Self) {
        #if _endian(big)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a little-endian platform, for any
    /// address `x`, `x == x.littleEndian`.
    var littleEndian: Self {
        #if _endian(little)
        return self
        #else
        return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a big-endian platform, for any
    /// address `x`, `x == x.bigEndian`.
    var bigEndian: Self {
        #if _endian(big)
        return self
        #else
        return byteSwapped
        #endif
    }
}
