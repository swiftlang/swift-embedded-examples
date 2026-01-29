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

/// Bluetooth Low Energy Advertising Data
public struct LowEnergyAdvertisingData: Sendable {
    
    public typealias Element = UInt8
    
    // MARK: - ByteValue
    
    /// Raw Bluetooth Low Energy Advertising Data 31 byte value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    // MARK: - Properties
    
    public var length: UInt8 {
        didSet { precondition(length <= 31, "LE Advertising Data can only less than or equal to 31 octets") }
    }
    
    public var bytes: ByteValue
    
    // MARK: - Initialization
    
    public init(length: UInt8, bytes: ByteValue) {
        
        precondition(length <= 31, "LE Advertising Data can only less than or equal to 31 octets")
        self.bytes = bytes
        self.length = length
    }
    
    public init() {
        
        self.length = 0
        self.bytes = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    }
}

public extension LowEnergyAdvertisingData {
    
    static var capacity: Int { return 31 }
}

public extension LowEnergyAdvertisingData {
    
    /// Unsafe data access.
    func withUnsafePointer <Result> (_ block: (UnsafePointer<UInt8>) throws -> Result) rethrows -> Result {
        return try Swift.withUnsafePointer(to: bytes) {
            try $0.withMemoryRebound(to: UInt8.self, capacity: LowEnergyAdvertisingData.capacity) {
                try block($0)
            }
        }
    }
}

public extension LowEnergyAdvertisingData {
    
    init<Data: DataContainer>(data: Data) {
        self.init(data)
    }
    
    init<C: Collection> (_ collection: C) where C.Element == UInt8 {
        let length = collection.count
        precondition(length <= 31)
        self.init()
        self.length = UInt8(length)
        collection.enumerated().forEach {
            self[$0.offset] = $0.element
        }
    }
}

public extension LowEnergyAdvertisingData {
    
    mutating func append(_ byte: UInt8) {
        assert(count < 31)
        self[count] = byte
        self.length += 1
    }
    
    static func += (data: inout LowEnergyAdvertisingData, byte: UInt8) {
        data.append(byte)
    }
    
    mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8 {
        assert(count + bytes.count <= LowEnergyAdvertisingData.capacity)
        for (index, byte) in bytes.enumerated() {
            self[count + index] = byte
        }
        self.length += UInt8(bytes.count)
    }
    
    static func += <C: Collection> (data: inout LowEnergyAdvertisingData, bytes: C) where C.Element == UInt8 {
        data.append(contentsOf: bytes)
    }
    
    mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int) {
        assert(self.count + count <= LowEnergyAdvertisingData.capacity)
        for index in 0 ..< count {
            self[self.count + index] = pointer.advanced(by: index).pointee
        }
        self.length += UInt8(count)
    }
}

// MARK: - Equatable

extension LowEnergyAdvertisingData: Equatable {
    
    public static func == (lhs: LowEnergyAdvertisingData, rhs: LowEnergyAdvertisingData) -> Bool {
        return lhs.length == rhs.length &&
            lhs.bytes.0 == rhs.bytes.0 &&
            lhs.bytes.1 == rhs.bytes.1 &&
            lhs.bytes.2 == rhs.bytes.2 &&
            lhs.bytes.3 == rhs.bytes.3 &&
            lhs.bytes.4 == rhs.bytes.4 &&
            lhs.bytes.5 == rhs.bytes.5 &&
            lhs.bytes.6 == rhs.bytes.6 &&
            lhs.bytes.7 == rhs.bytes.7 &&
            lhs.bytes.8 == rhs.bytes.8 &&
            lhs.bytes.9 == rhs.bytes.9 &&
            lhs.bytes.10 == rhs.bytes.10 &&
            lhs.bytes.11 == rhs.bytes.11 &&
            lhs.bytes.12 == rhs.bytes.12 &&
            lhs.bytes.13 == rhs.bytes.13 &&
            lhs.bytes.14 == rhs.bytes.14 &&
            lhs.bytes.15 == rhs.bytes.15 &&
            lhs.bytes.16 == rhs.bytes.16 &&
            lhs.bytes.17 == rhs.bytes.17 &&
            lhs.bytes.18 == rhs.bytes.18 &&
            lhs.bytes.19 == rhs.bytes.19 &&
            lhs.bytes.20 == rhs.bytes.20 &&
            lhs.bytes.21 == rhs.bytes.21 &&
            lhs.bytes.22 == rhs.bytes.22 &&
            lhs.bytes.23 == rhs.bytes.23 &&
            lhs.bytes.24 == rhs.bytes.24 &&
            lhs.bytes.25 == rhs.bytes.25 &&
            lhs.bytes.26 == rhs.bytes.26 &&
            lhs.bytes.27 == rhs.bytes.27 &&
            lhs.bytes.28 == rhs.bytes.28 &&
            lhs.bytes.29 == rhs.bytes.29 &&
            lhs.bytes.30 == rhs.bytes.30
    }
}

