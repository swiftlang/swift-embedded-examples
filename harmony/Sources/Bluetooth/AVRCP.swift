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

// Audio/Video Remote Control Profile

struct AVRCPConnection {
  var addr: bd_addr_t
  var avrcp_cid: UInt16
  var playing: Bool
  var notifications_supported_by_target: UInt16
}

var avrcp_connection = AVRCPConnection(
  addr: (0, 0, 0, 0, 0, 0),
  avrcp_cid: 0,
  playing: false,
  notifications_supported_by_target: 0)

@_cdecl("avrcp_packet_handler")
func avrcp_packet_handler(
  packet_type: UInt8,
  channel: UInt16,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  guard packet_type == HCI_EVENT_PACKET else { return }
  guard hci_event_packet_get_type(packet) == HCI_EVENT_AVRCP_META else {
    return
  }

  let subevent = packet?[2]
  switch subevent {
  case UInt8(AVRCP_SUBEVENT_CONNECTION_ESTABLISHED):
    log("AVRCP_SUBEVENT_CONNECTION_ESTABLISHED")
    let local_cid = avrcp_subevent_connection_established_get_avrcp_cid(packet)
    let status = avrcp_subevent_connection_established_get_status(packet)

    if status != ERROR_CODE_SUCCESS {
      log("AVRCP: Connection failed, status \(hex: status)")
      avrcp_connection.avrcp_cid = 0
      return
    }

    avrcp_connection.avrcp_cid = local_cid
    var address: bd_addr_t = (0, 0, 0, 0, 0, 0)
    avrcp_subevent_connection_established_get_bd_addr(packet, &address)
    log(
      "AVRCP: Connected to \(cString: bd_addr_to_str(&address)), cid \(hex: avrcp_connection.avrcp_cid)"
    )

    avrcp_target_support_event(
      avrcp_connection.avrcp_cid, AVRCP_NOTIFICATION_EVENT_VOLUME_CHANGED)
    avrcp_target_support_event(
      avrcp_connection.avrcp_cid, AVRCP_NOTIFICATION_EVENT_BATT_STATUS_CHANGED)
    let battery_status = AVRCP_BATTERY_STATUS_WARNING
    avrcp_target_battery_status_changed(
      avrcp_connection.avrcp_cid, battery_status)

    // query supported events:
    avrcp_controller_get_supported_events(avrcp_connection.avrcp_cid)

  case UInt8(AVRCP_SUBEVENT_CONNECTION_RELEASED):
    log("AVRCP_SUBEVENT_CONNECTION_RELEASED")
    log(
      "AVRCP: Channel released: cid \(hex: avrcp_subevent_connection_released_get_avrcp_cid(packet))"
    )
    avrcp_connection.avrcp_cid = 0
    avrcp_connection.notifications_supported_by_target = 0

  default:
    log("AVRCP: Event \(hex: subevent ?? 0xff) is not parsed")
  }
}

