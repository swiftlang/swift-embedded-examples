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

public struct NimBLE: ~Copyable {

    internal let context: UnsafeMutablePointer<Context>

    public init() throws(ESPError) {
       try nimble_port_init().throwsESPError()
       nimble_port_freertos_init(nimble_host_task)
       // Allocate context on heap for callbacks
       context = .allocate(capacity: 1)
       context.pointee = Context()
    }

    deinit {
        context.deinitialize(count: 1)
        context.deallocate()
        nimble_port_freertos_deinit()
    }

    public var log: (@Sendable (String) -> ())? {
        get { context.pointee.log }
        set { context.pointee.log = newValue }
    }
}

internal extension NimBLE {
    
    struct Context {
        
        var log: (@Sendable (String) -> ())?

        var gap = GAP.Context()
        
        var gattServer = GATTServer.Context()
        
        
    }
}

@_silgen_name("nvs_flash_init")
internal func nvs_flash_init() -> Int32

@_silgen_name("nimble_port_init")
internal func nimble_port_init() -> Int32

@_silgen_name("nimble_port_run")
internal func nimble_port_run() -> Int32

@_silgen_name("nimble_port_freertos_init")
internal func nimble_port_freertos_init(_ function: (UnsafeMutableRawPointer) -> ())

@_silgen_name("nimble_port_freertos_deinit")
internal func nimble_port_freertos_deinit()

internal func nimble_host_task(_ parameters: UnsafeMutableRawPointer) {
    print("BLE Host Task Started")
    nimble_port_run()
    nimble_port_freertos_deinit()
}

public extension NimBLE {
    
    var hostController: HostController { HostController(context: context) }
}

public struct HostController {
    
    internal let context: UnsafeMutablePointer<NimBLE.Context>
    
    public var isEnabled: Bool {
        ble_hs_is_enabled() == 1
    }
    
    public func address(
        type: LowEnergyAddressType = .public
    ) throws(NimBLEError) -> BluetoothAddress {
        var address = BluetoothAddress.zero
        try withUnsafeMutablePointer(to: &address) {
            $0.withMemoryRebound(to: UInt8.self, capacity: 6) {
                ble_hs_id_copy_addr(type.rawValue, $0, nil)
            }
        }.throwsError()
        return address
    }
}

public extension NimBLE {
    
    var gap: GAP {
        GAP(context: context)
    }
}

/// NimBLE GAP interface.
public struct GAP {
    
    internal struct Context {
        
        var advertisment = LowEnergyAdvertisingData()
        
        var scanResponse = LowEnergyAdvertisingData()
    }
    
    internal let context: UnsafeMutablePointer<NimBLE.Context>
    
    /// Indicates whether an advertisement procedure is currently in progress.
    public var isAdvertising: Bool {
        ble_gap_adv_active() == 1
    }
    
    /// Start advertising
    public func startAdvertising(
        addressType: LowEnergyAddressType = .public,
        address: BluetoothAddress? = nil,
        parameters: ble_gap_adv_params = ble_gap_adv_params(conn_mode: UInt8(BLE_GAP_CONN_MODE_UND), disc_mode: UInt8(BLE_GAP_DISC_MODE_GEN), itvl_min: 0, itvl_max: 0, channel_map: 0, filter_policy: 0, high_duty_cycle: 0)
    ) throws(NimBLEError) {
        var address = ble_addr_t(
            type: 0,
            val: (address ?? .zero).bytes
        )
        var parameters = parameters
        try ble_gap_adv_start(addressType.rawValue, &address, BLE_HS_FOREVER, &parameters, _gap_callback, context).throwsError()
    }
    
    /// Stops the currently-active advertising procedure. 
    public func stopAdvertising() throws(NimBLEError) {
        try ble_gap_adv_stop().throwsError()
    }
    
    public var advertisementData: LowEnergyAdvertisingData {
        context.pointee.gap.advertisment
    }
    
    /// Configures the data to include in subsequent advertisements.
    public func setAdvertisement(_ data: LowEnergyAdvertisingData) throws(NimBLEError) {
        context.pointee.gap.advertisment = data
        try context.pointee.gap.advertisment.withUnsafePointer {
            ble_gap_adv_set_data($0, Int32(data.length))
        }.throwsError()
    }
    
