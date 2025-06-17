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

// swift-format-ignore: AlwaysUseLowerCamelCase, NeverForceUnwrap

struct A2DPStreamEndpoint {
  var a2dp_local_seid: UInt8 = 0
  var media_sbc_codec_configuration: (UInt8, UInt8, UInt8, UInt8) = (0, 0, 0, 0)
}

var hci_event_callback_registration = btstack_packet_callback_registration_t()
var stream_endpoint = A2DPStreamEndpoint()

// we support all configurations with bitpool 2-53
var media_sbc_codec_capabilities: (UInt8, UInt8, UInt8, UInt8) = (
  //(AVDTP_SBC_44100 << 4) | AVDTP_SBC_STEREO,
  0xFF,
  //(AVDTP_SBC_BLOCK_LENGTH_16 << 4) | (AVDTP_SBC_SUBBANDS_8 << 2) | AVDTP_SBC_ALLOCATION_METHOD_LOUDNESS,
  0xFF,
  2, 53
)

// FIXME: use Vector
let sdp_avdtp_sink_service_buffer = UnsafeMutableRawBufferPointer.allocate(
  byteCount: 150,
  alignment: MemoryLayout<UInt8>.alignment)
// FIXME: use Vector
let sdp_avrcp_target_service_buffer = UnsafeMutableRawBufferPointer.allocate(
  byteCount: 150,
  alignment: MemoryLayout<UInt8>.alignment)
// FIXME: use Vector
let sdp_avrcp_controller_service_buffer =
  UnsafeMutableRawBufferPointer.allocate(
    byteCount: 200,
    alignment: MemoryLayout<UInt8>.alignment)
// FIXME: use Vector
let device_id_sdp_service_buffer = UnsafeMutableRawBufferPointer.allocate(
  byteCount: 100,
  alignment: MemoryLayout<UInt8>.alignment)

// FIXME: use `Vector`
func buttonCallback(pin: UInt32, event: UInt32) {
  guard event & UInt32(GPIO_IRQ_EDGE_FALL.rawValue) != 0 else { return }
  Application.shared.buttonPressed(pin: pin)
}

let BUFFER_SAMPLE_CAPACITY = 512


let LED_STRIP_LED_COUNT = 20

let MUTE_BUTTON_PIN: UInt32 = 6
let ROTARY_ENCODER_A_PIN : UInt32 = 7
let ROTARY_ENCODER_B_PIN: UInt32 = 8
let PLAY_PAUSE_BUTTON_PIN: UInt32 = 9
let PREVIOUS_BUTTON_PIN: UInt32 = 10
let NEXT_BUTTON_PIN: UInt32 = 11
let LED_STRIP_PIN: UInt32 = 17
let EM_DRIVE_PIN: UInt32 = 18

let WIRELESS_LED_PIN = UInt32(CYW43_WL_GPIO_LED_PIN)

struct Application: ~Copyable {
  var audioEngine = AudioEngine()

  var audioAnalyzer = AudioAnalyzer()

  let wirelessLedBlinkPeriodMs: UInt32 = 1000
  var wirelessLedBlinkTimer = btstack_timer_source_t()
  var wirelessLedBlinkState = false

  let ledStripUpdatePeriodMs: UInt32 = 1000
  var ledStripUpdateTimer = btstack_timer_source_t()
  var ledStrip = LEDStrip(
    dataPin: LED_STRIP_PIN,
    ledCount: LED_STRIP_LED_COUNT,
    pio: 0,
    pioSm: 1)

  let volumeKnobSamplerPeriodMs: UInt32 = 100
  var volumeKnobSamplerTimer = btstack_timer_source_t()
  var volumeKnob = QuadratureEncoder(
    pinA: ROTARY_ENCODER_A_PIN,
    pinB: ROTARY_ENCODER_B_PIN,
    pio: 1,
    pioSm: 0)

  var previousPressTimes = ButtonTimes()

