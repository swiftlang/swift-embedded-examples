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

/// Generic Access Profile Data Type
///
/// ​​Assigned numbers are used in GAP for inquiry response, EIR data type values, manufacturer-specific data,
/// advertising data, low energy UUIDs and appearance characteristics, and class of device.
///
/// - SeeAlso:
/// [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
@frozen
public struct GAPDataType: RawRepresentable, Equatable, Hashable, Sendable {
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        
        self.rawValue = rawValue
    }
}

// MARK: - Defined Types

public extension GAPDataType {
    
    /// Flags
    ///
    /// **Reference**:
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, section 8.1.3 (v2.1 + EDR, 3.0 + HS and 4.0)
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, sections 11.1.3 and 18.1 (v4.0)
    ///
    /// Core Specification Supplement, Part A, section 1.3
    static let flags: GAPDataType = 0x01
    
    /// Incomplete List of 16-bit Service Class UUIDs
    static let incompleteListOf16BitServiceClassUUIDs: GAPDataType = 0x02
    
    /// Complete List of 16-bit Service Class UUIDs
    static let completeListOf16CitServiceClassUUIDs: GAPDataType = 0x03
    
    /// Incomplete List of 32-bit Service Class UUIDs
    static let incompleteListOf32BitServiceClassUUIDs: GAPDataType = 0x04
    
    /// Complete List of 32-bit Service Class UUIDs
    static let completeListOf32BitServiceClassUUIDs: GAPDataType = 0x05
    
    /// Incomplete List of 128-bit Service Class UUIDs
    static let incompleteListOf128BitServiceClassUUIDs: GAPDataType = 0x06
    
    /// Complete List of 128-bit Service Class UUIDs
    static let completeListOf128BitServiceClassUUIDs: GAPDataType = 0x07
    
    /// Shortened Local Name
    static let shortLocalName: GAPDataType = 0x08
    
    /// Complete Local Name
    static let completeLocalName: GAPDataType = 0x09
    
    /// TX Power Level
    static let txPowerLevel: GAPDataType = 0x0A
    
    /// Class of Device
    static let classOfDevice: GAPDataType = 0x0D
    
    /// Simple Pairing Hash C
    static let simplePairingHashC: GAPDataType = 0x0E
    
    /// Simple Pairing Randomizer
    static let simplePairingRandomizerR: GAPDataType = 0x0F
    
    /// Security Manager TK Value
    static let securityManagerTKValue: GAPDataType = 0x10
    
    /// Security Manager Out of Band Flags
    static let securityManagerOutOfBandFlags: GAPDataType = 0x11
    
    /// Slave Connection Interval Range
    static let slaveConnectionIntervalRange: GAPDataType = 0x12
    
    /// List of 16-bit Service Solicitation UUIDs
    static let listOf16BitServiceSolicitationUUIDs: GAPDataType = 0x14
    
    /// List of 128-bit Service Solicitation UUIDs
    static let listOf128BitServiceSolicitationUUIDs: GAPDataType = 0x15
    
    /// Service Data - 16-bit UUID
    static let serviceData16BitUUID: GAPDataType = 0x16
    
    /// Public Target Address
    static let publicTargetAddress: GAPDataType = 0x17
    
    /// Random Target Address
    static let randomTargetAddress: GAPDataType = 0x18
    
    /// Appearance
    static let appearance: GAPDataType = 0x19
    
    /// Advertising Interval
    static let advertisingInterval: GAPDataType = 0x1A
    
    /// LE Bluetooth Device Address
    static let lowEnergyDeviceAddress: GAPDataType = 0x1B
    
    /// LE Role
    static let lowEnergyRole: GAPDataType = 0x1C
    
    /// Simple Pairing Hash C-256
    static let simplePairingHashC256: GAPDataType = 0x1D
    
    /// Simple Pairing Randomizer R-256
    static let simplePairingRandomizerR256: GAPDataType = 0x1E
    
    /// List of 32-bit Service Solicitation UUIDs
    static let listOf32BitServiceSolicitationUUIDs: GAPDataType = 0x1F
    
    /// Service Data - 32-bit UUID
    static let serviceData32BitUUID: GAPDataType = 0x20
    
    /// Service Data - 128-bit UUID
    static let serviceData128BitUUID: GAPDataType = 0x21
    
    /// LE Secure Connections Confirmation Value
    static let lowEnergySecureConnectionsConfirmation: GAPDataType = 0x22
    
