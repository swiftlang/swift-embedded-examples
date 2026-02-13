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

public extension AppleBeacon {
    
    init?<Data: DataContainer>(manufacturerData: GAPManufacturerSpecificData<Data>) {
        
        let data = manufacturerData.additionalData
        
        guard manufacturerData.companyIdentifier == Self.companyIdentifier,
            data.count == Self.additionalDataLength
            else { return nil }
        
        let dataType = data[0]
        
        guard dataType == Self.appleDataType
            else { return nil }
        
        let length = data[1]
        
        guard length == Self.length
            else { return nil }
        
        let uuid = UUID(UInt128(bigEndian: UInt128(data: data.subdata(in: 2 ..< 18))!))
        let major = UInt16(bigEndian: UInt16(bytes: (data[18], data[19])))
        let minor = UInt16(bigEndian: UInt16(bytes: (data[20], data[21])))
        let rssi = Int8(bitPattern: data[22])
        
        self.init(uuid: uuid, major: major, minor: minor, rssi: rssi)
    }
}

public extension GAPManufacturerSpecificData {
    
    init(beacon: AppleBeacon) {
        var additionalData = AdditionalData()
        additionalData.reserveCapacity(AppleBeacon.additionalDataLength)
        beacon.appendAdditionalManufacturerData(to: &additionalData)
        assert(additionalData.count == AppleBeacon.additionalDataLength)
        self.init(
            companyIdentifier: AppleBeacon.companyIdentifier,
            additionalData: additionalData
        )
    }
}

internal extension AppleBeacon {
        
    /// Apple iBeacon data type.
    static var appleDataType: UInt8 { 0x02 } // iBeacon
    
    /// The length of the TLV encoded data.
    static var length: UInt8 { 0x15 } // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    static var additionalDataLength: Int { return Int(length) + 2 }
    
    static func from(advertisingData: LowEnergyAdvertisingData) throws(GAPDataDecoderError) -> (beacon: AppleBeacon, flags: GAPFlags) {
        let (flags, manufacturerData) = try GAPDataDecoder.decode(GAPFlags.self, AppleBeacon.ManufacturerData.self, from: advertisingData)
        return (manufacturerData.beacon, flags)
    }
    
    func appendAdditionalManufacturerData <T: DataContainer> (to data: inout T) {
        
        data += Self.appleDataType // tlvPrefix
        data += Self.length
        data += BluetoothUUID(uuid: uuid).bigEndian // uuidBytes
        data += major.bigEndian
        data += minor.bigEndian
        data += UInt8(bitPattern: rssi)
    }
}

public extension LowEnergyAdvertisingData {
    
    init(beacon: AppleBeacon,
         flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]) {
        let manufacturerData = AppleBeacon.ManufacturerData(beacon) // storage on stack
        self = GAPDataEncoder.encode(flags, manufacturerData)
    }
}

internal extension AppleBeacon {
    
    struct ManufacturerData: GAPData {
        
        static var dataType: GAPDataType { .manufacturerSpecificData }
        
        internal let beacon: AppleBeacon
        
        init(_ beacon: AppleBeacon) {
            self.beacon = beacon
        }
        
        init?<Data>(data: Data) where Data : DataContainer {

            guard let manufacturerData = GAPManufacturerSpecificData<Data>(data: data),
                let beacon = AppleBeacon(manufacturerData: manufacturerData)
                else { return nil }
            
            self.init(beacon)
        }
        
        var dataLength: Int { return 2 + AppleBeacon.additionalDataLength }
        
        func append<Data>(to data: inout Data) where Data : DataContainer {
            data += self
        }
    }
}

extension AppleBeacon.ManufacturerData: DataConvertible {
    
    @usableFromInline
    static func += <Data>(data: inout Data, value: AppleBeacon.ManufacturerData) where Data : DataContainer {
        data += GAPManufacturerSpecificData<Data>(companyIdentifier: AppleBeacon.companyIdentifier)
        value.beacon.appendAdditionalManufacturerData(to: &data)
    }
}