  var muteButton = Button(
    pin: MUTE_BUTTON_PIN,
    onPress: buttonCallback)
  var nextButton = Button(
    pin: NEXT_BUTTON_PIN,
    onPress: buttonCallback)
  var playPauseButton = Button(
    pin: PLAY_PAUSE_BUTTON_PIN,
    onPress: buttonCallback)
  var previousButton = Button(
    pin: PREVIOUS_BUTTON_PIN,
    onPress: buttonCallback)

  mutating func run() {
    stdio_init_all()
    i2c_init()

    multicore_launch_core1 {
      log("core1_main")
      Application.shared.audioAnalyzer.run()
    }

    log("Hello!")
    log("sys clock running at \(clock_get_hz(clk_sys)) Hz")
    log("Initializing cyw43_driver")
    precondition(cyw43_arch_init() == 0, "cyw43_arch_init failed")
    wirelessLedBlink(count: 2)

    gpio_init(EM_DRIVE_PIN)
    gpio_set_dir(EM_DRIVE_PIN, true)
    
    var sdp = ServiceDiscoveryProtocol()
    _setup_demo(&sdp)
    
  
    // turn on!
    log("Starting BTstack ...")
    hci_power_control(HCI_POWER_ON)
    wirelessLedBlink(count: 2)
    log("[main] Started, starting btstack run loop")

    btstack_run_loop_set_timer_handler(&self.volumeKnobSamplerTimer) { timer in
      guard let timer else { return }
      Application.shared.volumeKnobSamplerHandler(&timer.pointee)
    }
    btstack_run_loop_set_timer(&self.volumeKnobSamplerTimer, volumeKnobSamplerPeriodMs)
    btstack_run_loop_add_timer(&self.volumeKnobSamplerTimer)

    btstack_run_loop_set_timer_handler(&self.ledStripUpdateTimer) { timer in
      guard let timer else { return }
      Application.shared.ledStripUpdateHandler(&timer.pointee)
    }
    btstack_run_loop_set_timer(&self.ledStripUpdateTimer, ledStripUpdatePeriodMs)
    btstack_run_loop_add_timer(&self.ledStripUpdateTimer)

    btstack_run_loop_set_timer_handler(&self.wirelessLedBlinkTimer) { timer in
      guard let timer else { return }
      Application.shared.wirelessLedBlinkHandler(&timer.pointee)
    }
    btstack_run_loop_set_timer(&self.wirelessLedBlinkTimer, wirelessLedBlinkPeriodMs)
    btstack_run_loop_add_timer(&self.wirelessLedBlinkTimer)


    btstack_run_loop_execute() // btstack_run_loop_execute never returns
    _ = sdp // make sure SDP lives until the runloop exits
  }
}

// Timer handlers
extension Application {
  mutating func volumeKnobSamplerHandler(_ timer: inout btstack_timer_source_t) {
    let scaleFactor: Int32 = 5
    audioEngine.adjustVolume(by: Application.shared.volumeKnob.delta() * scaleFactor)
    btstack_run_loop_set_timer(&timer, volumeKnobSamplerPeriodMs)
    btstack_run_loop_add_timer(&timer)
  }

  mutating func ledStripUpdateHandler(_ timer: inout btstack_timer_source_t) {
    ledStrip.setColor(
      red: .random(in: 0...255),
      green: .random(in: 0...255),
      blue: .random(in: 0...255))
    btstack_run_loop_set_timer(&timer, ledStripUpdatePeriodMs)
    btstack_run_loop_add_timer(&timer)
  }

  mutating func wirelessLedBlinkHandler(_ timer: inout btstack_timer_source_t) {
    self.wirelessLedBlinkState.toggle()
    cyw43_arch_gpio_put(WIRELESS_LED_PIN, self.wirelessLedBlinkState)
    btstack_run_loop_set_timer(&timer, wirelessLedBlinkPeriodMs)
    btstack_run_loop_add_timer(&timer)
  }
}

