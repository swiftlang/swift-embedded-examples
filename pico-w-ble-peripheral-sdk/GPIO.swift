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

extension CYW43 {

    enum GPIO: UInt32, CaseIterable, Copyable, Sendable {

        case led = 0

        case vsys = 1

        case vbus = 2
    }
    
    subscript (gpio: GPIO) -> Bool {
        get {
            cyw43_arch_gpio_get(gpio.rawValue)
        }
        set {
            cyw43_arch_gpio_put(gpio.rawValue, newValue)
        }
    }
}