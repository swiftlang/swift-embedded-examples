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

// Service Discovery Protocol

struct ServiceDiscoveryProtocol: ~Copyable {
  typealias ServiceRecord = UnsafePointer<UInt8>
  typealias ServiceRecordHandle = UInt32

  init() {
    sdp_init()
  }

  deinit {
    sdp_deinit()
  }

  mutating func registerService(record: ServiceRecord) {
    precondition(sdp_register_service(record) == 0)
  }

  mutating func registerService(record: UnsafeMutableRawBufferPointer) {
    precondition(de_get_len(record.baseAddress) <= record.count)
    precondition(sdp_register_service(record.baseAddress) == 0)
  }

  mutating func unregisterService(handle: ServiceRecordHandle) {
    sdp_unregister_service(handle)
  }

  mutating func getServiceRecordHandle(for record: ServiceRecord) -> ServiceRecordHandle {
    sdp_get_service_record_handle(record)
  }

  mutating func makeServiceRecordHandle() -> ServiceRecordHandle {
    sdp_create_service_record_handle()
  }

  mutating func getServiceRecord(for handle: ServiceRecordHandle) -> ServiceRecord? {
    ServiceRecord(sdp_get_record_for_handle(handle))
  }
}
