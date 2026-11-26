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

/// Raspberry Pi Pico Errors
enum PicoError: Int32, Error, Sendable {
    
    /// An unspecified error occurred.
    case unknown = -1
    
    /// The function failed due to timeout.
    case timeout = -2
    
    /// Attempt to read from an empty buffer/FIFO.
    case noData = -3
    
    /// Permission violation (e.g. write to read-only flash partition).
    case notPermitted = -4
    
    /// Argument is outside the range of supported values.
    case invalidArg = -5
    
    /// An I/O error occurred.
    case io = -6
    
    /// The authorization failed due to bad credentials.
    case badAuth = -7
    
    /// The connection failed.
    case connectFailed = -8
    
    /// Dynamic allocation of resources failed.
    case insufficientResources = -9
    
    /// Address argument was out-of-bounds or inaccessible.
    case invalidAddress = -10
    
    /// Address was mis-aligned (usually not on a word boundary).
    case badAlignment = -11
    
    /// Something failed in the past, preventing servicing the current request.
    case invalidState = -12
    
    /// A user-allocated buffer was too small to hold the result.
    case bufferTooSmall = -13
    
    /// The call failed because another function must be called first.
    case preconditionNotMet = -14
    
    /// Cached data was determined to be inconsistent with the actual version.
    case modifiedData = -15
    
    /// A data structure failed to validate.
    case invalidData = -16
    
    /// Attempted to access something that does not exist; search failed.
    case notFound = -17
    
    /// Write is impossible based on previous writes (e.g. attempted to clear an OTP bit).
    case unsupportedModification = -18
    
    /// A required lock is not owned.
    case lockRequired = -19
    
    /// A version mismatch occurred (e.g. running incompatible code).
    case versionMismatch = -20
    
    /// The call could not proceed because required resources were unavailable.
    case resourceInUse = -21
}