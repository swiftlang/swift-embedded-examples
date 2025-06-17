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

// Host Controller Interface

@_cdecl("hci_packet_handler")
func hci_packet_handler(
  packet_type: UInt8,
  channel: UInt16,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  guard packet_type == HCI_EVENT_PACKET else { return }
  guard hci_event_packet_get_type(packet) == HCI_EVENT_PIN_CODE_REQUEST else {
    return
  }

  var address: bd_addr_t = (0, 0, 0, 0, 0, 0)
  log("Pin code request - using '0000'")
  hci_event_pin_code_request_get_bd_addr(packet, &address)
  gap_pin_code_response(&address, "0000")
}
