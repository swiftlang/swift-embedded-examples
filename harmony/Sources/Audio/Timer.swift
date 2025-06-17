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

// struct Timer<Context>: ~Copyable, ~Escapable {
//     var context: UnsafePointer<Context>

//     init(context: borrowing Context) dependsOn(context) {
//         withUnsafePointerToInstance(context) { context in
//             self.context = context
//         }
//     }
// }