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

// Advanced Audio Distribution Profile

struct MediaCodecConfigurationSBC {
  var reconfigure: UInt8
  var num_channels: UInt8
  var sampling_frequency: UInt16
  var block_length: UInt8
  var subbands: UInt8
  var min_bitpool_value: UInt8
  var max_bitpool_value: UInt8
  var channel_mode: btstack_sbc_channel_mode_t
  var allocation_method: btstack_sbc_allocation_method_t

  init() {
    self.reconfigure = 0
    self.num_channels = 0
    self.sampling_frequency = 0
    self.block_length = 0
    self.subbands = 0
    self.min_bitpool_value = 0
    self.max_bitpool_value = 0
    self.channel_mode = SBC_CHANNEL_MODE_MONO
    self.allocation_method = SBC_ALLOCATION_METHOD_LOUDNESS
  }

  func dump() {
    log(
      """
      - num_channels: \(self.num_channels) 
      - sampling_frequency: \(self.sampling_frequency) 
      - channel_mode: \(self.channel_mode.rawValue) 
      - block_length: \(self.block_length) 
      - subbands: \(self.subbands) 
      - allocation_method: \(self.allocation_method.rawValue) 
      - bitpool_value [\(self.min_bitpool_value), \(self.max_bitpool_value)]
      """)
  }
}

enum StreamState {
  case closed
  case open
  case playing
  case paused
}

struct A2DPConnection {
  static var shared = Self()

  var addr: bd_addr_t = (0, 0, 0, 0, 0, 0)
  var a2dp_cid: UInt16 = 0
  var a2dp_local_seid: UInt8 = 0
  var stream_state: StreamState = .closed
  var sbc_configuration: MediaCodecConfigurationSBC = .init()
}

@_cdecl("a2dp_sink_packet_handler")
func a2dp_sink_packet_handler(
  packet_type: UInt8,
  channel: UInt16,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  guard packet_type == HCI_EVENT_PACKET else { return }
  guard hci_event_packet_get_type(packet) == HCI_EVENT_A2DP_META else { return }

  let subevent = packet?[2]
  switch subevent {
  case UInt8(A2DP_SUBEVENT_SIGNALING_MEDIA_CODEC_OTHER_CONFIGURATION):
    log("A2DP  Sink      : Received non SBC codec - not implemented")

  case UInt8(A2DP_SUBEVENT_SIGNALING_MEDIA_CODEC_SBC_CONFIGURATION):
    log("A2DP  Sink      : Received SBC codec configuration")
    A2DPConnection.shared.sbc_configuration.reconfigure =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_reconfigure(
        packet)
    A2DPConnection.shared.sbc_configuration.num_channels =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_num_channels(
        packet)
    A2DPConnection.shared.sbc_configuration.sampling_frequency =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_sampling_frequency(
        packet)
    A2DPConnection.shared.sbc_configuration.block_length =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_block_length(
        packet)
    A2DPConnection.shared.sbc_configuration.subbands =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_subbands(packet)
    A2DPConnection.shared.sbc_configuration.min_bitpool_value =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_min_bitpool_value(
        packet)
    A2DPConnection.shared.sbc_configuration.max_bitpool_value =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_max_bitpool_value(
        packet)

    let allocation_method =
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_allocation_method(
        packet)

    // Adapt Bluetooth spec definition to SBC Encoder expected input
    A2DPConnection.shared.sbc_configuration.allocation_method =
      (btstack_sbc_allocation_method_t)(allocation_method - 1)

    switch avdtp_channel_mode_t(
      a2dp_subevent_signaling_media_codec_sbc_configuration_get_channel_mode(
        packet))
    {
    case AVDTP_CHANNEL_MODE_JOINT_STEREO:
      A2DPConnection.shared.sbc_configuration.channel_mode =
        SBC_CHANNEL_MODE_JOINT_STEREO
    case AVDTP_CHANNEL_MODE_STEREO:
      A2DPConnection.shared.sbc_configuration.channel_mode =
        SBC_CHANNEL_MODE_STEREO
    case AVDTP_CHANNEL_MODE_DUAL_CHANNEL:
      A2DPConnection.shared.sbc_configuration.channel_mode =
        SBC_CHANNEL_MODE_DUAL_CHANNEL
    case AVDTP_CHANNEL_MODE_MONO:
      A2DPConnection.shared.sbc_configuration.channel_mode =
        SBC_CHANNEL_MODE_MONO
    default:
      fatalError()
    }
    A2DPConnection.shared.sbc_configuration.dump()

  case UInt8(A2DP_SUBEVENT_STREAM_ESTABLISHED):
    let status = a2dp_subevent_stream_established_get_status(packet)
    guard status == ERROR_CODE_SUCCESS else {
      log(
        "A2DP  Sink      : Streaming connection failed, status \(hex: status)"
      )
      return
    }

    a2dp_subevent_stream_established_get_bd_addr(
      packet, &A2DPConnection.shared.addr)
    A2DPConnection.shared.a2dp_cid =
      a2dp_subevent_stream_established_get_a2dp_cid(packet)
    A2DPConnection.shared.a2dp_local_seid =
      a2dp_subevent_stream_established_get_local_seid(packet)
    A2DPConnection.shared.stream_state = .open

    log(
      "A2DP  Sink      : Streaming connection is established, address \(cString: bd_addr_to_str(&A2DPConnection.shared.addr)), cid \(hex: A2DPConnection.shared.a2dp_cid), local seid \(A2DPConnection.shared.a2dp_local_seid)"
    )

  #if ENABLE_AVDTP_ACCEPTOR_EXPLICIT_START_STREAM_CONFIRMATION
  case UInt8(A2DP_SUBEVENT_START_STREAM_REQUESTED):
    log(
      "A2DP  Sink      : Explicit Accept to start stream, local_seid %d\n",
      a2dp_subevent_start_stream_requested_get_local_seid(packet))
    a2dp_sink_start_stream_accept(a2dp_cid, a2dp_local_seid)
  #endif

  case UInt8(A2DP_SUBEVENT_STREAM_STARTED):
    log("A2DP  Sink      : Stream started")
    A2DPConnection.shared.stream_state = .playing
    if A2DPConnection.shared.sbc_configuration.reconfigure != 0 {
      Application.shared.audioEngine.close()
    }
    // prepare media processing
    // audio playback starts when buffer reaches minimal level
    Application.shared.audioEngine.`init`(A2DPConnection.shared.sbc_configuration)

  case UInt8(A2DP_SUBEVENT_STREAM_SUSPENDED):
    log("A2DP  Sink      : Stream paused")
    A2DPConnection.shared.stream_state = .paused
    Application.shared.audioEngine.pause()

  case UInt8(A2DP_SUBEVENT_STREAM_RELEASED):
    log("A2DP  Sink      : Stream released")
    A2DPConnection.shared.stream_state = .closed
    Application.shared.audioEngine.close()

  case UInt8(A2DP_SUBEVENT_SIGNALING_CONNECTION_RELEASED):
    log("A2DP  Sink      : Signaling connection released")
    A2DPConnection.shared.a2dp_cid = 0
    Application.shared.audioEngine.close()

  default:
    log("AVRCP Sink      : Event \(hex: subevent ?? 0xff) is not parsed")
  }
}

