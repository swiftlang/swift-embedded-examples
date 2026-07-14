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

/**
 Apple iBeacon
 
 iBeacon is an exciting technology enabling new location awareness possibilities for apps. Leveraging Bluetooth Low Energy (BLE), a device with iBeacon technology can be used to establish a region around an object. This allows an iOS device to determine when it has entered or left the region, along with an estimation of proximity to a beacon . There are both hardware and software components to consider when using iBeacon technology, and this document will give an introduction to both, along with suggested uses and best practices to help ensure a highly effective deployment leading to an outstanding user experience.
 
 Devices with iBeacon technology can be powered using coin cell batteries for a month or longer, or operate for months at a time using larger batteries, or can be powered externally for extended periods of time. iOS devices can also be configured to generate iBeacon advertisements, although this functionality is limited in scope. This would be appropriate for uses such as a Point Of Sale or kiosk application, or for an application that wants to become an iBeacon for a short time while someone is actively using the application.
 
 - SeeAlso: [Getting Started with iBeacon](https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf).
 */
public struct AppleBeacon: Equatable, Sendable {
    
    /// The company that created this specification.
    public static var companyIdentifier: CompanyIdentifier { 76 }
    
    /// The unique ID of the beacons being targeted.
    ///
    /// Application developers should define a UUID specific to their app and deployment use case.
    public var uuid: UUID
    
    /// The value identifying a group of beacons.
    ///
    /// Further specifies a specific iBeacon and use case.
    /// For example, this could define a sub-region within a larger region defined by the UUID.
    public var major: UInt16
    
    /// The value identifying a specific beacon within a group.
    ///
    /// Allows further subdivision of region or use case, specified by the application developer.
    public var minor: UInt16
    
    /// The received signal strength indicator (RSSI) value (measured in decibels) for the device.
    public var rssi: Int8
    
    public init(uuid: UUID,
                major: UInt16 = 0,
                minor: UInt16 = 0,
                rssi: Int8) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.rssi = rssi
    }
}

public extension AppleBeacon {
    
    init?<Data: DataContainer>(manufacturerData: GAPManufacturerSpecificData<Data>) {
        
        let data = manufacturerData.additionalData
        
        guard manufacturerData.companyIdentifier == type(of: self).companyIdentifier,
            data.count == type(of: self).additionalDataLength
            else { return nil }
        
        let dataType = data[0]
        
        guard dataType == type(of: self).appleDataType
            else { return nil }
        
        let length = data[1]
        
        guard length == type(of: self).length
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
    
    func appendAdditionalManufacturerData <T: DataContainer> (to data: inout T) {
        
        data += type(of: self).appleDataType // tlvPrefix
        data += type(of: self).length
        data += UInt128(uuid: uuid).bigEndian // uuidBytes
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