    public var scanResponse: LowEnergyAdvertisingData {
        context.pointee.gap.scanResponse
    }
    
    /// Configures the data to include in subsequent scan responses.
    public func setScanResponse(_ data: LowEnergyAdvertisingData) throws(NimBLEError) {
        context.pointee.gap.scanResponse = data
        try context.pointee.gap.scanResponse.withUnsafePointer {
            ble_gap_adv_rsp_set_data($0, Int32(data.length))
        }.throwsError()
    }

    public func connection(for handle: UInt16) throws(NimBLEError) -> ble_gap_conn_desc {
        var connection = ble_gap_conn_desc()
        try ble_gap_conn_find(handle, &connection).throwsError()
        return connection
    }
}

internal func _gap_callback(event: UnsafeMutablePointer<ble_gap_event>?, context contextPointer: UnsafeMutableRawPointer?) -> Int32 {
    guard let context = contextPointer?.assumingMemoryBound(to: NimBLE.Context.self),
        let event else {
        return 0
    }
    let log = context.pointee.log
    switch Int32(event.pointee.type) {
    case BLE_GAP_EVENT_CONNECT:
        let handle = event.pointee.connect.conn_handle
        log?("Connected - Handle \(handle)")
    case BLE_GAP_EVENT_DISCONNECT:
        let handle = event.pointee.connect.conn_handle
        log?("Disconnected - Handle \(handle)")
        do {
            try GAP(context: context).startAdvertising()
        }
        catch {
            log?("Unable to advertise")
        }
    default:
        break
    }
    
    return 0
}

public extension NimBLE {
    
    var server: GATTServer { GATTServer(context: context) }
}


/// NimBLE GATT Server interface.
public struct GATTServer {
    
    internal struct Context {
        
        var services = [GATTAttribute<[UInt8]>.Service]()
        
        var servicesBuffer = [ble_gatt_svc_def]()
        
        var characteristicsBuffers = [[ble_gatt_chr_def]]()
        
        var descriptorBuffers = [[[ble_gatt_dsc_def]]]()
        
        var buffers = [[UInt8]]()
        
        var characteristicValueHandles = [[UInt16]]()
        
        /// Callback to handle GATT read requests.
        var willRead: ((GATTReadRequest<Central, [UInt8]>) -> ATTError?)?
        
        /// Callback to handle GATT write requests.
        var willWrite: ((GATTWriteRequest<Central, [UInt8]>) -> ATTError?)?
        
        /// Callback to handle post-write actions for GATT write requests.
        var didWrite: ((GATTWriteConfirmation<Central, [UInt8]>) -> ())?
    }
    
    // MARK: - Properties
    
    internal let context: UnsafeMutablePointer<NimBLE.Context>
    
    /// Callback to handle GATT read requests.
    public var willRead: ((GATTReadRequest<Central, [UInt8]>) -> ATTError?)? {
        get { context.pointee.gattServer.willRead }
        set { context.pointee.gattServer.willRead = newValue }
    }
    
    /// Callback to handle GATT write requests.
    public var willWrite: ((GATTWriteRequest<Central, [UInt8]>) -> ATTError?)? {
        get { context.pointee.gattServer.willWrite }
        set { context.pointee.gattServer.willWrite = newValue }
    }
    
    /// Callback to handle post-write actions for GATT write requests.
    public var didWrite: ((GATTWriteConfirmation<Central, [UInt8]>) -> ())? {
        get { context.pointee.gattServer.didWrite }
        set { context.pointee.gattServer.didWrite = newValue }
    }
    
    // MARK: - Methods
    
    internal func start() throws(NimBLEError) {
        try ble_gatts_start().throwsError()
    }
    
