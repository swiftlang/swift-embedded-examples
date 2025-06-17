//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import CLVGL
import Foundation
import SDL

let drawSize: (width: Int32, height: Int32) = (width: 480, height: 272)
let windowScale: Int32 = 2

var clickCount = 0
var button: OpaquePointer! = nil
var buttonLabel: OpaquePointer! = nil
var uptimeInMs: Int = 0

var texture: OpaquePointer! = nil
var mouseEvent = SDL_Event()

@main
struct Main {
  static func main() {
    lv_init()
    lv_log_register_print_cb({ level, buf in print(String(cString: buf!), terminator: "") })
    lv_tick_set_cb({ UInt32(uptimeInMs) })

    let bufSize: UInt32 = UInt32(drawSize.width * drawSize.height * 4)
    let buf1 = UnsafeMutableRawPointer.allocate(byteCount: Int(bufSize), alignment: 16)
    let buf2 = UnsafeMutableRawPointer.allocate(byteCount: Int(bufSize), alignment: 16)

    let disp = lv_display_create(Int32(drawSize.width), Int32(drawSize.height))!
    lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)
    lv_display_set_buffers(disp, buf1, buf2, bufSize, LV_DISPLAY_RENDER_MODE_FULL)
    lv_display_set_flush_cb(
      disp,
      { disp, _, bufferToShow in
        _ = SDL_UpdateTexture(texture, nil, bufferToShow, Int32(drawSize.width * 4))
        lv_display_flush_ready(disp)
      })

    let touch = lv_indev_create()
    lv_indev_set_type(touch, LV_INDEV_TYPE_POINTER)
    lv_indev_set_read_cb(
      touch,
      { indev, data in
        if mouseEvent.type == SDL_MOUSEBUTTONDOWN.rawValue {
          data!.pointee.point.x = Int32(mouseEvent.button.x) / windowScale
          data!.pointee.point.y = Int32(mouseEvent.button.y) / windowScale
          data!.pointee.state = LV_INDEV_STATE_PRESSED
        } else if mouseEvent.type == SDL_MOUSEMOTION.rawValue && mouseEvent.motion.state & 0x1 != 0 {
          data!.pointee.point.x = Int32(mouseEvent.motion.x) / windowScale
          data!.pointee.point.y = Int32(mouseEvent.motion.y) / windowScale
          data!.pointee.state = LV_INDEV_STATE_PRESSED
        } else {
          data!.pointee.state = LV_INDEV_STATE_RELEASED
        }
      })

    UIAppLogic.createUI()

    // Initialize SDL video systems
    guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
      fatalError("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
    }

    // Create a window at the center of the screen
    let window = SDL_CreateWindow(
      "SDL Window", Int32(SDL_WINDOWPOS_CENTERED_MASK),
      Int32(SDL_WINDOWPOS_CENTERED_MASK), drawSize.width * windowScale, drawSize.height * windowScale,
      SDL_WINDOW_SHOWN.rawValue)

    // Create renderer
    guard let renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED.rawValue) else {
      fatalError("Renderer could not be created! SDL_Error: \(String(cString: SDL_GetError()))")
    }

    // Create texture
    texture = SDL_CreateTexture(
      renderer, SDL_PIXELFORMAT_ARGB8888.rawValue,
      Int32(SDL_TEXTUREACCESS_STREAMING.rawValue), drawSize.width, drawSize.height)
    guard texture != nil else {
      fatalError("Texture could not be created! SDL_Error: \(String(cString: SDL_GetError()))")
    }

    var event = SDL_Event()
    var frameCounter = 0
    let startTime = Date()
    mainLoop: while true {
      uptimeInMs = Int(Date().timeIntervalSince(startTime) * 1000)
      let delay = lv_timer_handler()

      // Clear renderer, copy texture to renderer, and present
      SDL_RenderClear(renderer)
      SDL_RenderCopy(renderer, texture, nil, nil)
      SDL_RenderPresent(renderer)

      while SDL_PollEvent(&event) > 0 {
        if event.type == SDL_MOUSEBUTTONDOWN.rawValue {
          mouseEvent = event
        }
        if event.type == SDL_MOUSEBUTTONUP.rawValue {
          mouseEvent = event
        }
        if event.type == SDL_MOUSEMOTION.rawValue {
          mouseEvent = event
        }
        if event.type == SDL_QUIT.rawValue {
          break mainLoop
        }
      }

      SDL_Delay(delay)

      UIAppLogic.updateFrame()
    }

    SDL_DestroyWindow(window)
    SDL_Quit()
  }
}