@_cdecl("avrcp_controller_packet_handler")
func avrcp_controller_packet_handler(
  packet_type: UInt8,
  channel: UInt16,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  guard packet_type == HCI_EVENT_PACKET else { return }
  guard hci_event_packet_get_type(packet) == HCI_EVENT_AVRCP_META else {
    return
  }
  guard avrcp_connection.avrcp_cid != 0 else { return }

  let subevent = packet?[2]
  switch subevent {
  case UInt8(AVRCP_SUBEVENT_GET_CAPABILITY_EVENT_ID):
    avrcp_connection.notifications_supported_by_target |=
      (1 << avrcp_subevent_get_capability_event_id_get_event_id(packet))

  case UInt8(AVRCP_SUBEVENT_GET_CAPABILITY_EVENT_ID_DONE):
    log("AVRCP Controller: supported notifications by target:")
    for event_id in UInt8(
      AVRCP_NOTIFICATION_EVENT_FIRST_INDEX.rawValue)..<UInt8(
        AVRCP_NOTIFICATION_EVENT_LAST_INDEX.rawValue)
    {
      let supported =
        (avrcp_connection.notifications_supported_by_target & (1 << event_id))
        != 0
      let event_id = avrcp_notification_event_id_t(event_id)
      log(
        "   - [\(supported ? "X" : " ")] \(cString: avrcp_notification2str(event_id))"
      )
    }
    log("")

    // automatically enable notifications
    avrcp_controller_enable_notification(
      avrcp_connection.avrcp_cid,
      AVRCP_NOTIFICATION_EVENT_PLAYBACK_STATUS_CHANGED)
    avrcp_controller_enable_notification(
      avrcp_connection.avrcp_cid,
      AVRCP_NOTIFICATION_EVENT_NOW_PLAYING_CONTENT_CHANGED)
    avrcp_controller_enable_notification(
      avrcp_connection.avrcp_cid, AVRCP_NOTIFICATION_EVENT_TRACK_CHANGED)

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_STATE):
    let event_id = avrcp_notification_event_id_t(
      avrcp_subevent_notification_state_get_event_id(packet))
    log(
      "AVRCP Controller: \(cString: avrcp_notification2str(event_id)) notification registered"
    )

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_PLAYBACK_POS_CHANGED):
    let playback_position_ms =
      avrcp_subevent_notification_playback_pos_changed_get_playback_position_ms(
        packet)
    log(
      "AVRCP Controller: Playback position changed, position \(playback_position_ms) ms\n"
    )

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_PLAYBACK_STATUS_CHANGED):
    let play_status =
      avrcp_subevent_notification_playback_status_changed_get_play_status(
        packet)
    log(
      "AVRCP Controller: Playback status changed \(cString: avrcp_play_status2str(play_status))"
    )
    switch avrcp_playback_status_t(play_status) {
    case AVRCP_PLAYBACK_STATUS_PLAYING:
      avrcp_connection.playing = true
    default:
      avrcp_connection.playing = false
    }

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_NOW_PLAYING_CONTENT_CHANGED):
    log("AVRCP Controller: Playing content changed")

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_TRACK_CHANGED):
    log("AVRCP Controller: Track changed")

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_AVAILABLE_PLAYERS_CHANGED):
    log("AVRCP Controller: Available Players Changed")

  case UInt8(AVRCP_SUBEVENT_SHUFFLE_AND_REPEAT_MODE):
    let shuffle_mode = avrcp_subevent_shuffle_and_repeat_mode_get_shuffle_mode(
      packet)
    let repeat_mode = avrcp_subevent_shuffle_and_repeat_mode_get_repeat_mode(
      packet)
    log(
      "AVRCP Controller: \(cString: avrcp_shuffle2str(shuffle_mode)), \(cString: avrcp_repeat2str(repeat_mode))"
    )

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_TRACK_INFO):
    let track = avrcp_subevent_now_playing_track_info_get_track(packet)
    log("AVRCP Controller: Track \(track)")

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_TOTAL_TRACKS_INFO):
    let totalTracks =
      avrcp_subevent_now_playing_total_tracks_info_get_total_tracks(packet)
    log("AVRCP Controller: Total Tracks \(totalTracks)")

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_TITLE_INFO):
    let count = avrcp_subevent_now_playing_title_info_get_value_len(packet)
    guard count > 0 else { break }
    let avrcp_subevent_value = UnsafeBufferPointer(
      start: avrcp_subevent_now_playing_title_info_get_value(packet),
      count: Int(count))
    log("AVRCP Controller: Title \(cString: avrcp_subevent_value)")

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_ARTIST_INFO):
    let count = avrcp_subevent_now_playing_artist_info_get_value_len(packet)
    guard count > 0 else { break }
    let avrcp_subevent_value = UnsafeBufferPointer(
      start: avrcp_subevent_now_playing_artist_info_get_value(packet),
      count: Int(count))
    log("AVRCP Controller: Artist \(cString: avrcp_subevent_value)")

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_ALBUM_INFO):
    let count = avrcp_subevent_now_playing_album_info_get_value_len(packet)
    guard count > 0 else { break }
    let avrcp_subevent_value = UnsafeBufferPointer(
      start: avrcp_subevent_now_playing_album_info_get_value(packet),
      count: Int(count))
    log("AVRCP Controller: Album \(cString: avrcp_subevent_value)")

  case UInt8(AVRCP_SUBEVENT_NOW_PLAYING_GENRE_INFO):
    let count = avrcp_subevent_now_playing_genre_info_get_value_len(packet)
    guard count > 0 else { break }
    let avrcp_subevent_value = UnsafeBufferPointer(
      start: avrcp_subevent_now_playing_genre_info_get_value(packet),
      count: Int(count))
    log("AVRCP Controller: Genre \(cString: avrcp_subevent_value)")

  case UInt8(AVRCP_SUBEVENT_PLAY_STATUS):
    let songLength = avrcp_subevent_play_status_get_song_length(packet)
    let songPosition = avrcp_subevent_play_status_get_song_position(packet)
    let playStatus = avrcp_play_status2str(
      avrcp_subevent_play_status_get_play_status(packet))
    log(
      "AVRCP Controller: Song length \(songLength) ms, Song position \(songPosition) ms, Play status \(cString: playStatus)"
    )

  case UInt8(AVRCP_SUBEVENT_OPERATION_COMPLETE):
    let operationId = avrcp_operation2str(
      avrcp_subevent_operation_complete_get_operation_id(packet))
    log("AVRCP Controller: \(cString: operationId) complete")

  case UInt8(AVRCP_SUBEVENT_OPERATION_START):
    let operationId = avrcp_operation2str(
      avrcp_subevent_operation_start_get_operation_id(packet))
    log("AVRCP Controller: \(cString: operationId) start")

  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_EVENT_TRACK_REACHED_END):
    log("AVRCP Controller: Track reached end")

  case UInt8(AVRCP_SUBEVENT_PLAYER_APPLICATION_VALUE_RESPONSE):
    let commandType = avrcp_ctype2str(
      avrcp_subevent_player_application_value_response_get_command_type(packet))
    log("AVRCP Controller: Set Player App Value \(cString: commandType)")

  default:
    break
  }
}