/* @section Handle Media Data Packet
 *
 * @text Here the audio data, are received through the a2dp_sink_media_handler callback.
 * Currently, only the SBC media codec is supported. Hence, the media data consists of the media packet header and the SBC packet.
 * The SBC frame will be stored in a ring buffer for later processing (instead of decoding it to PCM right away which would require a much larger buffer).
 * If the audio stream wasn't started already and there are enough SBC frames in the ring buffer, start playback.
 */

func read_media_data_header(
  _ packet: UnsafeMutablePointer<UInt8>?,
  _ size: Int32,
  _ offset: UnsafeMutablePointer<Int32>,
  _ media_header: UnsafeMutablePointer<avdtp_media_packet_header_t>
) -> Bool {
  guard let packet else { return false }
  let media_header_len: Int32 = 12  // without crc
  var pos = Int(offset.pointee)

  if size - Int32(pos) < media_header_len {
    log(
      "Not enough data to read media packet header, expected \(media_header_len), received \(size-Int32(pos))"
    )
    return false
  }

  media_header.pointee.version = packet[pos] & 0x03
  media_header.pointee.padding = UInt8(get_bit16(UInt16(packet[pos]), 2))
  media_header.pointee.extension = UInt8(get_bit16(UInt16(packet[pos]), 3))
  media_header.pointee.csrc_count = (packet[pos] >> 4) & 0x0F
  pos += 1

  media_header.pointee.marker = UInt8(get_bit16(UInt16(packet[pos]), 0))
  media_header.pointee.payload_type = (packet[pos] >> 1) & 0x7F
  pos += 1

  media_header.pointee.sequence_number = UInt16(
    big_endian_read_16(packet, Int32(pos)))
  pos += 2

  media_header.pointee.timestamp = big_endian_read_32(packet, Int32(pos))
  pos += 4

  media_header.pointee.synchronization_source = big_endian_read_32(
    packet, Int32(pos))
  pos += 4
  offset.pointee = Int32(pos)
  return true
}

func read_sbc_header(
  _ packet: UnsafeMutablePointer<UInt8>?,
  _ size: Int32,
  _ offset: UnsafeMutablePointer<Int32>,
  _ sbc_header: UnsafeMutablePointer<avdtp_sbc_codec_header_t>
) -> Bool {
  guard let packet else { return false }
  let sbc_header_len: Int32 = 12  // without crc
  var pos: Int32 = offset.pointee

  if size - pos < sbc_header_len {
    log(
      "Not enough data to read SBC header, expected \(sbc_header_len), received \(size-pos)"
    )
    return false
  }

  sbc_header.pointee.fragmentation = UInt8(
    get_bit16(UInt16(packet[Int(pos)]), 7))
  sbc_header.pointee.starting_packet = UInt8(
    get_bit16(UInt16(packet[Int(pos)]), 6))
  sbc_header.pointee.last_packet = UInt8(get_bit16(UInt16(packet[Int(pos)]), 5))
  sbc_header.pointee.num_frames = UInt8(packet[Int(pos)] & 0x0f)
  pos += 1
  offset.pointee = pos
  return true
}

@_cdecl("a2dp_sink_media_handler")
func a2dp_sink_media_handler(
  seid: UInt8,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  var pos: Int32 = 0

  var media_header = avdtp_media_packet_header_t()
  guard read_media_data_header(packet, Int32(size), &pos, &media_header) else {
    log("Failed to read media data header")
    return
  }

  var sbc_header = avdtp_sbc_codec_header_t()
  guard read_sbc_header(packet, Int32(size), &pos, &sbc_header) else {
    log("Failed to read SBC header")
    return
  }

  let packet_length = UInt32(size) - UInt32(pos)
  let packet_begin = packet?.advanced(by: Int(pos))
  let sbc_frame_size = Int(packet_length / UInt32(sbc_header.num_frames))

  let packetBuffer = UnsafeMutableBufferPointer(
    start: packet_begin, count: Int(packet_length))
  Application.shared.audioEngine.audio_pico.enqueue(
    sbc_frames: packetBuffer, frame_size: sbc_frame_size)
  Application.shared.audioEngine.start()
}
