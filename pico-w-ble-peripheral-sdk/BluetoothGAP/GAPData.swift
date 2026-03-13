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

// MARK: - Generic Access Profile Data

/**
Generic Access Profile

- SeeAlso:
[Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
*/
public protocol GAPData: DataConvertible {
    
    /// Generic Access Profile data type.
    static var dataType: GAPDataType { get }
}
