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

/// Find Information Response
///
/// The *Find Information Response* is sent in reply to a received *Find Information Request*
/// and contains information about this server.
@frozen
public struct ATTFindInformationResponse: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .findInformationResponse }
    
    /// The information data whose format is determined by the Format field.
    public var attributeData: AttributeData
    
    public init(attributeData: AttributeData) {
        
        self.attributeData = attributeData
    }
}

// MARK: - DataConvertible

extension ATTFindInformationResponse: DataConvertible {
    
    /// Length ranges from 6, to the maximum MTU size.
    internal static var minimumLength: Int { return 6 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= Self.minimumLength,
            Self.validateOpcode(data)
            else { return nil }
        
        let formatByte = data[1]
        let remainderData = data.subdata(in: 2 ..< data.count)
        
        guard let format = Format(rawValue: formatByte),
            let attributeData = AttributeData(data: remainderData, format: format)
            else { return nil }
        
        self.attributeData = attributeData
    }
    
    public var dataLength: Int {
        2 + attributeData.dataLength
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.attributeData.format.rawValue
        data += self.attributeData
    }
}

// MARK: - Supporting Types

internal extension ATTFindInformationResponse {
    
    enum Format: UInt8 {
        
        /// A list of 1 or more handles with their 16-bit Bluetooth UUIDs.
        case bit16      = 0x01
        
        /// A list of 1 or more handles with their 128-bit UUIDs.
        case bit128     = 0x02
        
        public init?(uuid: BluetoothUUID) {
            switch uuid {
            case .bit16: self = .bit16
            case .bit32: return nil
            case .bit128: self = .bit128
            }
        }
        
        internal var length: Int {
            switch self {
            case .bit16: return 4
            case .bit128: return 18
            }
        }
    }
}

internal protocol FindInformationResponseAttribute {
    
    associatedtype UUID
    
    /// Attribute Format
    static var format: ATTFindInformationResponse.Format { get }
    
    /// Attribute Handle
    var handle: UInt16 { get }
    
    /// Attribute UUID
    var uuid: UUID { get }
    
    init?<Data>(data: Data) where Data : DataContainer
}

public extension ATTFindInformationResponse {
    
    /// 16 Bit Attribute
    struct Attribute16Bit: Equatable, Hashable, FindInformationResponseAttribute, Sendable {
        
        internal static var format: Format { .bit16 }
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute UUID
        public let uuid: UInt16
    }
}

extension ATTFindInformationResponse.Attribute16Bit: DataConvertible {
    
    public init?<Data>(data: Data) where Data : DataContainer {
        guard data.count == Self.format.length else {
            return nil
        }
        self.init(data)
    }
    
    internal init<Data>(_ data: Data) where Data : DataContainer {
        assert(data.count == Self.format.length)
        let handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        self.init(handle: handle, uuid: uuid)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += handle.littleEndian
        data += uuid.littleEndian
    }
    
    public var dataLength: Int {
        Self.format.length
    }
}

public extension ATTFindInformationResponse {
    
    /// 128 Bit Attribute
    struct Attribute128Bit: Equatable, Hashable, FindInformationResponseAttribute, Sendable {
        
        internal static var format: Format { .bit128 }
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute UUID
        public let uuid: UInt128
    }
}

extension ATTFindInformationResponse.Attribute128Bit: DataConvertible {
    
    public init?<Data>(data: Data) where Data : DataContainer {
        guard data.count == Self.format.length else {
            return nil
        }
        self.init(data)
    }
    
    internal init<Data>(_ data: Data) where Data : DataContainer {
        assert(data.count == Self.format.length)
        let handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let uuidBytes = data.subdata(in: 2 ..< 18)
        assert(uuidBytes.count == UInt128.length)
        let uuid = UInt128(littleEndian: UInt128(data: uuidBytes)!)
        self.init(handle: handle, uuid: uuid)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += handle.littleEndian
        data += uuid.littleEndian
    }
    
    public var dataLength: Int {
        Self.format.length
    }
}

public extension ATTFindInformationResponse {
    
    /// Found Attribute Data.
    enum AttributeData: Equatable, Hashable, Sendable {
        
        /// Handle and 16-bit Bluetooth UUID
        case bit16([Attribute16Bit])
        
        /// Handle and 128-bit UUIDs
        case bit128([Attribute128Bit])
    }
}

extension ATTFindInformationResponse.AttributeData {
    
    /// The data's format.
    internal var format: ATTFindInformationResponse.Format {
        switch self {
        case .bit16: return .bit16
        case .bit128: return .bit128
        }
    }
    
    /// Number of items.
    public var count: Int {
        switch self {
        case let .bit16(value): return value.count
        case let .bit128(value): return value.count
        }
    }
    
    internal init?<Data: DataContainer>(data: Data, format: ATTFindInformationResponse.Format) {
        switch format {
        case .bit16:
            guard let values = [ATTFindInformationResponse.Attribute16Bit](data: data) else {
                return nil
            }
            self = .bit16(values)
        case .bit128:
            guard let values = [ATTFindInformationResponse.Attribute128Bit](data: data) else {
                return nil
            }
            self = .bit128(values)
        }
    }
}

internal extension Array where Element: FindInformationResponseAttribute {
    
    init?<Data: DataContainer>(data: Data) {
        let format = Element.format
        let pairLength = format.length
        
        guard data.count % pairLength == 0
            else { return nil }
        
        let pairCount = data.count / pairLength
        var pairs = [Element]()
        pairs.reserveCapacity(pairCount)
        
        for pairIndex in 0 ..< pairCount {
            let byteIndex = pairIndex * pairLength
            let pairBytes = data.subdata(in: byteIndex ..< byteIndex + pairLength)
            guard let element = Element(data: pairBytes) else {
                return nil
            }
            pairs.append(element)
        }
        self = pairs
    }
}

extension ATTFindInformationResponse.AttributeData {
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationResponse.AttributeData) {
        switch value {
        case let .bit16(attributes):
            data += attributes
        case let .bit128(attributes):
            data += attributes
        }
    }
    
    var dataLength: Int {
        switch self {
        case let .bit16(attributes):
            return ATTFindInformationResponse.Format.bit16.length * attributes.count
        case let .bit128(attributes):
            return ATTFindInformationResponse.Format.bit128.length * attributes.count
        }
    }
}