    /// Attempts to add the specified service to the GATT database.
    public func set(services: [GATTAttribute<[UInt8]>.Service]) throws(NimBLEError) -> [[UInt16]] {
        removeAllServices()
        var cServices = [ble_gatt_svc_def].init(repeating: .init(), count: services.count + 1)
        var characteristicsBuffers = [[ble_gatt_chr_def]].init(repeating: [], count: services.count)
        var buffers = [[UInt8]]()
        var valueHandles = [[UInt16]].init(repeating: [], count: services.count)
        var descriptorBuffers = [[[ble_gatt_dsc_def]]].init(repeating: [], count: services.count)
        for (serviceIndex, service) in services.enumerated() {
            // set type
            cServices[serviceIndex].type = service.isPrimary ? UInt8(BLE_GATT_SVC_TYPE_PRIMARY) : UInt8(BLE_GATT_SVC_TYPE_SECONDARY)
            // set uuid
            let serviceUUID = ble_uuid_any_t(service.uuid)
            withUnsafeBytes(of: serviceUUID) {
                let buffer = [UInt8]($0)
                buffers.append(buffer)
                buffer.withUnsafeBytes {
                    cServices[serviceIndex].uuid = .init(OpaquePointer($0.baseAddress))
                }
            }
            assert(ble_uuid_any_t(cServices[serviceIndex].uuid) == serviceUUID)
            assert(serviceUUID.dataLength == service.uuid.dataLength)
            var characteristicHandles = [UInt16](repeating: 0, count: service.characteristics.count)
            descriptorBuffers[serviceIndex] = .init(repeating: [], count: service.characteristics.count)
            // add characteristics
            var cCharacteristics = [ble_gatt_chr_def].init(repeating: .init(), count: service.characteristics.count + 1)
            for (characteristicIndex, characteristic) in service.characteristics.enumerated() {
                // set flags
                cCharacteristics[characteristicIndex].flags = ble_gatt_chr_flags(characteristic.properties.rawValue)
                // set access callback
                cCharacteristics[characteristicIndex].access_cb = _ble_gatt_access
                cCharacteristics[characteristicIndex].arg = .init(context)
                // set UUID
                let characteristicUUID = ble_uuid_any_t(characteristic.uuid)
                withUnsafeBytes(of: characteristicUUID) {
                    let buffer = [UInt8]($0)
                    buffers.append(buffer)
                    buffer.withUnsafeBytes {
                        cCharacteristics[characteristicIndex].uuid = .init(OpaquePointer($0.baseAddress))
                    }
                }
                // set handle
                characteristicHandles[characteristicIndex] = 0x0000
                characteristicHandles.withUnsafeBufferPointer {
                    cCharacteristics[characteristicIndex].val_handle = .init(mutating: $0.baseAddress?.advanced(by: characteristicIndex))
                }
                // descriptors
                var cDescriptors = [ble_gatt_dsc_def].init(repeating: .init(), count: characteristic.descriptors.count + 1)
                for (descriptorIndex, descriptor) in characteristic.descriptors.enumerated() {
                    // set flags
                    cDescriptors[descriptorIndex].att_flags = .init(descriptor.permissions.rawValue)
                    // set access callback
                    cDescriptors[descriptorIndex].access_cb = _ble_gatt_access
                    cDescriptors[descriptorIndex].arg = .init(context)
                    // set UUID
                    let descriptorUUID = ble_uuid_any_t(descriptor.uuid)
                    withUnsafeBytes(of: descriptorUUID) {
                        let buffer = [UInt8]($0)
                        buffers.append(buffer)
                        buffer.withUnsafeBytes {
                            cDescriptors[descriptorIndex].uuid = .init(OpaquePointer($0.baseAddress))
                        }
                    }
                }
                cDescriptors.withUnsafeMutableBufferPointer {
                    cCharacteristics[characteristicIndex].descriptors = $0.baseAddress
                }
                descriptorBuffers[serviceIndex][characteristicIndex] = cDescriptors // retain buffer
            }
            cCharacteristics.withUnsafeBufferPointer {
                cServices[serviceIndex].characteristics = $0.baseAddress
            }
            characteristicsBuffers[serviceIndex] = cCharacteristics
            valueHandles[serviceIndex] = characteristicHandles
        }
        // queue service registration
        try ble_gatts_count_cfg(cServices).throwsError()
        try ble_gatts_add_svcs(cServices).throwsError()
        // register services
        try start()
        // store buffers
        cServices.removeLast() // nil terminator
        self.context.pointee.gattServer.servicesBuffer = cServices
        self.context.pointee.gattServer.characteristicsBuffers = characteristicsBuffers
        self.context.pointee.gattServer.descriptorBuffers = descriptorBuffers
        self.context.pointee.gattServer.buffers = buffers
        self.context.pointee.gattServer.services = services
        self.context.pointee.gattServer.characteristicValueHandles = valueHandles
        // get handles
        return valueHandles
    }
    
