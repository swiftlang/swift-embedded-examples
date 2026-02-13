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

@main
struct Main {

    nonisolated(unsafe) static let hostController = HostController.default

    static let peripheral = BTStackPeripheral(hostController: hostController)
    
    nonisolated(unsafe) static var lightState = false {
        didSet {
            print("Light State: \(oldValue) -> \(lightState)")
            cyw43?[.led] = lightState
        }
    }

    static var cyw43: CYW43!

    static func main() {
        
        stdio_init_all()

        print("Hello World!")

        do {
            cyw43 = try CYW43()
        }
        catch {
            print("Wi-Fi init failed.")
            return
        }
        
        cyw43[.led] = false

        hostController.log = { print("HCI: " + $0) }
        peripheral.log = { print("Peripheral: " + $0) }

        do {
            try start()
        }
        catch {
            print("Bluetooth error")
        }
    }

    static func start() throws(BTStackPeripheral.Error) {
        
        let hostController = HostController.default
        do {
            try hostController.setPower(.on)
        }
        catch {
            throw .library(error)
        }
        
        // wait for Bluetooth to turn on
        while hostController.state != .on {
             sleep_ms(500)
        }
                
        hostController.setAdvertisementParameters()
        
        // Estimote iBeacon B9407F30-F5F8-466E-AFF9-25556B57FE6D
        // Major 0x01 Minor 0x01
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        let beacon = AppleBeacon(uuid: uuid, major: 0x01, minor: 0x01, rssi: -10)
        let flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR]
        let advertisement = LowEnergyAdvertisingData(
            beacon: beacon,
            flags: flags
        )
        
        // scan response with name and bluetooth address
        let address = hostController.address
        let name = GAPCompleteLocalName(name: "Pico W " + address.description)
        let scanResponse: LowEnergyAdvertisingData = GAPDataEncoder.encode(name)
        
        print("Advertisment Name: \(name.description)")
        
        // Add services
        let (serviceHandle, _) = peripheral.add(service: GATTAttribute<BTStackPeripheral.Data>.Service(
            uuid: .deviceInformation,
            isPrimary: true,
            characteristics: [
                .init(
                    uuid: .deviceName,
                    value: Array("BTStack BLE Peripheral".utf8),
                    permissions: .read,
                    properties: [.read]
                ),
            ]
        ))
        
        let lightStateUUID = BluetoothUUID(rawValue: "6170CEE6-9E3A-47B5-A621-B8BF7EC843D2")!
        
        let (lightService, _) = peripheral.add(service: GATTAttribute<BTStackPeripheral.Data>.Service(
            uuid: BluetoothUUID(rawValue: "A5E9C26D-2B6A-4F22-9A47-21FF43393188")!,
            isPrimary: true,
            characteristics: [
                .init(
                    uuid: lightStateUUID,
                    value: [0x00],
                    permissions: [.read, .write],
                    properties: [.read, .write],
                    descriptors: [
                        .init(GATTUserDescription(rawValue: "Light State"))
                    ]
                )
            ]
        ))
        
        peripheral.willWrite = { write in
            switch write.uuid {
            case lightStateUUID:
                guard write.newValue.count == 1 else {
                    return .writeNotPermitted
                }
                switch write.newValue[0] {
                case 0, 1:
                    return nil
                default:
                    return .writeNotPermitted
                }
            default:
                return nil
            }
        }
        
        peripheral.didWrite = { write in
            switch write.uuid {
            case lightStateUUID:
                let oldValue = lightState
                let newState = write.value.first != 0
                self.lightState = newState
            default:
                break
            }
        }

        guard peripheral.storage.database.isEmpty == false else {
            print("Empty database")
            return 
        }

        peripheral.storage.database.dump()

        // start advertisment
        try peripheral.start(options: .init(
            advertisingData: advertisement,
            scanResponse: scanResponse)
        )
    }
}

extension GATTDatabase {
    
    func dump() {
        
        print("GATT Database:")
        
        for attribute in self {
            
            let value: String = BluetoothUUID(data: attribute.value)?.littleEndian.description
                ?? ((attribute.value.count > 1) ? String(utf8: attribute.value) : attribute.value.toHexadecimal())
                ?? attribute.value.toHexadecimal()
            
            print("\(attribute.handle) - \(attribute.uuid)")
            print("Permissions: \(attribute.permissions)")
            print("Value: \(value)")
        }
    }
}

/// Implement `posix_memalign(3)`, which is required by the Embedded Swift runtime but is
/// not provided by the Pi Pico SDK.
@_documentation(visibility: internal)
@_cdecl("posix_memalign") public func posix_memalign(
    _ memptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>,
    _ alignment: Int,
    _ size: Int
) -> CInt {
    guard let allocation = aligned_alloc(alignment, size) else {
        return 0
    }
    memptr.pointee = allocation
    return 0
}

/// Implement `arc4random_buf` which is required by the Embedded Swift runtime for Hashable, Set, Dictionary,
/// and random-number generating APIs but is not provided by the Pi Pico SDK.
@_documentation(visibility: internal)
@_cdecl("arc4random_buf") public func arc4random_buf(buf: UnsafeMutableRawPointer, nbytes: Int) {
    for i in stride(from: 0, to: nbytes - 1, by: 2) {
        let randomValue = UInt16(rand() & Int32(UInt16.max))
        (buf + i).assumingMemoryBound(to: UInt16.self).pointee = randomValue
    }
    if nbytes % 2 == 1 {
        let randomValue = UInt8(rand() & Int32(UInt8.max))
        (buf + nbytes - 1).assumingMemoryBound(to: UInt8.self).pointee = randomValue
    }
}