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
 The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low energy ATT transactions.
 
 These error constants are based on the Bluetooth ATT error codes, defined in the Bluetooth 4.0 specification.
 For more information about these errors, see the Bluetooth 4.0 specification, Volume 3, Part F, Section 3.4.1.1.
 */
@frozen
public enum ATTError: UInt8, Error {
    
    /// Invalid Handle
    ///
    /// The attribute handle given was not valid on this server.
    case invalidHandle                              = 0x01
    
    /// Read Not Permitted
    ///
    /// The attribute cannot be read.
    case readNotPermitted                           = 0x02
    
    /// Write Not Permitted
    ///
    /// The attribute cannot be written.
    case writeNotPermitted                          = 0x03
    
    /// Invalid PDU
    ///
    /// The attribute PDU was invalid.
    case invalidPDU                                 = 0x04
    
    /// Insufficient Authentication
    ///
    /// The attribute requires authentication before it can be read or written.
    case insufficientAuthentication                 = 0x05
    
    /// Request Not Supported
    ///
    /// Attribute server does not support the request received from the client.
    case requestNotSupported                        = 0x06
    
    /// Invalid Offset
    ///
    /// Offset specified was past the end of the attribute.
    case invalidOffset                              = 0x07
    
    /// Insufficient Authorization
    ///
    /// The attribute requires authorization before it can be read or written.
    case insufficientAuthorization                  = 0x08
    
    /// Prepare Queue Full
    ///
    /// Too many prepare writes have been queued.
    case prepareQueueFull                           = 0x09
    
    /// Attribute Not Found
    ///
    /// No attribute found within the given attribute handle range.
    case attributeNotFound                          = 0x0A
    
    /// Attribute Not Long
    ///
    /// The attribute cannot be read or written using the *Read Blob Request*.
    case attributeNotLong                           = 0x0B
    
    /// Insufficient Encryption Key Size
    ///
    /// The *Encryption Key Size* used for encrypting this link is insufficient.
    case insufficientEncryptionKeySize              = 0x0C
    
    /// Invalid Attribute Value Length
    ///
    /// The attribute value length is invalid for the operation.
    case invalidAttributeValueLength                = 0x0D
    
    /// Unlikely Error
    ///
    /// The attribute request that was requested has encountered an error that was unlikely,
    /// and therefore could not be completed as requested.
    case unlikelyError                              = 0x0E
    
    /// Insufficient Encryption
    ///
    /// The attribute requires encryption before it can be read or written.
    case insufficientEncryption                     = 0x0F
    
    /// Unsupported Group Type
    ///
    /// The attribute type is not a supported grouping attribute as defined by a higher layer specification.
    case unsupportedGroupType                       = 0x10
    
    /// Insufficient Resources
    ///
    /// Insufficient Resources to complete the request.
    case insufficientResources                      = 0x11
}

// MARK: - CustomStringConvertible

extension ATTError: CustomStringConvertible {
    
    public var description: String {
        return name
    }
}

// MARK: - Description Values

public extension ATTError {
    
    var name: String {
        
        switch self {
        case .invalidHandle:
            return "Invalid Handle"
        case .readNotPermitted:
            return "Read Not Permitted"
        case .writeNotPermitted:
            return "Write Not Permitted"
        case .invalidPDU:
            return "Invalid PDU"
        case .insufficientAuthentication:
            return "Insufficient Authentication"
        case .requestNotSupported:
            return "Request Not Supported"
        case .invalidOffset:
            return "Invalid Offset"
        case .insufficientAuthorization:
            return "Insufficient Authorization"
        case .prepareQueueFull:
            return "Prepare Queue Full"
        case .attributeNotFound:
            return "Attribute Not Found"
        case .attributeNotLong:
            return "Attribute Not Long"
        case .insufficientEncryptionKeySize:
            return "Insufficient Encryption Key Size"
        case .invalidAttributeValueLength:
            return "Invalid Attribute Value Length"
        case .unlikelyError:
            return "Unlikely Error"
        case .insufficientEncryption:
            return "Insufficient Encryption"
        case .unsupportedGroupType:
            return "Unsupported Group Type"
        case .insufficientResources:
            return "Insufficient Resources"
        }
    }
    
    #if !hasFeature(Embedded)
    var errorDescription: String {
        
        switch self {
        case .invalidHandle:
            return "The attribute handle given was not valid on this server."
        case .readNotPermitted:
            return "The attribute cannot be read."
        case .writeNotPermitted:
            return "The attribute cannot be written."
        case .invalidPDU:
            return "The attribute PDU was invalid."
        case .insufficientAuthentication:
            return "The attribute requires authentication before it can be read or written."
        case .requestNotSupported:
            return "Attribute server does not support the request received from the client."
        case .invalidOffset:
            return "Offset specified was past the end of the attribute."
        case .insufficientAuthorization:
            return "The attribute requires authorization before it can be read or written."
        case .prepareQueueFull:
            return "Too many prepare writes have been queued."
        case .attributeNotFound:
            return "No attribute found within the given attri- bute handle range."
        case .attributeNotLong:
            return "The attribute cannot be read using the Read Blob Request."
        case .insufficientEncryptionKeySize:
            return "The Encryption Key Size used for encrypting this link is insufficient."
        case .invalidAttributeValueLength:
            return "The attribute value length is invalid for the operation."
        case .unlikelyError:
            return "The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested."
        case .insufficientEncryption:
            return "The attribute requires encryption before it can be read or written."
        case .unsupportedGroupType:
            return "The attribute type is not a supported grouping attribute as defined by a higher layer specification."
        case .insufficientResources:
            return "Insufficient Resources to complete the request."
        }
    }
    #endif
}

// MARK: - CustomNSError

#if canImport(Foundation)
extension ATTError: CustomNSError {
    
    public static var errorDomain: String {
        return "org.pureswift.Bluetooth.ATTError"
    }
    
    public var errorCode: Int {
        return Int(rawValue)
    }
    
    public var errorUserInfo: [String: Any] {
        
        return [
            NSLocalizedDescriptionKey: name,
            NSLocalizedFailureReasonErrorKey: errorDescription
        ]
    }
}
#endif