    /// LE Secure Connections Random Value
    static let lowEnergySecureConnectionsRandom: GAPDataType = 0x23
    
    /// URI
    static let uri: GAPDataType = 0x24
    
    /// Indoor Positioning
    static let indoorPositioning: GAPDataType = 0x25
    
    /// Transport Discovery Data
    static let transportDiscoveryData: GAPDataType = 0x26
    
    /// LE Supported Features
    static let lowEnergySupportedFeatures: GAPDataType = 0x27
    
    /// Channel Map Update Indication
    static let channelMapUpdateIndication: GAPDataType = 0x28
    
    /// PB-ADV
    static let pbAdv: GAPDataType = 0x29
    
    /// Mesh Message
    static let meshMessage: GAPDataType = 0x2A
    
    /// Mesh Beacon
    static let meshBeacon: GAPDataType = 0x2B
    
    /// 3D Information Data
    static let informationData3D: GAPDataType = 0x3D
    
    /// Manufacturer Specific Data
    static let manufacturerSpecificData: GAPDataType = 0xFF
}

// MARK: - ExpressibleByIntegerLiteral

extension GAPDataType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.rawValue = value
    }
}

// MARK: - CustomStringConvertible

#if hasFeature(Embedded)
extension GAPDataType: CustomStringConvertible {
    
    public var description: String {
        rawValue.description
    }
}
#else
extension GAPDataType: CustomStringConvertible {
    
    @inline(never)
    public var description: String {
        return name ?? "GAP Data Type (\(rawValue))"
    }
    
    @inline(never)
    public var name: String? {
        let names: [GAPDataType: String] = [
            .flags: "Flags",
            .incompleteListOf16BitServiceClassUUIDs: "Incomplete List of 16-bit Service Class UUIDs",
            .completeListOf16CitServiceClassUUIDs: "Complete List of 16-bit Service Class UUIDs",
            .incompleteListOf32BitServiceClassUUIDs: "Incomplete List of 32-bit Service Class UUIDs",
            .completeListOf32BitServiceClassUUIDs: "Complete List of 32-bit Service Class UUIDs",
            .incompleteListOf128BitServiceClassUUIDs: "Incomplete List of 128-bit Service Class UUIDs",
            .completeListOf128BitServiceClassUUIDs: "Complete List of 128-bit Service Class UUIDs",
            .shortLocalName: "Shortened Local Name",
            .completeLocalName: "Complete Local Name",
            .txPowerLevel: "Tx Power Level",
            .classOfDevice: "Class of Device",
            .simplePairingHashC: "Simple Pairing Hash C",
            .simplePairingRandomizerR: "Simple Pairing Randomizer R",
            .securityManagerTKValue: "Security Manager TK Value",
            .securityManagerOutOfBandFlags: "Security Manager Out of Band Flags",
            .slaveConnectionIntervalRange: "Slave Connection Interval Range",
            .listOf16BitServiceSolicitationUUIDs: "List of 16-bit Service Solicitation UUIDs",
            .listOf32BitServiceSolicitationUUIDs: "List of 32-bit Service Solicitation UUIDs",
            .listOf128BitServiceSolicitationUUIDs: "List of 128-bit Service Solicitation UUIDs",
            .serviceData16BitUUID: "Service Data - 16-bit UUID",
            .serviceData32BitUUID: "Service Data - 32-bit UUID",
            .serviceData128BitUUID: "Service Data - 128-bit UUID",
            .publicTargetAddress: "Public Target Address",
            .randomTargetAddress: "Random Target Address",
            .appearance: "Appearance",
            .advertisingInterval: "Advertising Interval",
            .lowEnergyDeviceAddress: "LE Bluetooth Device Address",
            .lowEnergyRole: "LE Role",
            .lowEnergySecureConnectionsConfirmation: "LE Secure Connections Confirmation Value",
            .lowEnergySecureConnectionsRandom: "LE Secure Connections Random Value",
            .uri: "URI",
            .indoorPositioning: "Indoor Positioning",
            .transportDiscoveryData: "Transport Discovery Data",
            .lowEnergySupportedFeatures: "LE Supported Features",
            .channelMapUpdateIndication: "Channel Map Update Indication",
            .pbAdv: "PB-ADV",
            .meshMessage: "Mesh Message",
            .meshBeacon: "Mesh Beacon",
            .informationData3D: "3D Information Data",
            .manufacturerSpecificData: "Manufacturer Specific Data"
        ]
        return names[self]
    }
}

#endif