    /// Removes the service with the specified handle.
    public func remove(service: UInt16) {
        // iterate all services and find the specified handle
    }
    
    /// Clears the local GATT database.
    public func removeAllServices() {
        ble_gatts_reset()
        self.context.pointee.gattServer.services.removeAll(keepingCapacity: false)
        self.context.pointee.gattServer.buffers.removeAll(keepingCapacity: false)
        self.context.pointee.gattServer.services.removeAll(keepingCapacity: false)
        self.context.pointee.gattServer.characteristicsBuffers.removeAll(keepingCapacity: false)
        self.context.pointee.gattServer.characteristicValueHandles.removeAll(keepingCapacity: false)
        self.context.pointee.gattServer.descriptorBuffers.removeAll(keepingCapacity: false)
    }
    
    public func dump() {
        ble_gatts_show_local()
    }
}

internal extension GATTServer.Context {
    
    func descriptor(for pointer: UnsafePointer<ble_gatt_dsc_def>) -> GATTAttribute<[UInt8]>.Descriptor? {
        for (serviceIndex, service) in services.enumerated() {
            for (characteristicIndex, characteristic) in service.characteristics.enumerated() {
                for (descriptorIndex, descriptor) in characteristic.descriptors.enumerated() {
                    guard descriptorBuffers[serviceIndex][characteristicIndex].withUnsafeBufferPointer({
                        $0.baseAddress?.advanced(by: descriptorIndex) == pointer
                    }) else { continue }
                    return descriptor
                }
            }
        }
        return nil
    }
    
    func characteristic(for handle: UInt16) -> GATTAttribute<[UInt8]>.Characteristic? {
        for (serviceIndex, service) in services.enumerated() {
            for (characteristicIndex, characteristic) in service.characteristics.enumerated() {
                guard characteristicsBuffers[serviceIndex][characteristicIndex].val_handle.pointee == handle else {
                    continue
                }
                return characteristic
            }
        }
        return nil
    }
    
    @discardableResult
    mutating func didWriteCharacteristic(_ newValue: [UInt8], for handle: UInt16) -> Bool {
        for (serviceIndex, service) in services.enumerated() {
            for (characteristicIndex, _) in service.characteristics.enumerated() {
                guard characteristicsBuffers[serviceIndex][characteristicIndex].val_handle.pointee == handle else {
                    continue
                }
                services[serviceIndex].characteristics[characteristicIndex].value = newValue
                return true
            }
        }
        return false
    }
    
    @discardableResult
    mutating func didWriteDescriptor(_ newValue: [UInt8], for pointer: UnsafePointer<ble_gatt_dsc_def>) -> Bool {
        for (serviceIndex, service) in services.enumerated() {
            for (characteristicIndex, characteristic) in service.characteristics.enumerated() {
                for (descriptorIndex, _) in characteristic.descriptors.enumerated() {
                    guard descriptorBuffers[serviceIndex][characteristicIndex].withUnsafeBufferPointer({
                        $0.baseAddress?.advanced(by: descriptorIndex) == pointer
                    }) else { continue }
                    services[serviceIndex].characteristics[characteristicIndex].descriptors[descriptorIndex].value = newValue
                    return true
                }
            }
        }
        return false
    }
}

internal extension NimBLE.Context {
    
