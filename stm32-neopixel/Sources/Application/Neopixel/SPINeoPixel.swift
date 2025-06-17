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

import STM32F7X6

class PixelBuffer {
  let buffer: UnsafeMutableBufferPointer<SPINeoPixelGRB64Pixel>

  init(count: Int) {
    self.buffer = .allocate(capacity: count)
    self.buffer.initialize(repeating: .reset)
  }

  deinit {
    self.buffer.deallocate()
  }
}

struct SPINeoPixel {
  var dma: DMA1
  var spi: SPI2
  var pixels: PixelBuffer
  var base: UInt8 = 0

  init(
    dma: DMA1,
    spi: SPI2,
    pixelCount: Int
  ) {
    precondition(MemoryLayout<SPINeoPixelGRB64Pixel>.size == 24)
    precondition(MemoryLayout<SPINeoPixelGRB64Pixel>.stride == 24)
    self.dma = dma
    self.spi = spi
    self.pixels = PixelBuffer(count: pixelCount)
  }
}

extension SPINeoPixel {
  @inline(never)
  mutating func clear() {
    let rgb = RGB8Pixel(red: 0, green: 0, blue: 0)
    let pixel = SPINeoPixelGRB64Pixel(rgb)
    for index in self.pixels.buffer.indices {
      self.pixels.buffer[index] = pixel
    }
  }

  @inline(never)
  mutating func rainbow() {
    var hsv = HSV8Pixel(hue: self.base, saturation: 255, value: 255)
    for index in self.pixels.buffer.indices {
      hsv.hue &+= 1
      let rgb = RGB8Pixel(hsv)
      self.pixels.buffer[index] = SPINeoPixelGRB64Pixel(rgb.gammaCorrected)
    }
    self.base &+= 1
  }

