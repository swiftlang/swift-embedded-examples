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
    static var flags: GAPDataType                       { 0x01 }
    
    /// Shortened Local Name
    static var shortLocalName: GAPDataType              { 0x08 }
    
    /// Complete Local Name
    static var completeLocalName: GAPDataType           { 0x09 }
    
    /// Manufacturer Specific Data
    static var manufacturerSpecificData: GAPDataType    { 0xFF }
}

// MARK: - ExpressibleByIntegerLiteral

extension GAPDataType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.rawValue = value
    }
}

// MARK: - CustomStringConvertible

extension GAPDataType: CustomStringConvertible {
    
    public var description: String {
        rawValue.description
    }
}