// Button press callbacks
extension Application {
  // FIXME: use `time_us_64`
  // This is a particularly large debounce time
  static let buttonDebounceTimeMs = 150
  mutating func buttonPressed(pin: UInt32) {
    let currentTime = to_ms_since_boot(get_absolute_time())
    guard currentTime - previousPressTimes[pin] > Self.buttonDebounceTimeMs else {
      log("soft debounce \(pin)")
      return
    }
    previousPressTimes[pin] = currentTime

    switch pin {
    case MUTE_BUTTON_PIN:
      self.toggleMute()
    case NEXT_BUTTON_PIN:
      self.nextTrack()
    case PLAY_PAUSE_BUTTON_PIN:
      self.playPauseTrack()
    case PREVIOUS_BUTTON_PIN:
      self.previousTrack()
    default:
      // ignore
      break
    }
  }

  mutating func toggleMute() {
    self.audioEngine.toggleMute()
  }

  mutating func nextTrack() {
    log("avrcp_controller_forward")
    avrcp_controller_forward(avrcp_connection.avrcp_cid)
  }

  mutating func playPauseTrack() {
    // FIXME: this state management is almost certainly wrong
    if audioEngine.running {
      log("avrcp_controller_stop")
      avrcp_controller_pause(avrcp_connection.avrcp_cid)
    } else {
      log("avrcp_controller_play")
      avrcp_controller_play(avrcp_connection.avrcp_cid)
    }
  }

  mutating func previousTrack() {
    log("avrcp_controller_backward")
    avrcp_controller_backward(avrcp_connection.avrcp_cid)
  }
}

extension Application {
  func wirelessLedBlink(count: UInt32) {
    for _ in 0..<count {
      cyw43_arch_gpio_put(WIRELESS_LED_PIN, true)
      sleep_ms(100)
      cyw43_arch_gpio_put(WIRELESS_LED_PIN, false)
      sleep_ms(100)
    }
  }
}

extension Application {
  /*
  Shows how to set up AD2P Sink and AVRCP services.

  Besides calling init() method for each service, you'll also need to register several packet handlers:
  - hci_packet_handler - handles legacy pairing, here by using fixed '0000' pin code.
  - a2dp_sink_packet_handler - handles events on stream connection status (established, released), the media codec configuration, and, the status of the stream itself (opened, paused, stopped).
  - l2cap_media_data_packet_handler - used to receive streaming data.
  - avrcp_packet_handler - receives AVRCP connect/disconnect event.
  - avrcp_controller_packet_handler - receives answers for sent AVRCP commands.
  - avrcp_target_packet_handler - receives AVRCP commands, and registered notifications.

  To announce A2DP Sink and AVRCP services, you need to create corresponding
  SDP records and register them with the SDP service.
  */

