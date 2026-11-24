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

// MARK: - ByteValue

extension UInt128 {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
        
    public var bytes: ByteValue {
      @_transparent
      get {
          unsafeBitCast(self, to: ByteValue.self)
      }
    
      @_transparent
      set {
          self = .init(bytes: newValue)
      }
    }
    
    public init(bytes: ByteValue) {
        self = unsafeBitCast(bytes, to: Self.self)
    }
}

// MARK: - Data Convertible

public extension UInt128 {
    
    static var length: Int { return 16 }
    
    init?<Data: DataContainer>(data: Data) {
        guard data.count == UInt128.length
            else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
}

// MARK: - UUID

public extension UInt128 {
    
    init(uuid: UUID) {
        /// UUID is always big endian
        let bigEndian = UInt128(bytes: uuid.uuid)
        self.init(bigEndian: bigEndian)
    }
}

public extension UUID {
    
    init(_ value: UInt128) {
        
        // UUID is always stored in big endian bytes
        let bytes = value.bigEndian.bytes
        
        self.init(bytes: (bytes.0,
                          bytes.1,
                          bytes.2,
                          bytes.3,
                          bytes.4,
                          bytes.5,
                          bytes.6,
                          bytes.7,
                          bytes.8,
                          bytes.9,
                          bytes.10,
                          bytes.11,
                          bytes.12,
                          bytes.13,
                          bytes.14,
                          bytes.15))
    }
}
