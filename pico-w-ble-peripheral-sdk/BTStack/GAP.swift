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

public extension HostController {
    
    func setAdvertisementParameters(
        advIntMin: UInt16 = 0x0030,
        advIntMax: UInt16 = 0x0030,
        advType: UInt8 = 0,
        directAddressType: UInt8 = 0,
        directAddress: BluetoothAddress = .zero,
        channelMap: UInt8 = 0x07,
        filterPolicy: UInt8 = 0x00
    ) {
        var directAddress = directAddress
        withUnsafeMutablePointer(to: &directAddress.bytes) {
            gap_advertisements_set_params(advIntMin, advIntMax, advType, directAddressType, $0, channelMap, filterPolicy)
        }
    }
    
    var address: BluetoothAddress {
        var address: BluetoothAddress = .zero
        gap_local_bd_addr(&address.bytes)
        return address.bigEndian
    }
}

internal extension HostController {
    
    func setAdvertisementData() {
        let length = advertisement.length
        advertisementBuffer = [UInt8](advertisement)
        // data is not copied, pointer has to stay valid
        gap_advertisements_set_data(length, &advertisementBuffer)
    }
    
    func setScanResponse() {
        let length = scanResponse.length
        scanResponseBuffer = [UInt8](scanResponse)
        // data is not copied, pointer has to stay valid
        gap_scan_response_set_data(length, &scanResponseBuffer)
    }
    
    func setAdvertisementState() {
        gap_advertisements_enable(isAdvertising ? 1 : 0)
    }
}