  func _setup_demo(_ sdp: inout ServiceDiscoveryProtocol) {
    // init protocols
    l2cap_init()

    // Init profiles
    a2dp_sink_init()
    avrcp_init()
    avrcp_controller_init()
    avrcp_target_init()

    // Configure A2DP Sink
    a2dp_sink_register_packet_handler(a2dp_sink_packet_handler)
    a2dp_sink_register_media_handler(a2dp_sink_media_handler)
    let local_stream_endpoint = a2dp_sink_create_stream_endpoint(
      AVDTP_AUDIO,
      AVDTP_CODEC_SBC, &media_sbc_codec_capabilities,
      UInt16(MemoryLayout.size(ofValue: media_sbc_codec_capabilities)),
      &stream_endpoint.media_sbc_codec_configuration,
      UInt16(
        MemoryLayout.size(
          ofValue: stream_endpoint.media_sbc_codec_configuration)))
    precondition(local_stream_endpoint != nil)
    // - Store stream enpoint's SEP ID, as it is used by A2DP API to identify the stream endpoint
    stream_endpoint.a2dp_local_seid = avdtp_local_seid(local_stream_endpoint)

    // Configure AVRCP Controller + Target
    avrcp_register_packet_handler(avrcp_packet_handler)
    avrcp_controller_register_packet_handler(avrcp_controller_packet_handler)
    avrcp_target_register_packet_handler(avrcp_target_packet_handler)

    // Configure SDP
    // - Create and register A2DP Sink service record
    sdp_avdtp_sink_service_buffer.initializeMemory(as: UInt8.self, repeating: 0)
    a2dp_sink_create_sdp_record(
      sdp_avdtp_sink_service_buffer.baseAddress,
      sdp.makeServiceRecordHandle(),
      UInt16(AVDTP_SINK_FEATURE_MASK_HEADPHONE),
      nil,
      nil)
    sdp.registerService(record: sdp_avdtp_sink_service_buffer)

    // - Create AVRCP Controller service record and register it with SDP. We send Category 1 commands to the media player, e.g. play/pause
    sdp_avrcp_controller_service_buffer.initializeMemory(as: UInt8.self, repeating: 0)
    let controller_supported_features: UInt16 =
      1
      << AVRCP_CONTROLLER_SUPPORTED_FEATURE_CATEGORY_PLAYER_OR_RECORDER.rawValue
    avrcp_controller_create_sdp_record(
      sdp_avrcp_controller_service_buffer.baseAddress,
      sdp.makeServiceRecordHandle(),
      controller_supported_features,
      nil,
      nil)
    sdp.registerService(record: sdp_avrcp_controller_service_buffer)

    // - Create and register A2DP Sink service record
    //   -  We receive Category 2 commands from the media player, e.g. volume up/down
    sdp_avrcp_target_service_buffer.initializeMemory(as: UInt8.self, repeating: 0)
    let target_supported_features: UInt16 =
      1 << AVRCP_TARGET_SUPPORTED_FEATURE_CATEGORY_MONITOR_OR_AMPLIFIER.rawValue
    avrcp_target_create_sdp_record(
      sdp_avrcp_target_service_buffer.baseAddress,
      sdp.makeServiceRecordHandle(),
      target_supported_features,
      nil,
      nil)
    sdp.registerService(record: sdp_avrcp_target_service_buffer)

    // - Create and register Device ID (PnP) service record
    device_id_sdp_service_buffer.initializeMemory(as: UInt8.self, repeating: 0)
    device_id_create_sdp_record(
      device_id_sdp_service_buffer.baseAddress,
      sdp.makeServiceRecordHandle(),
      UInt16(DEVICE_ID_VENDOR_ID_SOURCE_BLUETOOTH),
      UInt16(BLUETOOTH_COMPANY_ID_BLUEKITCHEN_GMBH),
      1,
      1)
    sdp.registerService(record: device_id_sdp_service_buffer)

    // Configure GAP - discovery / connection

    // - Set local name with a template Bluetooth address, that will be automatically
    //   replaced with an actual address once it is available, i.e. when BTstack boots
    //   up and starts talking to a Bluetooth module.
    gap_set_local_name("Harmony")

    // - Allow to show up in Bluetooth inquiry
    gap_discoverable_control(1)

    // - Set Class of Device - Service Class: Audio, Major Device Class: Audio, Minor: Headphone
    gap_set_class_of_device(0x200404)

    // - Allow for role switch in general and sniff mode
    gap_set_default_link_policy_settings(
      UInt16(
        LM_LINK_POLICY_ENABLE_ROLE_SWITCH | LM_LINK_POLICY_ENABLE_SNIFF_MODE))

    // - Allow for role switch on outgoing connections
    //   - This allows A2DP Source, e.g. smartphone, to become master when we re-connect to it.
    gap_set_allow_role_switch(true)

    // Register for HCI events
    hci_event_callback_registration.callback = hci_packet_handler
    hci_add_event_handler(&hci_event_callback_registration)
  }
}


@main
extension Application {
  static var shared = Application()

  static func main() {
    Self.shared.run()
  }
}
