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

#if canImport(Foundation)
import Foundation
#endif

/// GAP Data Decoder
public struct GAPDataDecoder <Data: DataContainer> {
    
    // MARK: - Properties
        
    #if !hasFeature(Embedded)
    /// Ignore unknown types.
    public var ignoreUnknownType: Bool = false
    
    public var types = [GAPData.Type]() {
        didSet {
            dataTypes = [GAPDataType: GAPData.Type](minimumCapacity: types.count)
            types.forEach { dataTypes[$0.dataType] = $0 }
        }
    }
    
    internal private(set) var dataTypes: [GAPDataType: GAPData.Type] = [:]
    #endif
    
    // MARK: - Initialization
    
    /// Initialize with default data types.
    public init() {
        
        #if !hasFeature(Embedded)
        /// initialize with default precomputed values
        self.types = Self.defaultTypes
        self.dataTypes = Self.defaultDataTypes
        #endif
    }
    
    // MARK: - Methods
    
    #if !hasFeature(Embedded)
    public func decode(from data: Data) throws(GAPDataDecoderError) -> [GAPData] {
        return try decode(data: data, reserveCapacity: 3)
    }
    
    @usableFromInline
    internal func decode(data: Data, reserveCapacity capacity: Int) throws(GAPDataDecoderError) -> [GAPData] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPData]()
        elements.reserveCapacity(capacity)
        
        var offset = 0
        try Self.decode(data: data, offset: &offset) { (type, slice, offset) throws(GAPDataDecoderError) in
            if let gapType = dataTypes[type] {
                guard let decodable = gapType.init(data: slice)
                    else { throw .cannotDecode(type, offset: offset) }
                elements.append(decodable)
                return true
            } else if ignoreUnknownType {
                return true
            } else {
                throw .unknownType(type, offset: offset)
            }
        }
        
        return elements
    }
    
    @usableFromInline
    internal static func decode(data: Data, reserveCapacity capacity: Int = 3) throws(GAPDataDecoderError) -> [(GAPDataType, Data)] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [(GAPDataType, Data)]()
        elements.reserveCapacity(capacity)
        
        var offset = 0
        try decode(data: data, offset: &offset) { (type, data, offset) in
            elements.append((type, data))
            return true
        }
        
        return elements
    }
    #endif
    
    @usableFromInline
    internal static func decode(data: Data, offset: inout Int, _ block: (GAPDataType, Data, Int) throws(GAPDataDecoderError) -> (Bool)) throws(GAPDataDecoderError) {
        
        while offset < data.count {
            
            // get length
            let length = Int(data[offset]) // 0
            offset += 1
            guard offset < data.count else {
                if length == 0 {
                    break // EOF
                } else {
                    throw .insufficientBytes(expected: offset + 1, actual: data.count)
                }
            }
            
            // get type
            let type = GAPDataType(rawValue: data[offset]) // 1
            
            // ignore zeroed bytes
            guard (type.rawValue == 0 && length == 0) == false
                else { break }
            
            // get value
            let slice: Data
            
            if length > 0 {
                let dataRange = offset + 1 ..< offset + length // 2 ..< 2 + length
                offset = dataRange.upperBound
                guard offset <= data.count
                    else { throw .insufficientBytes(expected: offset + 1, actual: data.count) }
                
                slice = data.subdata(in: dataRange)
            } else {
                slice = Data()
            }
            
            // process and continue
            guard try block(type, slice, offset) else { return }
        }
    }
}

internal extension GAPDataDecoder {
    
    static func decodeFirst<T: GAPData>(_ type: T.Type, _ offset: inout Int, _ data: Data) throws(GAPDataDecoderError) -> T? {
        
        var offset = 0
        var value: T?
        try decode(data: data, offset: &offset) { (dataType, slice, offset) throws(GAPDataDecoderError) in
            guard dataType == T.dataType else { return true }
            value = T.init(data: slice)
            guard value != nil else {
                throw .cannotDecode(dataType, offset: offset)
            }
            return false
        }
        return value
    }
    
    static func decodeFirst<T: GAPData>(_ type: T.Type, from data: Data) throws(GAPDataDecoderError) -> T? {
        
        var offset = 0
        return try decodeFirst(type, &offset, data)
    }
}

public extension GAPDataDecoder {
    
    static func decode<T: GAPData>(_ type: T.Type, from data: Data) throws(GAPDataDecoderError) -> T {
        
        var offset = 0
        guard let value = try decodeFirst(type, &offset, data) else {
            throw .notFound(T.dataType)
        }
        return value
    }
    
