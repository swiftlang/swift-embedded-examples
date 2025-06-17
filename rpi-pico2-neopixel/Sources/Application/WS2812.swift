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

enum WS2812 {
  // Precompiled PIO program using pioasm
  static let pioInstructions: (UInt16, UInt16, UInt16, UInt16, UInt16) = (
    0xe081,  //  0: set    pindirs, 1      side 0
    //     .wrap_target
    0x6321,  //  1: out    x, 1            side 0 [3]
    0x1224,  //  2: jmp    !x, 4           side 1 [2]
    0x1201,  //  3: jmp    1               side 1 [2]
    0xa242  //  4: nop                    side 0 [2]
    //     .wrap
  )
}
