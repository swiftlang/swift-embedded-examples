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
 GAP Flag
 
 The Flags data type contains one bit Boolean flags. The Flags data type shall be included when any of the Flag bits are non-zero and the advertising packet is connectable, otherwise the Flags data type may be omitted. All 0x00 octets after the last non-zero octet shall be omitted from the value transmitted.
 
 - Note: If the Flags AD type is not present in a non-connectable advertisement, the Flags should be considered as unknown and no assumptions should be made by the scanner.
 
 Flags used over the LE physical channel are:
 
 • Limited Discoverable Mode
 
 • General Discoverable Mode
 
 • BR/EDR Not Supported
 
 • Simultaneous LE and BR/EDR to Same Device Capable (Controller)
 
 • Simultaneous LE and BR/EDR to Same Device Capable (Host)
 
 The LE Limited Discoverable Mode and LE General Discoverable Mode flags shall be ignored when received over the BR/EDR physical channel. The ‘BR/ EDR Not Supported’ flag shall be set to 0 when sent over the BR/EDR physical channel.
 
 The Flags field may be zero or more octets long. This allows the Flags field to be extended while using the minimum number of octets within the data packet.
 */
@frozen
public struct GAPFlags: GAPData, Equatable, Hashable, OptionSet, Sendable {
    
    public static var dataType: GAPDataType { .flags }
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - DataConvertible

extension GAPFlags: DataConvertible {
    
    public init?<Data>(data: Data) where Data : DataContainer {
        guard data.count == 1
            else { return nil }
        self.init(rawValue: data[0])
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += self.rawValue
    }
    
    public var dataLength: Int {
        1
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GAPFlags: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPFlags: ExpressibleByArrayLiteral { }

// MARK: - Constants

public extension GAPFlags {
    
    /**
    LE Limited Discoverable Mode
 
     - Note: Limited Discoverable Mode is used to suggest that the device should have a high priority to scanning devices and often the advertising interval used when in this mode is faster than when in the General Discoverable Mode. A device will be in Limited Discoverable Mode for a limited time only and the core specification recommends this be no more than one minute. A device whose Flags field indicates it is not discoverable just means scanning devices should ignore it.
     
     - SeeAlso: [Bluetooth Advertising Works](https://blog.bluetooth.com/advertising-works-part-2)
    */
    static var lowEnergyLimitedDiscoverableMode: GAPFlags   { 0b00000001 }
    
    /// LE General Discoverable Mode
    ///
    /// Use general discoverable mode to advertise indefinitely.
    static var lowEnergyGeneralDiscoverableMode: GAPFlags   { 0b00000010 }
    
    /// BR/EDR Not Supported.
    ///
    /// Bit 37 of LMP Feature Mask Definitions  (Page 0)
    static var notSupportedBREDR: GAPFlags                  { 0b00000100 }
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Controller).
    ///
    /// Bit 49 of LMP Feature Mask Definitions (Page 0)
    static var simultaneousController: GAPFlags             { 0b00001000 }
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Host).
    ///
    /// Bit 66 of LMP Feature Mask Definitions (Page 1)
    static var simultaneousHost: GAPFlags                   { 0b00010000 }
}

// MARK: - CustomStringConvertible

extension GAPFlags: CustomStringConvertible, CustomDebugStringConvertible {
    
    #if hasFeature(Embedded)
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(GAPFlags, StaticString)] = [
            (.lowEnergyLimitedDiscoverableMode, ".lowEnergyLimitedDiscoverableMode"),
            (.lowEnergyGeneralDiscoverableMode, ".lowEnergyGeneralDiscoverableMode"),
            (.notSupportedBREDR, ".notSupportedBREDR"),
            (.simultaneousController, ".simultaneousController"),
            (.simultaneousHost, ".simultaneousHost")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}
