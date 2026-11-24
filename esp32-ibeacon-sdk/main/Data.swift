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

/// Data container type.
public protocol DataContainer: RandomAccessCollection where Self.Index == Int, Self.Element == UInt8, Self: Hashable, Self: Sendable {
    
    init()
    
    init<C: Collection> (_ collection: C) where C.Element == UInt8
    
    mutating func reserveCapacity(_ capacity: Int)
    
    subscript(index: Int) -> UInt8 { get }
        
    mutating func append(_ newElement: UInt8)
    
    mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int)
    
    mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8
    
    static func += (lhs: inout Self, rhs: UInt8)
    
    static func += <C: Collection> (lhs: inout Self, rhs: C) where C.Element == UInt8
    
    /// Return a new copy of the data in a specified range.
    ///
    /// - parameter range: The range to copy.
    func subdata(in range: Range<Index>) -> Self
}

extension LowEnergyAdvertisingData: DataContainer {
    
    public mutating func reserveCapacity(_ capacity: Int) {
        // does nothing
    }
    
    public func subdata(in range: Range<Int>) -> LowEnergyAdvertisingData {
        var data = LowEnergyAdvertisingData()
        data.length = UInt8(range.count)
        for (newIndex, oldIndex) in range.enumerated() {
            data[newIndex] = self[oldIndex]
        }
        return data
    }
}

extension Array: DataContainer where Self.Element == UInt8 {
    
    public static func += (lhs: inout Array<Element>, rhs: UInt8) {
        lhs.append(rhs)
    }
    
    public mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int) {
        let newCapacity = self.count + count
        self.reserveCapacity(newCapacity)
        for index in 0 ..< count {
            self.append(pointer[index])
        }
    }
    
    public func subdata(in range: Range<Int>) -> [UInt8] {
        .init(self[range])
    }
}

/// Can be converted into data.
internal protocol DataConvertible {
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: Self)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}

extension DataContainer {
    
    /// Initialize data with contents of value.
    init <T: DataConvertible> (_ value: T) {
        let length = value.dataLength
        self.init()
        self.reserveCapacity(length)
        self += value
        assert(self.count == length)
    }
}

extension DataContainer {
    
    mutating func append <T: DataConvertible> (_ value: T) {
        self += value
    }
}

// MARK: - UnsafeDataConvertible

/// Internal Data casting protocol
internal protocol UnsafeDataConvertible: DataConvertible { }

extension UnsafeDataConvertible {
    
    @usableFromInline
    var dataLength: Int {
        return MemoryLayout<Self>.size
    }
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: Self) {
        withUnsafePointer(to: value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<Self>.size) {
                data.append($0, count: MemoryLayout<Self>.size)
            }
        }
    }
}

extension UInt16: UnsafeDataConvertible { }
extension UInt32: UnsafeDataConvertible { }
extension UInt64: UnsafeDataConvertible { }
extension UInt128: UnsafeDataConvertible { }
extension BluetoothAddress: UnsafeDataConvertible { }