    static func decode<T0: GAPData, T1: GAPData>(_ type0: T0.Type, _ type1: T1.Type, from data: Data) throws(GAPDataDecoderError) -> (T0, T1) {
        
        var offset = 0
        guard let value0 = try decodeFirst(type0, &offset, data) else {
            throw .notFound(T0.dataType)
        }
        guard let value1 = try decodeFirst(type1, &offset, data) else {
            throw .notFound(T1.dataType)
        }
        return (value0, value1)
    }
    
    static func decode<T0: GAPData, T1: GAPData, T2: GAPData>(_ type0: T0.Type, _ type1: T1.Type, _ type2: T2.Type, from data: Data) throws(GAPDataDecoderError) -> (T0, T1, T2) {
        
        var offset = 0
        guard let value0 = try decodeFirst(type0, &offset, data) else {
            throw .notFound(T0.dataType)
        }
        guard let value1 = try decodeFirst(type1, &offset, data) else {
            throw .notFound(T1.dataType)
        }
        guard let value2 = try decodeFirst(type2, &offset, data) else {
            throw .notFound(T2.dataType)
        }
        return (value0, value1, value2)
    }
    
    static func decode<T0: GAPData, T1: GAPData, T2: GAPData, T3: GAPData>(_ type0: T0.Type, _ type1: T1.Type, _ type2: T2.Type, _ type3: T3.Type, from data: Data) throws(GAPDataDecoderError) -> (T0, T1, T2, T3) {
        
        var offset = 0
        guard let value0 = try decodeFirst(type0, &offset, data) else {
            throw .notFound(T0.dataType)
        }
        guard let value1 = try decodeFirst(type1, &offset, data) else {
            throw .notFound(T1.dataType)
        }
        guard let value2 = try decodeFirst(type2, &offset, data) else {
            throw .notFound(T2.dataType)
        }
        guard let value3 = try decodeFirst(type3, &offset, data) else {
            throw .notFound(T3.dataType)
        }
        return (value0, value1, value2, value3)
    }
}

// MARK: - Supporting Types

/// GAP Data Decoder Error
public enum GAPDataDecoderError: Swift.Error, Sendable {
    
    case insufficientBytes(expected: Int, actual: Int)
    case cannotDecode(GAPDataType, offset: Int)
    case unknownType(GAPDataType, offset: Int)
    case notFound(GAPDataType)
}

// MARK: - Constants

#if !hasFeature(Embedded)
internal extension GAPDataDecoder {
    
    static var defaultDataTypes: [GAPDataType: GAPData.Type] {
        let defaultTypes = self.defaultTypes
        var types = [GAPDataType: GAPData.Type](minimumCapacity: defaultTypes.count)
        defaultTypes.forEach { types[$0.dataType] = $0 }
        return types
    }
    
    static var defaultTypes: [GAPData.Type] {
        [
            GAP3DInformation.self,
            GAPAdvertisingInterval.self,
            GAPAppearanceData.self,
            GAPChannelMapUpdateIndication.self,
            GAPClassOfDevice.self,
            GAPCompleteListOf16BitServiceClassUUIDs.self,
            GAPCompleteListOf32BitServiceClassUUIDs.self,
            GAPCompleteListOf128BitServiceClassUUIDs.self,
            GAPCompleteLocalName.self,
            GAPFlags.self,
            GAPIncompleteListOf16BitServiceClassUUIDs.self,
            GAPIncompleteListOf32BitServiceClassUUIDs.self,
            GAPIncompleteListOf128BitServiceClassUUIDs.self,
            GAPIndoorPositioning.self,
            GAPLEDeviceAddress.self,
            GAPLERole.self,
            GAPLESecureConnectionsConfirmation.self,
            GAPLESecureConnectionsRandom.self,
            //GAPLESupportedFeatures.self,
            GAPListOf16BitServiceSolicitationUUIDs.self,
            GAPListOf32BitServiceSolicitationUUIDs.self,
            GAPListOf128BitServiceSolicitationUUIDs.self,
            GAPManufacturerSpecificData<Data>.self,
            GAPMeshBeacon.self,
            GAPMeshMessage.self,
            GAPPBADV<Data>.self,
            GAPPublicTargetAddress.self,
            GAPRandomTargetAddress.self,
            GAPSecurityManagerOOBFlags.self,
            GAPSecurityManagerTKValue.self,
            GAPServiceData16BitUUID<Data>.self,
            GAPServiceData32BitUUID<Data>.self,
            GAPServiceData128BitUUID<Data>.self,
            GAPShortLocalName.self,
            GAPSimplePairingHashC.self,
            GAPSimplePairingRandomizerR.self,
            GAPSlaveConnectionIntervalRange.self,
            GAPTransportDiscoveryData<Data>.self,
            GAPTxPowerLevel.self,
            GAPURI.self
        ]
    }
}
#endif

