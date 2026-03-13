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

public final class HostController {
    
    public nonisolated(unsafe) static let `default` = HostController(transport: .default)
    
    // MARK: - Properties
    
    private var callbackRegistration = btstack_packet_callback_registration_t()
    
    public var log: (@Sendable (String) -> ())?

    public internal(set) var state: State = .off {
        didSet {
            log?("HCI State: \(oldValue) -> \(state)")
        }
    }
    
    public var isAdvertising = false {
        didSet {
            setAdvertisementState()
        }
    }
    
    public var advertisement = LowEnergyAdvertisingData() {
        didSet {
            setAdvertisementData()
        }
    }
    
    internal var advertisementBuffer = [UInt8]()
    
    public var scanResponse = LowEnergyAdvertisingData() {
        didSet {
            setScanResponse()
        }
    }
    
    internal var scanResponseBuffer = [UInt8]()
    
    // MARK: - Initialization
    
    internal init(transport: borrowing Transport) {
        // init BTStack
        hci_init(transport.pointer, nil)
        // register for callbacks
        callbackRegistration.callback = _bluetooth_packet_handler
        hci_add_event_handler(&callbackRegistration)
    }

    deinit {
        hci_remove_event_handler(&callbackRegistration)
        hci_deinit()
    }
    
    // MARK: - Methods
    
    /// Requests the change of BTstack power mode.
    public func setPower(_ state: PowerState) throws(BTStackError) {
        try hci_power_control(.init(rawValue: numericCast(state.rawValue))).throwsError()
    }
}

// MARK: - Supporting Types

public extension HostController {

    enum PowerState: UInt8, Sendable {

        case off    = 0
        case on     = 1
        case sleep  = 2
    }

    enum State: UInt8, Sendable {

        case off            = 0
        case initializing   = 1
        case on             = 2
        case halting        = 3
        case sleeping       = 4
        case fallingAsleep  = 5
    }
}

// packet_handler(uint8_t packet_type, uint16_t channel, uint8_t *packet, uint16_t size)
internal func _bluetooth_packet_handler(packetType: UInt8, channel: UInt16, packetPointer: UnsafeMutablePointer<UInt8>?, packetSize: UInt16) {
    
    let hostController = HostController.default
    switch Int32(packetType) {
        case HCI_EVENT_PACKET:
            switch UInt32(hci_event_packet_get_type(packetPointer)) {
                case BTSTACK_EVENT_STATE:
                    hostController.handle_BTSTACK_EVENT_STATE(packetType, channel, packetPointer, packetSize)
                case HCI_EVENT_TRANSPORT_USB_INFO:
                    hostController.handle_HCI_EVENT_TRANSPORT_USB_INFO(packetType, channel, packetPointer, packetSize)
                case HCI_EVENT_DISCONNECTION_COMPLETE:
                    hostController.handle_HCI_EVENT_DISCONNECTION_COMPLETE(packetType, channel, packetPointer, packetSize)
                case HCI_EVENT_VENDOR_SPECIFIC:
                    break
            case HCI_EVENT_META_GAP:
                switch UInt32(hci_event_gap_meta_get_subevent_code(packetPointer)) {
                case GAP_SUBEVENT_LE_CONNECTION_COMPLETE:
                    hostController.handle_GAP_SUBEVENT_LE_CONNECTION_COMPLETE(packetType, channel, packetPointer, packetSize)
                default:
                    break
                }
                default:
                    break
            }
        default:
            break
    }
}

internal extension HostController {
    
    func handle_BTSTACK_EVENT_STATE(_ packetType: UInt8, _ channel: UInt16, _ packetPointer: UnsafeMutablePointer<UInt8>?, _ packetSize: UInt16) {
        let rawState = btstack_event_state_get_state(packetPointer)
        let newValue = HostController.State(rawValue: rawState) ?? .off
        self.state = newValue
    }
    
    func handle_HCI_EVENT_TRANSPORT_USB_INFO(_ packetType: UInt8, _ channel: UInt16, _ packetPointer: UnsafeMutablePointer<UInt8>?, _ packetSize: UInt16) {
        let vendor = hci_event_transport_usb_info_get_vendor_id(packetPointer)
        let product = hci_event_transport_usb_info_get_product_id(packetPointer)
        log?("USB Vendor \(vendor) Product \(product) ")
    }
    
    func handle_GAP_SUBEVENT_LE_CONNECTION_COMPLETE(_ packetType: UInt8, _ channel: UInt16, _ packetPointer: UnsafeMutablePointer<UInt8>?, _ packetSize: UInt16) {
        let connectionHandle = gap_subevent_le_connection_complete_get_connection_handle(packetPointer)
        log?("LE Connection - Handle: \(connectionHandle)")
    }
    
    func handle_HCI_EVENT_DISCONNECTION_COMPLETE(_ packetType: UInt8, _ channel: UInt16, _ packetPointer: UnsafeMutablePointer<UInt8>?, _ packetSize: UInt16) {
        let connectionHandle = hci_event_disconnection_complete_get_connection_handle(packetPointer)
        log?("LE Disconnection - Handle: \(connectionHandle)")
        // re-enable advertising
        if isAdvertising {
            //gap_discoverable_control(1)
            //gap_connectable_control(1)
            gap_advertisements_enable(1)
        }
    }
}