@_cdecl("avrcp_target_packet_handler")
func avrcp_target_packet_handler(
  packet_type: UInt8,
  channel: UInt16,
  packet: UnsafeMutablePointer<UInt8>?,
  size: UInt16
) {
  guard packet_type == HCI_EVENT_PACKET else { return }
  guard hci_event_packet_get_type(packet) == HCI_EVENT_AVRCP_META else {
    return
  }

  let subevent = packet?[2]
  switch subevent {
  case UInt8(AVRCP_SUBEVENT_NOTIFICATION_VOLUME_CHANGED):
    let volume = avrcp_subevent_notification_volume_changed_get_absolute_volume(
      packet)
    log("AVRCP Target    : Volume set to [\(volume) / 127]")
    Application.shared.audioEngine.set(volume: volume << 1)

  case UInt8(AVRCP_SUBEVENT_OPERATION):
    let operation_id = avrcp_operation_id_t(
      avrcp_subevent_operation_get_operation_id(packet))
    let button_state: StaticString =
      avrcp_subevent_operation_get_button_pressed(packet) > 0
      ? "PRESS" : "RELEASE"
    switch operation_id {
    case AVRCP_OPERATION_ID_VOLUME_UP:
      log("AVRCP Target    : VOLUME UP (\(button_state))")
    case AVRCP_OPERATION_ID_VOLUME_DOWN:
      log("AVRCP Target    : VOLUME DOWN (\(button_state))")
    default:
      return
    }

  default:
    log("AVRCP Target    : Event \(hex: subevent ?? 0xff) is not parsed")
  }
}
