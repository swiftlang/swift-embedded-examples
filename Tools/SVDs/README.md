# SVDs

`SVD` stands for System View Description and they are an `XML` schema created by ARM to represent the [CMSIS](https://www.arm.com/technologies/cmsis) information typically for Arm Cortex-M microcontrollers. They can be used for generating headers and providing information to debuggers among other tasks. `CMSIS` stands for _Common Microcontroller Software Interface Standard_ and was created as a hardware abstraction layer to be independent of what silicon vendor was implementing the ARM standard. 

More information:
- https://arm-software.github.io/CMSIS_6/latest/General/index.html
- https://open-cmsis-pack.github.io/svd-spec/latest/index.html
- https://www.arm.com/company/news/2012/02/arm-extends-cmsis-with-rtos-api-and-system-view-description

The SVDs used in this repo have been copied from the following sources.

| file                 | source                                                               |
|----------------------|----------------------------------------------------------------------|
| `rp2040.patched.svd` | https://github.com/rp-rs/rp2040-pac/blob/main/svd/rp2040.svd.patched |
| `rp2350.patched.svd` | https://github.com/rp-rs/rp235x-pac/blob/main/svd/RP2350.svd.patched |