    func readCharacteristic(
        handle attributeHandle: UInt16,
        connection: ble_gap_conn_desc,
        accessContext: borrowing GATTServer.AttributeAccessContext
    ) throws(ATTError) {
        guard let characteristic = gattServer.characteristic(for: attributeHandle) else {
            throw .unlikelyError
        }
        let address = BluetoothAddress(bytes: connection.peer_ota_addr.val)
        assert(address != .zero)
        log?("[\(address)] Read characteristic \(characteristic.uuid) - Handle 0x\(attributeHandle.toHexadecimal())")
        let central = Central(id: address)
        let maximumUpdateValueLength = 20 // TODO: Get MTU
        let offset = accessContext.offset
        let data = characteristic.value
        // ask delegate
        let request = GATTReadRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: characteristic.uuid,
            handle: attributeHandle,
            value: data,
            offset: offset
        )
        if let error = gattServer.willRead?(request) {
            throw error
        }
        // respond with data
        var memoryBuffer = accessContext.memoryBuffer
        memoryBuffer.append(contentsOf: data)
    }
    
    func readDescriptor(
        handle attributeHandle: UInt16,
        connection: ble_gap_conn_desc,
        accessContext: borrowing GATTServer.AttributeAccessContext
    ) throws(ATTError) {
        guard let descriptor = gattServer.descriptor(for: accessContext.pointer.pointee.dsc) else {
            throw .unlikelyError
        }
        let address = BluetoothAddress(bytes: connection.peer_ota_addr.val)
        assert(address != .zero)
        log?("[\(address)] Read descriptor \(descriptor.uuid) - Handle 0x\(attributeHandle.toHexadecimal())")
        let central = Central(id: address)
        let maximumUpdateValueLength = 20 // TODO: Get MTU
        let offset = accessContext.offset
        let data = descriptor.value
        // ask delegate
        let request = GATTReadRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: descriptor.uuid,
            handle: attributeHandle,
            value: data,
            offset: offset
        )
        if let error = gattServer.willRead?(request) {
            throw error
        }
        // return data
        var memoryBuffer = accessContext.memoryBuffer
        memoryBuffer.append(contentsOf: data)
    }
    
    mutating func writeCharacteristic(
        handle attributeHandle: UInt16,
        connection: ble_gap_conn_desc,
        accessContext: borrowing GATTServer.AttributeAccessContext
    ) throws(ATTError) {
        guard let characteristic = gattServer.characteristic(for: attributeHandle),
              let newValue = try? [UInt8](accessContext.memoryBuffer) else {
            throw .unlikelyError
        }
        let address = BluetoothAddress(bytes: connection.peer_ota_addr.val)
        assert(address != .zero)
        log?("[\(address)] Write characteristic \(characteristic.uuid) - Handle 0x\(attributeHandle.toHexadecimal())")
        let central = Central(id: address)
        let maximumUpdateValueLength = 20 // TODO: Get MTU
        let oldValue = characteristic.value
        
        // ask delegate
        let request = GATTWriteRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: characteristic.uuid,
            handle: attributeHandle,
            value: oldValue,
            newValue: newValue
        )
        // ask delegate
        if let error = gattServer.willWrite?(request) {
            throw error
        }
        // update value
        let isValidAttribute = gattServer.didWriteCharacteristic(newValue, for: attributeHandle)
        assert(isValidAttribute)
        // confirmation
        let confirmation = GATTWriteConfirmation(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: characteristic.uuid,
            handle: attributeHandle,
            value: newValue
        )
        gattServer.didWrite?(confirmation)
    }
    
    mutating func writeDescriptor(
        handle attributeHandle: UInt16,
        connection: ble_gap_conn_desc,
        accessContext: borrowing GATTServer.AttributeAccessContext
    ) throws(ATTError) {
        guard let descriptor = gattServer.descriptor(for: accessContext.pointer.pointee.dsc),
              let newValue = try? [UInt8](accessContext.memoryBuffer) else {
            throw .unlikelyError
        }
        let address = BluetoothAddress(bytes: connection.peer_ota_addr.val)
        assert(address != .zero)
        log?("[\(address)] Write descriptor \(descriptor.uuid) - Handle 0x\(attributeHandle.toHexadecimal())")
        let central = Central(id: address)
        let maximumUpdateValueLength = 20 // TODO: Get MTU
        let oldValue = descriptor.value
        
        // ask delegate
        let request = GATTWriteRequest(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: descriptor.uuid,
            handle: attributeHandle,
            value: oldValue,
            newValue: newValue
        )
        // ask delegate
        if let error = gattServer.willWrite?(request) {
            throw error
        }
        // update value
        let isValidAttribute = gattServer.didWriteDescriptor(newValue, for: accessContext.pointer.pointee.dsc)
        assert(isValidAttribute)
        // confirmation
        let confirmation = GATTWriteConfirmation(
            central: central,
            maximumUpdateValueLength: maximumUpdateValueLength,
            uuid: descriptor.uuid,
            handle: attributeHandle,
            value: newValue
        )
        gattServer.didWrite?(confirmation)
    }
}

