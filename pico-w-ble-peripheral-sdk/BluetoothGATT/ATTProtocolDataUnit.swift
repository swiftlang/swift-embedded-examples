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

// MARK: - Protocol Definition

/// Data packet for the ATT protocol.
public protocol ATTProtocolDataUnit: DataConvertible {
    
    /// The PDU's attribute opcode.
    static var attributeOpcode: ATTOpcode { get }
}

internal extension ATTProtocolDataUnit {
    
    static func validateOpcode<Data: DataContainer>(_ data: Data) -> Bool {
        return data.first == attributeOpcode.rawValue
    }
}

// MARK: - Supporting Types

internal protocol ATTAttributeDataList: ATTProtocolDataUnit {
    
    associatedtype AttributeData: ATTAttributeData
    
    static var headerLength: Int { get }
}

internal protocol ATTAttributeData: DataConvertible { }

extension ATTAttributeDataList {
    
    static var headerLength: Int { return 2 }
}

internal extension ATTAttributeDataList where AttributeData: DataConvertible {
    
    static func validate(_ attributeData: [AttributeData]) -> Bool {
        
        // must have at least one item
        guard let valueLength = attributeData.first?.dataLength
            else { return false }
        
        for attributeData in attributeData {
            // all items must have same length
            guard attributeData.dataLength == valueLength
                else { return false }
        }
        return true
    }
    
    static func dataLength <T: Collection> (for attributes: T) -> Int where T.Element == AttributeData {
        assert(attributes.isEmpty == false)
        return attributes.reduce(headerLength, { $0 + $1.dataLength })
    }
    
    static func append <Data: DataContainer> (_ data: inout Data, _ attributeData: [AttributeData]) {
        data += attributeOpcode.rawValue
        data += UInt8(attributeData[0].dataLength)
        data += attributeData
    }
}

internal extension ATTAttributeDataList {

    static func from<Data: DataContainer>(data: Data) -> [AttributeData]? {
        
        guard data.count > headerLength,
            validateOpcode(data)
            else { return nil }
        
        let attributeDataLength = Int(data[1])
        
        let attributeDataByteCount = data.count - headerLength
        
        guard attributeDataByteCount % attributeDataLength == 0
            else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        guard attributeDataCount >= 1
            else { return nil }
        
        var attributeData = [AttributeData]()
        attributeData.reserveCapacity(attributeDataCount)
        
        for index in 0 ..< attributeDataCount {
            
            let byteIndex = headerLength + (index * attributeDataLength)
            
            let attributeBytes = data.subdata(in: byteIndex ..< byteIndex + attributeDataLength)
            
            guard let attribute = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeData.append(attribute)
        }
        
        return attributeData
    }
}
