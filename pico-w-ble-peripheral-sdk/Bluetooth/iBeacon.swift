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

/**
 Apple iBeacon
 
 iBeacon is an exciting technology enabling new location awareness possibilities for apps. Leveraging Bluetooth Low Energy (BLE), a device with iBeacon technology can be used to establish a region around an object. This allows an iOS device to determine when it has entered or left the region, along with an estimation of proximity to a beacon . There are both hardware and software components to consider when using iBeacon technology, and this document will give an introduction to both, along with suggested uses and best practices to help ensure a highly effective deployment leading to an outstanding user experience.
 
 Devices with iBeacon technology can be powered using coin cell batteries for a month or longer, or operate for months at a time using larger batteries, or can be powered externally for extended periods of time. iOS devices can also be configured to generate iBeacon advertisements, although this functionality is limited in scope. This would be appropriate for uses such as a Point Of Sale or kiosk application, or for an application that wants to become an iBeacon for a short time while someone is actively using the application.
 
 - SeeAlso: [Getting Started with iBeacon](https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf).
 */
@frozen
public struct AppleBeacon: Equatable, Hashable, Sendable {
    
    #if !os(WASI)
    /// The company that created this specification.
    public static var companyIdentifier: CompanyIdentifier { return .apple }
    #endif
    
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
