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

internal extension FixedWidthInteger {
    
    func toHexadecimal() -> String {
        let length = MemoryLayout<Self>.size * 2
        var string: String
        #if hasFeature(Embedded) || (canImport(Darwin) && DEBUG)
        string = ""
        string.reserveCapacity(length)
        self.bigEndian.forEachByte { byte in
            string += String(hexadecimal: byte)
        }
        #else // Linux and non-Embedded release builds use Swift StdLib
        string = String(self, radix: 16, uppercase: true)
        // Add Zero padding
        while string.utf8.count < length {
            string = "0" + string
        }
        #endif
        assert(string.utf8.count == length)
        #if !hasFeature(Embedded)
        assert(string == string.uppercased(), "String should be uppercased")
        #endif
        return string
    }
}

internal extension String {
    
    /// Converts a byte to its uppercase hexadecimal representation.
    init(hexadecimal byte: UInt8) {
        let length = 2
        #if hasFeature(Embedded) || (canImport(Darwin) && DEBUG)
        self.init(format: "%02X", length: length, byte)!
        #else
        self.init(byte, radix: 16, uppercase: true)
        // Add Zero padding
        while self.utf8.count < length {
            self = "0" + self
        }
        #endif
        assert(self.utf8.count == length)
        #if !hasFeature(Embedded)
        assert(self == self.uppercased(), "String should be uppercased")
        #endif
    }
}

internal extension Collection where Element: FixedWidthInteger {
    
    func toHexadecimal() -> String {
        let length = count * MemoryLayout<Element>.size * 2
        var string = ""
        string.reserveCapacity(length)
        string = reduce(into: string) { $0 += $1.toHexadecimal() }
        assert(string.utf8.count == length)
        return string
    }
}

internal extension FixedWidthInteger {
    
    init?<S: StringProtocol>(parse string: S, radix: Self) {
        #if !hasFeature(Embedded)
        let string = string.uppercased()
        #endif
        self.init(utf8: string.utf8, radix: radix)
    }
    
    init?<S: StringProtocol>(hexadecimal string: S) {
        guard string.utf8.count == MemoryLayout<Self>.size * 2 else {
            return nil
        }
        #if hasFeature(Embedded) || DEBUG
        guard let value = Self(parse: string, radix: 16) else {
            return nil
        }
        self.init(value)
        #else
        self.init(string, radix: 16)
        #endif
    }
    
    init?<C>(hexadecimal utf8: C) where C: Collection, C.Element == UInt8 {
        guard utf8.count == MemoryLayout<Self>.size * 2 else {
            return nil
        }
        guard let value = Self(utf8: utf8, radix: 16) else {
            return nil
        }
        self.init(value)
    }
    
    /// Expects uppercase UTF8 data.
    init?<C>(utf8: C, radix: Self) where C: Collection, C.Element == UInt8 {
        #if !hasFeature(Embedded)
        assert(String(decoding: utf8, as: UTF8.self) == String(decoding: utf8, as: UTF8.self).uppercased(), "Expected uppercase string")
        #endif
        let digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".utf8
        var result = Self(0)
        for character in utf8 {
            if let stringIndex = digits.enumerated().first(where: { $0.element == character })?.offset {
                let val = Self(stringIndex)
                if val >= radix {
                    return nil
                }
                result = result * radix + val
            } else {
                return nil
            }
        }
        self = result
    }
}

#if !hasFeature(Embedded)
internal extension String.UTF16View.Element {
    
    // Convert 0 ... 9, a ... f, A ...F to their decimal value,
    // return nil for all other input characters
    func decodeHexNibble() -> UInt8? {
        switch self {
        case 0x30 ... 0x39:
            return UInt8(self - 0x30)
        case 0x41 ... 0x46:
            return UInt8(self - 0x41 + 10)
        case 0x61 ... 0x66:
            return UInt8(self - 0x61 + 10)
        default:
            return nil
        }
    }
}

internal extension [UInt8] {
    
    init?<S: StringProtocol>(hexadecimal string: S) {
        
        let str = String(string)
        let utf16: String.UTF16View
        if (str.count % 2 == 1) {
            utf16 = ("0" + str).utf16
        } else {
            utf16 = str.utf16
        }
        var data = [UInt8]()
        data.reserveCapacity(utf16.count / 2)
        
        var i = utf16.startIndex
        while i != utf16.endIndex {
            guard let hi = utf16[i].decodeHexNibble(),
                  let nxt = utf16.index(i, offsetBy:1, limitedBy: utf16.endIndex),
                  let lo = utf16[nxt].decodeHexNibble()
            else {
                return nil
            }
            
            let value = hi << 4 + lo
            data.append(value)
            
            guard let next = utf16.index(i, offsetBy:2, limitedBy: utf16.endIndex) else {
                break
            }
            i = next
        }
        
        self = data
        
    }
}
#endif
