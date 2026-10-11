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

#if canImport(Darwin)
import Darwin
#endif

internal extension String {
    
    /// Initialize from UTF8 data.
    init?<Data: DataContainer>(utf8 data: Data) {
        #if hasFeature(Embedded)
        self.init(validating: data, as: UTF8.self)
        #else
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            self.init(validating: data, as: UTF8.self)
        } else {
            self.init(bytes: data, encoding: .utf8)
        }
        #endif
    }
    
    #if hasFeature(Embedded)
    // Can't use `CVarArg` in Embedded Swift
    init?(format: String, length: Int, _ value: UInt8) {
        var cString: [CChar] = .init(repeating: 0, count: length + 1)
        guard _snprintf_uint8_t(&cString, cString.count, format, value) >= 0 else {
            return nil
        }
        self.init(cString: cString)
    }
    #elseif canImport(Darwin)
    init?<T: CVarArg>(format: String, length: Int, _ value: T) {
        var cString: [CChar] = .init(repeating: 0, count: length + 1)
        guard snprintf(ptr: &cString, cString.count, format, value) >= 0 else {
            return nil
        }
        self.init(cString: cString)
    }
    #endif
}

#if hasFeature(Embedded)
@_silgen_name("snprintf")
internal func _snprintf_uint8_t(_ pointer: UnsafeMutablePointer<CChar>, _ length: Int, _ format: UnsafePointer<CChar>, _ arg: UInt8) -> Int32
#endif