// MARK: - Hashable

extension LowEnergyAdvertisingData: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        length.hash(into: &hasher)
        withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - CustomStringConvertible

extension LowEnergyAdvertisingData: CustomStringConvertible {
    
    public var description: String {
        return toHexadecimal()
    }
}

// MARK: - ExpressibleByArrayLiteral

extension LowEnergyAdvertisingData: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt8...) {
        precondition(elements.count <= 31)
        self.init(elements)
    }
}

// MARK: - Sequence

extension LowEnergyAdvertisingData: Sequence {
    
    public func makeIterator() -> IndexingIterator<LowEnergyAdvertisingData> {
        return IndexingIterator(_elements: self)
    }
}

// MARK: - Collection

extension LowEnergyAdvertisingData: MutableCollection {
    
    public var count: Int {
        return Int(length)
    }
    
    public func index(after index: Int) -> Int {
        return index + 1
    }
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count
    }
    
    /// Get the byte at the specified index.
    public subscript (index: Int) -> UInt8 {
        
        get {
            
            switch index {
            case 0: return bytes.0
            case 1: return bytes.1
            case 2: return bytes.2
            case 3: return bytes.3
            case 4: return bytes.4
            case 5: return bytes.5
            case 6: return bytes.6
            case 7: return bytes.7
            case 8: return bytes.8
            case 9: return bytes.9
            case 10: return bytes.10
            case 11: return bytes.11
            case 12: return bytes.12
            case 13: return bytes.13
            case 14: return bytes.14
            case 15: return bytes.15
            case 16: return bytes.16
            case 17: return bytes.17
            case 18: return bytes.18
            case 19: return bytes.19
            case 20: return bytes.20
            case 21: return bytes.21
            case 22: return bytes.22
            case 23: return bytes.23
            case 24: return bytes.24
            case 25: return bytes.25
            case 26: return bytes.26
            case 27: return bytes.27
            case 28: return bytes.28
            case 29: return bytes.29
            case 30: return bytes.30
            default:
                fatalError("Invalid index")
            }
        }
        
        mutating set {
            
            switch index {
            case 0: bytes.0 = newValue
            case 1: bytes.1 = newValue
            case 2: bytes.2 = newValue
            case 3: bytes.3 = newValue
            case 4: bytes.4 = newValue
            case 5: bytes.5 = newValue
            case 6: bytes.6 = newValue
            case 7: bytes.7 = newValue
            case 8: bytes.8 = newValue
            case 9: bytes.9 = newValue
            case 10: bytes.10 = newValue
            case 11: bytes.11 = newValue
            case 12: bytes.12 = newValue
            case 13: bytes.13 = newValue
            case 14: bytes.14 = newValue
            case 15: bytes.15 = newValue
            case 16: bytes.16 = newValue
            case 17: bytes.17 = newValue
            case 18: bytes.18 = newValue
            case 19: bytes.19 = newValue
            case 20: bytes.20 = newValue
            case 21: bytes.21 = newValue
            case 22: bytes.22 = newValue
            case 23: bytes.23 = newValue
            case 24: bytes.24 = newValue
            case 25: bytes.25 = newValue
            case 26: bytes.26 = newValue
            case 27: bytes.27 = newValue
            case 28: bytes.28 = newValue
            case 29: bytes.29 = newValue
            case 30: bytes.30 = newValue
            default:
                fatalError("Invalid index")
            }
        }
    }
}

// MARK: - RandomAccessCollection

extension LowEnergyAdvertisingData: RandomAccessCollection {
        
    public subscript(bounds: Range<Int>) -> Slice<LowEnergyAdvertisingData> {
        return Slice<LowEnergyAdvertisingData>(base: self, bounds: bounds)
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
extension LowEnergyAdvertisingData: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        guard data.count <= LowEnergyAdvertisingData.capacity else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Invalid number of bytes (\(data.count)."))
        }
        self.init(data: data)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(Data(self))
    }
}
#endif
