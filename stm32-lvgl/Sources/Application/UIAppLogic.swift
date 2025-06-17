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

// This is shared code (via a symlink) between the firmware build and the host
// SDL-based "simulator" app. No platform/firmware specific logic to stay
// portable.
enum UIAppLogic {
  static var clickCount = 0
  static var button: OpaquePointer! = nil
  static var buttonLabel: OpaquePointer! = nil
  static var spinnerLabel: OpaquePointer! = nil

  static var frameCounter = 0

  // Keep styles persistent for the lifetime of the application
  static var style = lv_style_t()
  static var labelStyle = lv_style_t()
  static var gradient = lv_grad_dsc_t()

  static var widgetDemoScreen: OpaquePointer! = nil

  static func createUI() {
    // Get the active screen
    let screen = lv_screen_active()

    // Create a gradient background
    lv_style_init(&style)

    // Create gradient colors (blue to red)
    gradient.dir = LV_GRAD_DIR_VER
    gradient.stops_count = 2
    gradient.stops.0.color = lv_color_make(0, 0, 0)  // Black
    gradient.stops.0.opa = UInt8(LV_OPA_COVER)
    gradient.stops.0.frac = 0
    gradient.stops.1.color = lv_color_make(255, 0, 0)  // Red
    gradient.stops.1.opa = UInt8(LV_OPA_COVER)
    gradient.stops.1.frac = 255

    // Apply gradient to the style background
    lv_style_set_bg_grad(&style, &gradient)
    lv_style_set_bg_opa(&style, UInt8(LV_OPA_COVER))

    // Apply the style to the screen
    lv_obj_add_style(screen, &style, 0)

    // Create a button in the top right
    button = lv_button_create(screen)
    lv_obj_set_size(button, 120, 50)
    lv_obj_align(button, LV_ALIGN_TOP_RIGHT, -10, 10)
    buttonLabel = lv_label_create(button)
    lv_label_set_text(buttonLabel, "Click me")
    lv_obj_center(buttonLabel)
    lv_obj_add_event_cb(
      button,
      { event in
        Self.clickCount += 1
        lv_label_set_text(Self.buttonLabel, "Clicked \(Self.clickCount)")
      }, LV_EVENT_CLICKED, nil)

    // Create a 'Demo' button in the bottom right
    let demoButton = lv_button_create(screen)
    lv_obj_set_size(demoButton, 120, 50)
    lv_obj_align(demoButton, LV_ALIGN_BOTTOM_RIGHT, -10, -10)
    let demoButtonLabel = lv_label_create(demoButton)
    lv_label_set_text(demoButtonLabel, "Widget Demo")
    lv_obj_center(demoButtonLabel)
    lv_obj_add_event_cb(
      demoButton,
      { event in
        lv_screen_load(Self.widgetDemoScreen)
      }, LV_EVENT_CLICKED, nil)

    // Create a label
    let label = lv_label_create(screen)
    lv_label_set_text(label, "Hello LVGL!")
    lv_obj_align(label, LV_ALIGN_TOP_MID, 0, 20)

    // Make the label white for better visibility
    lv_style_init(&labelStyle)
    lv_style_set_text_color(&labelStyle, lv_color_white())
    lv_obj_add_style(label, &labelStyle, 0)

    // Create a spinner
    let spinner = lv_spinner_create(screen)

    // Set spinner size
    lv_obj_set_size(spinner, 60, 60)

    // Center the spinner on screen
    lv_obj_align(spinner, LV_ALIGN_CENTER, 0, 0)

    // Configure spinner animation
    lv_spinner_set_anim_params(spinner, 2_000, 200)  // anim time, angle

    // Create a dropdown menu
    let dropdown = lv_dropdown_create(screen)
    lv_dropdown_set_options(dropdown, "Option 1\nOption 2\nOption 3\nOption 4")
    lv_obj_set_size(dropdown, 150, 40)
    lv_obj_align(dropdown, LV_ALIGN_TOP_LEFT, 10, 10)

    // Add event handler for dropdown selection
    lv_obj_add_event_cb(
      dropdown,
      { event in
        let dropdown = lv_event_get_target_obj(event)
        let selectedIndex = lv_dropdown_get_selected(dropdown)
        print("Selected option \(selectedIndex)")
      }, LV_EVENT_VALUE_CHANGED, nil)

    // Add a label under the spinner
    spinnerLabel = lv_label_create(screen)
    lv_label_set_text(spinnerLabel, "Loading...")
    lv_obj_align(spinnerLabel, LV_ALIGN_BOTTOM_LEFT, 20, -20)
    lv_obj_add_style(spinnerLabel, &labelStyle, 0)

    // Create a 2nd screen with the widgets demo app from LVGL, then switch back
    // to the original screen.
    widgetDemoScreen = lv_obj_create(nil)
    lv_screen_load(widgetDemoScreen)
    @_extern(c) func lv_demo_widgets()
    lv_demo_widgets()
    lv_screen_load(screen)
  }

  static func updateFrame() {
    frameCounter += 1
    lv_label_set_text(spinnerLabel, "Uptime (ms): \(uptimeInMs)\nFrames: \(frameCounter)")
  }
}
