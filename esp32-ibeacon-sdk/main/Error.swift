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

/// ESP32 error codes
public enum ESPError: Int32, Error, Sendable {

    case unknown = -1              // ESP_FAIL
    case noMemory = 0x101          // ESP_ERR_NO_MEM
    case invalidArg = 0x102       // ESP_ERR_INVALID_ARG
    case invalidState = 0x103     // ESP_ERR_INVALID_STATE
    case invalidSize = 0x104      // ESP_ERR_INVALID_SIZE
    case notFound = 0x105         // ESP_ERR_NOT_FOUND
    case notSupported = 0x106     // ESP_ERR_NOT_SUPPORTED
    case timeout = 0x107          // ESP_ERR_TIMEOUT
    case invalidResponse = 0x108  // ESP_ERR_INVALID_RESPONSE
    case invalidCrc = 0x109      // ESP_ERR_INVALID_CRC
    case invalidVersion = 0x10a   // ESP_ERR_INVALID_VERSION
    case invalidMac = 0x10b       // ESP_ERR_INVALID_MAC
    case notFinished = 0x10c      // ESP_ERR_NOT_FINISHED
    case notAllowed = 0x10d       // ESP_ERR_NOT_ALLOWED
    
    // NVS related error codes
    case nvsBase = 0x1100         // ESP_ERR_NVS_BASE
    case nvsNotInitialized = 0x1101  // ESP_ERR_NVS_NOT_INITIALIZED
    case nvsNotFound = 0x1102        // ESP_ERR_NVS_NOT_FOUND
    case nvsTypeMismatch = 0x1103   // ESP_ERR_NVS_TYPE_MISMATCH
    case nvsReadOnly = 0x1104      // ESP_ERR_NVS_READ_ONLY
    case nvsNotEnoughSpace = 0x1105 // ESP_ERR_NVS_NOT_ENOUGH_SPACE
    case nvsInvalidName = 0x1106   // ESP_ERR_NVS_INVALID_NAME
    case nvsInvalidHandle = 0x1107 // ESP_ERR_NVS_INVALID_HANDLE
    case nvsRemoveFailed = 0x1108  // ESP_ERR_NVS_REMOVE_FAILED
    case nvsKeyTooLong = 0x1109    // ESP_ERR_NVS_KEY_TOO_LONG
    case nvsPageFull = 0x110a     // ESP_ERR_NVS_PAGE_FULL
    case nvsInvalidState = 0x110b // ESP_ERR_NVS_INVALID_STATE
    
    // ULP related error codes
    case ulpBase = 0x1200         // ESP_ERR_ULP_BASE
    case ulpSizeTooBig = 0x1201   // ESP_ERR_ULP_SIZE_TOO_BIG
    case ulpInvalidLoadAddr = 0x1202 // ESP_ERR_ULP_INVALID_LOAD_ADDR
    case ulpDuplicateLabel = 0x1203  // ESP_ERR_ULP_DUPLICATE_LABEL
    case ulpUndefinedLabel = 0x1204 // ESP_ERR_ULP_UNDEFINED_LABEL
    
    // OTA related error codes
    case otaBase = 0x1500         // ESP_ERR_OTA_BASE
    case otaPartitionConflict = 0x1501  // ESP_ERR_OTA_PARTITION_CONFLICT
    case otaValidateFailed = 0x1503  // ESP_ERR_OTA_VALIDATE_FAILED
    
    // Wi-Fi related error codes
    case wifiBase = 0x3000        // ESP_ERR_WIFI_BASE
    case wifiNotInit = 0x3001     // ESP_ERR_WIFI_NOT_INIT
    case wifiNotStarted = 0x3002  // ESP_ERR_WIFI_NOT_STARTED
    case wifiNotStopped = 0x3003  // ESP_ERR_WIFI_NOT_STOPPED
    case wifiIf = 0x3004          // ESP_ERR_WIFI_IF
    case wifiMode = 0x3005        // ESP_ERR_WIFI_MODE
    
    // Mesh network related error codes
    case meshBase = 0x4000        // ESP_ERR_MESH_BASE
    case meshNotInit = 0x4002     // ESP_ERR_MESH_NOT_INIT
    case meshNotStart = 0x4004    // ESP_ERR_MESH_NOT_START
    case meshNoMemory = 0x4007    // ESP_ERR_MESH_NO_MEMORY
    
    // Networking error codes
    case espNetifBase = 0x5000    // ESP_ERR_ESP_NETIF_BASE
    case espNetifInvalidParams = 0x5001  // ESP_ERR_ESP_NETIF_INVALID_PARAMS
    
    // Flash error codes
    case flashBase = 0x6000       // ESP_ERR_FLASH_BASE
    case flashOpFail = 0x6001     // ESP_ERR_FLASH_OP_FAIL
    case flashNotInitialized = 0x6003 // ESP_ERR_FLASH_NOT_INITIALISED
    
    // HTTP error codes
    case httpBase = 0x7000        // ESP_ERR_HTTP_BASE
    case httpMaxRedirect = 0x7001 // ESP_ERR_HTTP_MAX_REDIRECT
    case httpConnect = 0x7002     // ESP_ERR_HTTP_CONNECT
    
    // TLS error codes
    case espTlsBase = 0x8000      // ESP_ERR_ESP_TLS_BASE
    case espTlsCannotResolveHost = 0x8001 // ESP_ERR_ESP_TLS_CANNOT_RESOLVE_HOSTNAME
    
    // Hardware crypto error codes
    case hwCryptoBase = 0xc000    // ESP_ERR_HW_CRYPTO_BASE
    case hwCryptoDsHmacFail = 0xc001 // ESP_ERR_HW_CRYPTO_DS_HMAC_FAIL
    
    // Memory protection error codes
    case memprotBase = 0xd000     // ESP_ERR_MEMPROT_BASE
    case memprotMemoryTypeInvalid = 0xd001 // ESP_ERR_MEMPROT_MEMORY_TYPE_INVALID
    
    // TCP transport error codes
    case tcpTransportBase = 0xe000 // ESP_ERR_TCP_TRANSPORT_BASE
    case tcpTransportConnectionTimeout = 0xe001 // ESP_ERR_TCP_TRANSPORT_CONNECTION_TIMEOUT
    
    // NVS secure error codes
    case nvsSecBase = 0xf000      // ESP_ERR_NVS_SEC_BASE
    case nvsSecHmacKeyNotFound = 0xf001  // ESP_ERR_NVS_SEC_HMAC_KEY_NOT_FOUND
    case nvsSecHmacKeyGenerationFailed = 0xf003 // ESP_ERR_NVS_SEC_HMAC_KEY_GENERATION_FAILED
}

extension ESPError: CustomStringConvertible {

    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
}

/// NimBLE error codes
public struct NimBLEError: Error, RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}

internal extension Int32 {
    
    func throwsError() throws(NimBLEError) {
        guard self == 0 else {
            throw NimBLEError(rawValue: self)
        }
    }

    func throwsESPError() throws(ESPError) {
        guard self == 0 else {
            throw ESPError(rawValue: self) ?? .unknown
        }
    }
}