// typedef int ble_gatt_access_fn(uint16_t conn_handle, uint16_t attr_handle, struct ble_gatt_access_ctxt *ctxt, void *arg);
internal func _ble_gatt_access(
    connectionHandle: UInt16,
    attributeHandle: UInt16,
    accessContext accessContextPointer: UnsafeMutablePointer<ble_gatt_access_ctxt>?,
    context contextPointer: UnsafeMutableRawPointer?
) -> CInt {
    guard let context = contextPointer?.assumingMemoryBound(to: NimBLE.Context.self),
          let accessContextPointer = accessContextPointer,
          let connection = try? GAP(context: context).connection(for: connectionHandle) else {
        return BLE_ATT_ERR_UNLIKELY
    }
    let accessContext = GATTServer.AttributeAccessContext(accessContextPointer)
    do {
        switch accessContext.operationType {
        case BLE_GATT_ACCESS_OP_READ_CHR:
            // read characteristic
            try context.pointee.readCharacteristic(
                handle: attributeHandle,
                connection: connection,
                accessContext: accessContext
            )
            
        case BLE_GATT_ACCESS_OP_WRITE_CHR:
            try context.pointee.writeCharacteristic(
                handle: attributeHandle,
                connection: connection,
                accessContext: accessContext
            )
        case BLE_GATT_ACCESS_OP_READ_DSC:
            // read descriptor
            try context.pointee.readDescriptor(
                handle: attributeHandle,
                connection: connection,
                accessContext: accessContext
            )
        case BLE_GATT_ACCESS_OP_WRITE_DSC:
            try context.pointee.writeDescriptor(
                handle: attributeHandle,
                connection: connection,
                accessContext: accessContext
            )
        default:
            assertionFailure("Unknown operation")
            return CInt(ATTError.unlikelyError.rawValue)
        }
    }
    catch {
        return CInt(error.rawValue)
    }
    return 0
}

internal extension GATTServer {
    
    struct AttributeAccessContext: ~Copyable {
        
        let pointer: UnsafeMutablePointer<ble_gatt_access_ctxt>
        
        init(_ pointer: UnsafeMutablePointer<ble_gatt_access_ctxt>) {
            self.pointer = pointer
        }
        
        var memoryBuffer: MemoryBuffer {
            MemoryBuffer(pointer.pointee.om, retain: false)
        }
        
        var operationType: Int32 {
            Int32(pointer.pointee.op)
        }

        var offset: Int {
            0
        }
    }
}

/// NimBLE Memory Buffer
public struct MemoryBuffer: ~Copyable {
    
    var pointer: UnsafeMutablePointer<os_mbuf>
    
    let retain: Bool
    
    public init(_ other: borrowing MemoryBuffer) {
        guard let pointer = r_os_mbuf_dup(other.pointer) else {
            fatalError("Unable to duplicate buffer")
        }
        self.init(pointer, retain: true)
    }
    
    init(_ pointer: UnsafeMutablePointer<os_mbuf>, retain: Bool) {
        self.pointer = pointer
        self.retain = retain
    }
    
    deinit {
        if retain {
            r_os_mbuf_free(pointer)
        }
    }
    
    public mutating func append(_ pointer: UnsafeRawPointer, count: UInt16) throws(NimBLEError) {
        try r_os_mbuf_append(self.pointer, pointer, count).throwsError()
    }
    
