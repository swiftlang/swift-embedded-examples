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

/// ATT protocol opcodes.
public enum ATTOpcode: UInt8, Sendable, CaseIterable {
    
    /// Error response
    case errorResponse                              = 0x01
    
    // Exchange MTU
    
    /// Maximum Transmission Unit Request
    case maximumTransmissionUnitRequest             = 0x02
    
    /// Maximum Transmission Unit Response
    case maximumTransmissionUnitResponse            = 0x03
    
    // Find Information
    case findInformationRequest                     = 0x04
    case findInformationResponse                    = 0x05
    
    // Find By Type Value
    case findByTypeRequest                          = 0x06
    case findByTypeResponse                         = 0x07
    
    // Read By Type
    case readByTypeRequest                          = 0x08
    case readByTypeResponse                         = 0x09
    
    // Read
    case readRequest                                = 0x0a
    case readResponse                               = 0x0b
    
    // Read Blob
    case readBlobRequest                            = 0x0c
    case readBlobResponse                           = 0x0d
    
    // Read Multiple
    case readMultipleRequest                        = 0x0e
    case readMultipleResponse                       = 0x0f
    
    // Read By Group Type
    case readByGroupTypeRequest                     = 0x10
    case readByGroupTypeResponse                    = 0x11
    
    // Write
    case writeRequest                               = 0x12
    case writeResponse                              = 0x13
    case writeCommand                               = 0x52
    case signedWriteCommand                         = 0xD2
    
    // Prepare Write
    case preparedWriteRequest                       = 0x16
    case preparedWriteResponse                      = 0x17
    
    // Execute Write
    case executeWriteRequest                        = 0x18
    case executeWriteResponse                       = 0x19
    
    // Handle Value
    case handleValueNotification                    = 0x1B
    case handleValueIndication                      = 0x1D
    case handleValueConfirmation                    = 0x1E
}

// MARK: - CustomStringConvertible

#if hasFeature(Embedded)
extension ATTOpcode: CustomStringConvertible {
    
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
}
#endif

// MARK: - Opcode Type

/// ATT protocol opcode categories.
@frozen
public enum ATTOpcodeType {
    
    case request
    case response
    case command
    case indication
    case notification
    case confirmation
}

public extension ATTOpcode {
    
    /// Specifies the opcode category.
    var type: ATTOpcodeType {
        
        switch self {
        case .errorResponse:                    return .response
        case .maximumTransmissionUnitRequest:   return .request
        case .maximumTransmissionUnitResponse:  return .response
        case .findInformationRequest:           return .request
        case .findInformationResponse:          return .response
        case .findByTypeRequest:                return .request
        case .findByTypeResponse:               return .response
        case .readByTypeRequest:                return .request
        case .readByTypeResponse:               return .response
        case .readRequest:                      return .request
        case .readResponse:                     return .response
        case .readBlobRequest:                  return .request
        case .readBlobResponse:                 return .response
        case .readMultipleRequest:              return .request
        case .readMultipleResponse:             return .response
        case .readByGroupTypeRequest:           return .request
        case .readByGroupTypeResponse:          return .response
        case .writeRequest:                     return .request
        case .writeResponse:                    return .response
        case .writeCommand:                     return .command
        case .signedWriteCommand:               return .command
        case .preparedWriteRequest:             return .request
        case .preparedWriteResponse:            return .response
        case .executeWriteRequest:              return .request
        case .executeWriteResponse:             return .response
        case .handleValueNotification:          return .notification
        case .handleValueIndication:            return .indication
        case .handleValueConfirmation:          return .confirmation
        }
    }
    
    /// Get the equivalent response for the current request opcode (if applicable).
    var response: ATTOpcode? {
        return Self.responsesByRequest[self]
    }
    
    /// Get the equivalent request for the current response opcode (if applicable).
    var request: ATTOpcode? {
        return Self.requestsByResponse[self]
    }
}

private extension ATTOpcode {
    
    // swiftlint:disable comma
    static let requestResponseMap: [(request: ATTOpcode,  response: ATTOpcode)] = [
        (maximumTransmissionUnitRequest,     maximumTransmissionUnitResponse),
        (findInformationRequest,             findInformationResponse),
        (findByTypeRequest,                  findByTypeResponse),
        (readByTypeRequest,                  readByTypeResponse),
        (readRequest,                        readResponse),
        (readBlobRequest,                    readBlobResponse),
        (readMultipleRequest,                readMultipleResponse),
        (readByGroupTypeRequest,             readByGroupTypeResponse),
        (writeRequest,                       writeResponse),
        (preparedWriteRequest,               preparedWriteResponse),
        (executeWriteRequest,                executeWriteResponse)
    ]
    // swiftlint:enable comma
    
    static let responsesByRequest: [ATTOpcode: ATTOpcode] = {
        var dictionary = [ATTOpcode: ATTOpcode](minimumCapacity: requestResponseMap.count)
        requestResponseMap.forEach { dictionary[$0.request] = $0.response }
        return dictionary
    }()
    
    static let requestsByResponse: [ATTOpcode: ATTOpcode] = {
        var dictionary = [ATTOpcode: ATTOpcode](minimumCapacity: requestResponseMap.count)
        requestResponseMap.forEach { dictionary[$0.response] = $0.request }
        return dictionary
    }()
}
