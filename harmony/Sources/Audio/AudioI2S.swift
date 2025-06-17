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

var zero: UInt32 = 0

// FIXME: #define __time_critical_func(func_name) __not_in_flash_func(func_name)
// irq handler for DMA
@_cdecl("audio_i2s_dma_irq_handler")
func audio_i2s_dma_irq_handler() {
  Application.shared.audioEngine.audio_i2s.handle_dma_irq()
}

struct AudioI2S: ~Copyable {
  var enabled: Bool
  var freq: UInt32
  var playing_buffer: AudioBuffer?

  var pio: UInt32
  var pio_sm: UInt32
  var dma_channel: UInt32
  var pioHw: PIO

  init(
    data_pin: UInt32,
    clock_pin_base: UInt32,
    pio: UInt32,
    pio_sm: UInt32,
    // FIXME: dma_channel is already claimed
    dma_channel: UInt32,
  ) {
    self.enabled = false
    self.freq = 0

    self.pio = pio
    self.pio_sm = pio_sm
    self.dma_channel = dma_channel

    let gpioFunc: gpio_function_rp2040
    switch pio {
    case 0:
      self.pioHw = _pio0()
      gpioFunc = GPIO_FUNC_PIO0
    case 1:
      self.pioHw = _pio1()
      gpioFunc = GPIO_FUNC_PIO1
    default:
      fatalError("Invalid PIO index")
    }

    gpio_set_function(data_pin, gpioFunc)
    gpio_set_function(clock_pin_base, gpioFunc)
    gpio_set_function(clock_pin_base + 1, gpioFunc)

    pio_sm_claim(self.pioHw, self.pio_sm)

    let offset = withUnsafePointer(to: audio_i2s_program) {
      pio_add_program(self.pioHw, $0)
    }

    audio_i2s_program_init(
      self.pioHw, self.pio_sm, UInt32(offset), data_pin, clock_pin_base)

    __mem_fence_release()

    var dma_config = dma_channel_get_default_config(dma_channel)

    channel_config_set_dreq(
      &dma_config,
      UInt32(DREQ_PIO0_TX0.rawValue) + self.pio_sm)

    channel_config_set_transfer_data_size(&dma_config, i2s_dma_configure_size)
    dma_channel_configure(
      dma_channel,
      &dma_config,
      // FIXME: .advanced(by: Int(self.pio_sm))
      self.pioHw.pointer(to: \.txf),  // dest
      nil,  // src
      0,  // count
      false)  // trigger

    irq_add_shared_handler(
      UInt32(DMA_IRQ_0.rawValue) + PICO_AUDIO_I2S_DMA_IRQ,
      audio_i2s_dma_irq_handler,
      UInt8(PICO_SHARED_IRQ_HANDLER_DEFAULT_ORDER_PRIORITY))
    dma_irqn_set_channel_enabled(PICO_AUDIO_I2S_DMA_IRQ, dma_channel, true)
  }

  mutating func enable(_ enable: Bool) {
    guard self.enabled != enable else { return }
    self.enabled = enable

    irq_set_enabled(UInt32(DMA_IRQ_0.rawValue) + PICO_AUDIO_I2S_DMA_IRQ, enable)

    if enable {
      self.audio_start_dma_transfer()
    } else {
      // if there was a buffer in flight, it will not be freed by DMA IRQ,
      // let's do it manually
      self.audio_finish_dma_transfer()
      gpio_put(EM_DRIVE_PIN, false)
    }

    pio_sm_set_enabled(self.pioHw, self.pio_sm, enable)
  }

  mutating func update_pio_frequency(_ sample_freq: UInt32?) {
    guard let sample_freq = sample_freq else { return }
    guard sample_freq != self.freq else { return }

    let system_clock_frequency = clock_get_hz(clk_sys)
    precondition(system_clock_frequency < 0x4000_0000)
    // avoid arithmetic overflow
    let divider = system_clock_frequency * 4 / sample_freq
    precondition(divider < 0x1000000)
    pio_sm_set_clkdiv_int_frac(
      self.pioHw, self.pio_sm, UInt16(divider >> 8), UInt8(divider & 0xff))
    self.freq = sample_freq
  }

  mutating func handle_dma_irq() {
    guard dma_irqn_get_channel_status(PICO_AUDIO_I2S_DMA_IRQ, self.dma_channel)
    else { return }
    dma_irqn_acknowledge_channel(PICO_AUDIO_I2S_DMA_IRQ, self.dma_channel)

    // free the buffer we just finished
    self.audio_finish_dma_transfer()
    self.audio_start_dma_transfer()
  }

  mutating func audio_start_dma_transfer() {
    precondition(self.playing_buffer == nil)

    // FIXME: support dynamic frequency shifting

    if let ab = Application.shared.audioEngine.buffers.popAnalyzedBuffer() {
      gpio_put(EM_DRIVE_PIN, ab.enableMagnet)

      let ab = ab.buffer
      let buf = UnsafeMutableRawBufferPointer(ab.storage)
      self.playing_buffer = consume ab

      var c = dma_get_channel_config(self.dma_channel)
      channel_config_set_read_increment(&c, true)
      dma_channel_set_config(self.dma_channel, &c, false)
      dma_channel_transfer_from_buffer_now(
        self.dma_channel,
        buf.baseAddress,
        // FIXME: using capacity instead of ab count
        UInt32(buf.count) / 4)
    } else {
      gpio_put(EM_DRIVE_PIN, false)
      log("buffer pool low")
      // just play some silence
      var c = dma_get_channel_config(self.dma_channel)
      channel_config_set_read_increment(&c, false)
      dma_channel_set_config(self.dma_channel, &c, false)
      dma_channel_transfer_from_buffer_now(
        self.dma_channel, &zero, PICO_AUDIO_I2S_SILENCE_BUFFER_SAMPLE_LENGTH)
    }
  }

  mutating func audio_finish_dma_transfer() {
    guard let playingBuffer = self.playing_buffer.take() else { return }
    Application.shared.audioEngine.buffers.pushEmptyBuffer(playingBuffer)
  }
}