  @inline(never)
  mutating func draw() {
    // swift-format-ignore: NeverForceUnwrap
    let memory = UInt32(UInt(bitPattern: self.pixels.buffer.baseAddress!))
    let peripheral = UInt32(spi.dr.unsafeAddress)
    let count = UInt32(
      self.pixels.buffer.count * MemoryLayout<SPINeoPixelGRB64Pixel>.size)

    let index = 4
    self.dma.st[index].cr.modify { rw in
      rw.raw.chsel = 0  // Set the DMA channel to 0 (spi tx).
      rw.raw.mburst = 0b00  // Set memory to single transaction mode.
      rw.pburst = .Single  // Set peripheral to single transaction mode.
      // ct
      rw.dbm = .Disabled  // Disable double buffer mode.
      rw.pl = .VeryHigh  // Set the stream priority to very high.
      // pincos
      rw.raw.msize = 0b00  // Set memory data width to 8 bit.
      rw.psize = .Bits8  // Set peripheral data width to 8 bit.
      rw.raw.minc = 1  // Set memory to incremented mode.
      rw.pinc = .Fixed  // Set peripheral to fixed (no-increment) mode.
      rw.circ = .Disabled  // Disable circular mode.
      rw.dir = .MemoryToPeripheral  // Set transfer direction.
      rw.pfctrl = .DMA  // Set the DMA as the flow controller.
      rw.tcie = .Enabled  // Enable transfer complete interrupt.
      rw.htie = .Enabled  // Enable half transfer interrupt.
      rw.teie = .Enabled  // Enable transfer error interrupt.
      rw.dmeie = .Enabled  // Enable direct mode error interrupt.
    }

    // Set the total number of data items to the buffer size.
    self.dma.st[index].ndtr.modify { $0.raw.ndt = UInt32(count) }

    // Set the destination peripheral port address to the spi data port.
    self.dma.st[index].par.modify { $0.raw.pa = peripheral }

    // Set the source memory address to the buffer's base.
    self.dma.st[index].m0ar.modify { $0.raw.m0a = memory }

    // Clear the second memory address as double buffering mode is disabled.
    self.dma.st[index].m1ar.modify { $0.raw.m1a = 0 }

    self.dma.st[index].fcr.modify { _, w in
      w.feie = .Enabled  // Enable FIFO error interrupt.
      w.dmdis = .Disabled  // Enable direct mode (double negative).
      w.fth = .Quarter  // Reset FIFO threshold (no effect in direct mode).
    }

    self.dma.hifcr.modify { _, w in
      w.raw.ctcif4 = 1  // Clear transfer complete interrupt flag.
      w.raw.chtif4 = 1  // Clear half transfer interrupt flag.
      w.raw.cteif4 = 1  // Clear transfer error interrupt flag.
      w.raw.cdmeif4 = 1  // Clear direct mode error interrupt flag.
      w.raw.cfeif4 = 1  // Clear FIFO error interrupt flag.
    }

    self.spi.cr1.modify { rw in
      rw.bidimode = .Unidirectional  // Set full duplex.
      rw.bidioe = .OutputDisabled
      rw.crcen = .Disabled  // Disable hardware crc.
      rw.crcnext = .TxBuffer
      rw.crcl = .EightBit
      rw.rxonly = .FullDuplex  // Set full duplex.
      // FIXME: understand this Disable software slave management and select.
      rw.ssm = .Enabled
      rw.ssi = .SlaveNotSelected
      rw.lsbfirst = .MSBFirst  // Set data MSB first.
      // spe
      rw.br = .Div2  // Set Baud Rate as Fpclk/2.
      rw.mstr = .Master  // Set Master mode.
      rw.cpol = .IdleLow  // Set active high logic.
      // FIXME: understand this Set trailing edge logic.
      rw.cpha = .SecondEdge
    }

    // Write to SPI_CR2 register:
    // a) Configure the DS[3:0] bits to select the data length for the transfer.
    // b) Configure SSOE (Notes: 1 & 2 & 3).
    // c) Set the FRF bit if the TI protocol is required (keep NSSP bit cleared
    // in TI mode).
    // d) Set the NSSP bit if the NSS pulse mode between two data units is
    // required (keep CHPA and TI bits cleared in NSSP mode).
    // e) Configure the FRXTH bit. The RXFIFO threshold must be aligned to the
    // read access size for the SPIx_DR register.
    // f) Initialize LDMA_TX and LDMA_RX bits if DMA is used in packed mode.

    self.spi.cr2.modify { rw in
      rw.rxdmaen = .Disabled  // Disable rx dma.
      rw.txdmaen = .Enabled  // Enable tx dma.
      // FIXME: understand this Disable slave select.
      // rw.ssoe = 0
      // FIXME: understand this Disable NSS pulse management.
      // rw.nssp = 0
      rw.frf = .Motorola  // Reset frame format (i2s).
      rw.errie = .NotMasked  // Enable error interrupt.
      rw.rxneie = .NotMasked  // Enable rx not buffer empty interrupt.
      rw.txeie = .NotMasked  // Enable tx buffer empty interrupt.
      rw.ds = .EightBit  // Set Data size to 8 bit.
      rw.frxth = .Quarter  // Set RXNE if FIFO <8 bits.
      rw.ldma_rx = .Even  // Reset dma reception length.
      rw.ldma_tx = .Even  // Reset dma transmission length.
    }

    // Activate the stream.
    self.dma.st[index].cr.modify { $0.en = .Enabled }

    // Activate the SPI peripheral
    self.spi.cr1.modify { $0.spe = .Enabled }

    func wait() -> Bool {
      while true {
        let hisr = self.dma.hisr.read().raw
        if hisr.tcif4 == 1 { return true }
        if hisr.teif4 == 1 { return false }
        if hisr.dmeif4 == 1 { return false }
        if hisr.feif4 == 1 { return false }
      }
    }

    _ = wait()

    // Wait until no more data to transmit.
    while self.spi.sr.read().raw.ftlvl != 0b00 {}
    // Wait until the last data frame is processed.
    while self.spi.sr.read().raw.bsy != 0 {}
    // Disable the SPI peripheral.
    self.spi.cr1.modify { $0.spe = .Disabled }
    // Don't wait until the read data is received since the NeoPixel is not
    // a real SPI device. This will lead to overrun errors but they can be
    // safely ignored.
    // while self.spi.sr.read().raw.frlvl != 0b00 { }

    // Disable any existing DMA transfer on stream 0.
    self.dma.st[index].cr.modify { $0.en = .Disabled }
    // Wait for the DMA stream to actually shutdown.
    while self.dma.st[index].cr.read().en != .Disabled {}
  }
}
