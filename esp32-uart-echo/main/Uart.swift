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

/// A Swift wrapper around ESP-IDF UART driver APIs.
struct Uart {
  let portNum: uart_port_t
  let bufferSize: Int

  /// Initialize a UART port with the specified configuration.
  /// - Parameters:
  ///   - portNum: UART port number (default: 1)
  ///   - txPin: GPIO pin for TX
  ///   - rxPin: GPIO pin for RX
  ///   - baudRate: Baud rate (default: 115200)
  ///   - bufferSize: RX buffer size in bytes (default: 1024)
  init(
    portNum: Int = 1,
    txPin: Int,
    rxPin: Int,
    baudRate: Int = 115200,
    bufferSize: Int = 1024
  ) {

    self.portNum = uart_port_t(UInt32(portNum))
    self.bufferSize = bufferSize

    // Configure UART parameters
    var uartConfig = uart_config_t()
    uartConfig.baud_rate = Int32(baudRate)
    uartConfig.data_bits = UART_DATA_8_BITS
    uartConfig.parity = UART_PARITY_DISABLE
    uartConfig.stop_bits = UART_STOP_BITS_1
    uartConfig.flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    uartConfig.source_clk = UART_SCLK_DEFAULT

    // Install UART driver with RX buffer (TX buffer = 0 for blocking writes)
    guard
      uart_driver_install(self.portNum, Int32(bufferSize * 2), 0, 0, nil, 0)
        == ESP_OK
    else {
      fatalError("Failed to install UART driver")
    }

    // Configure UART parameters
    guard uart_param_config(self.portNum, &uartConfig) == ESP_OK else {
      fatalError("Failed to configure UART parameters")
    }

    // Set UART pins (RTS and CTS are not used)
    // Note: Using swift_uart_set_pin wrapper for ESP-IDF version compatibility
    guard
      set_uart_pin(
        self.portNum,
        Int32(txPin),
        Int32(rxPin),
        UART_PIN_NO_CHANGE,
        UART_PIN_NO_CHANGE) == ESP_OK
    else {
      fatalError("Failed to set UART pins")
    }
  }

  /// Redirect stdin, stdout, and stderr to this UART port.
  /// This allows Swift's print() and readLine() to work through this UART
  func redirectStdio() {
    // Route stdin/stdout/stderr through UART driver
    uart_vfs_dev_use_driver(Int32(portNum.rawValue))

    // Build the device path: "/dev/uart/N"
    var path: [CChar] = Array("/dev/uart/0".utf8CString)
    path[path.count - 2] = CChar(UInt8(ascii: "0") + UInt8(portNum.rawValue))

    // Open the UART device file for reading (stdin)
    let fIn = fopen(path, "r")
    if fIn != nil {
      set_stdin(fIn)
    }

    // Open the UART device file for writing (stdout/stderr)
    let fOut = fopen(path, "w")
    if fOut != nil {
      set_stdout(fOut)
      set_stderr(fOut)
      setvbuf(get_stdout(), nil, _IONBF, 0)
    }
  }

  /// Write raw bytes to UART.
  /// - Parameters:
  ///   - data: Pointer to the data buffer
  ///   - length: Number of bytes to write
  /// - Returns: Number of bytes written, or -1 on error
  func write(_ data: UnsafePointer<UInt8>, length: Int) -> Int {
    Int(uart_write_bytes(portNum, data, length))
  }

  /// Write a string to UART.
  /// - Parameter string: The string to write
  /// - Returns: Number of bytes written, or -1 on error
  func write(_ string: String) -> Int {
    string.withCString { cString in
      let length = strlen(cString)
      return Int(uart_write_bytes(portNum, cString, length))
    }
  }

  /// Read bytes from UART with timeout.
  /// - Parameters:
  ///   - buffer: Buffer to store received data
  ///   - maxLength: Maximum number of bytes to read
  ///   - timeoutMs: Timeout in milliseconds
  /// - Returns: Number of bytes read, or -1 on error
  func read(
    into buffer: UnsafeMutablePointer<UInt8>, maxLength: Int, timeoutMs: UInt32
  ) -> Int {
    let ticks = timeoutMs / (1000 / UInt32(configTICK_RATE_HZ))
    return Int(uart_read_bytes(portNum, buffer, UInt32(maxLength), ticks))
  }
}
