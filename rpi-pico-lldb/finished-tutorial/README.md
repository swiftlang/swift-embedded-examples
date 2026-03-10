# Finished tutorial
This is the bugs-fixed version sample code.

Bugs fixed:
- In `MemoryI2CDevice.init(I2C1_SCL: UInt32, I2C1_SDA: UInt32, address: UInt32, enableInternalPullUp: Bool)`,  `disableI2C()` must be called before calling `configBus()`.According to the RP2350/RP2040 datasheet, setting the `ic_con` and `ic_sar` registers requires the I2C interface to be disabled beforehand.
- In `Application.main()`, an incorrect address of the I2C peripheral was used (`controller.configBus(targetPeripheral: 0x43)`). It was changed to the correct address, `0x42`.
- The on-board LED's pin (`LED_PIN`) was incorrect (originally `100`). This was changed to the correct pin of the Pico's on-board LED (`25`).