    public mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int) {
        do { try append(UnsafeRawPointer(pointer), count: UInt16(count)) }
        catch {
            //fatalError("Unable to append to buffer")
        }
    }
    
    public mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8 {
        guard bytes.isEmpty == false else {
            return
        }
        bytes.withContiguousStorageIfAvailable {
            append($0.baseAddress!, count: $0.count)
        }
    }
    
    public var count: Int {
        Int(r_os_mbuf_len(self.pointer))
    }
}

public extension [UInt8] {
    
    init(_ memoryBuffer: borrowing MemoryBuffer) throws(NimBLEError) {
        let length = memoryBuffer.count
        guard length > 0 else {
            self.init()
            return
        }
        var outLength: UInt16 = 0
        self.init(repeating: 0, count: length)
        try self.withUnsafeMutableBytes {
            ble_hs_mbuf_to_flat(memoryBuffer.pointer, $0.baseAddress, UInt16(length), &outLength)
        }.throwsError()
        assert(outLength == length)
        assert(self.count == length)
    }
}


internal extension ble_uuid_any_t {
    
    init(_ uuid: BluetoothUUID) {
        switch uuid {
        case .bit16(let value):
            self.init(u16: .init(uuid: value))
        case .bit32(let value):
            self.init(u32: .init(uuid: value))
        case .bit128(let value):
            self.init(u128: .init(uuid: value))
        }
    }
    
    init(_ string: String) throws(NimBLEError) {
        self.init()
        try withUnsafeMutablePointer(to: &self) { uuidBuffer in
            string.withCString { cString in
                ble_uuid_from_str(uuidBuffer, cString)
            }
        }.throwsError()
    }
    
    init(buffer: UnsafeRawBufferPointer) throws(NimBLEError) {
        self.init()
        try ble_uuid_init_from_buf(
            &self,
            buffer.baseAddress,
            buffer.count
        ).throwsError()
    }
    
    init(_ pointer: UnsafePointer<ble_uuid_t>) {
        self.init()
        ble_uuid_copy(&self, pointer)
    }
}

extension ble_uuid_any_t: @retroactive CustomStringConvertible {
    
    public var description: String {
        withUnsafeBytes(of: self) { uuidBuffer in
            var cString = [CChar](repeating: 0, count: 37)
            ble_uuid_to_str(
                uuidBuffer.assumingMemoryBound(to: ble_uuid_t.self).baseAddress,
                &cString
            )
            return String(cString: &cString)
        }
    }
}

extension ble_uuid_any_t: @retroactive Equatable {
    
    public static func == (lhs: ble_uuid_any_t, rhs: ble_uuid_any_t) -> Bool {
        withUnsafeBytes(of: lhs) {
            $0.withMemoryRebound(to: ble_uuid_t.self) { lhsPointer in
                withUnsafeBytes(of: rhs) {
                    $0.withMemoryRebound(to: ble_uuid_t.self) { rhsPointer in
                        ble_uuid_cmp(lhsPointer.baseAddress, rhsPointer.baseAddress) == 0
                    }
                }
            }
        }
    }
}

extension ble_uuid_any_t { //: @retroactive DataConvertible {
    
    public var dataLength: Int {
        let value = withUnsafeBytes(of: self) {
            $0.withMemoryRebound(to: ble_uuid_t.self) {
                ble_uuid_length($0.baseAddress)
            }
        }
        return Int(value)
    }
}

internal extension ble_uuid16_t {
    
    init(uuid: UInt16) {
        self.init(u: .init(type: UInt8(BLE_UUID_TYPE_16)), value: uuid)
    }
}

internal extension ble_uuid32_t {
    
    init(uuid: UInt32) {
        self.init(u: .init(type: UInt8(BLE_UUID_TYPE_32)), value: uuid)
    }
}

internal extension ble_uuid128_t {
    
    init(uuid: UInt128) {
        self.init(u: .init(type: UInt8(BLE_UUID_TYPE_128)), value: uuid.bytes)
    }
}
