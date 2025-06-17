# Integrating with Zephyr

Integrating Swift with Zephyr RTOS for embedded systems development

The following document outlines how to setup a Swift to Zephyr project for an emulated ARM Cortex M0, explaining a few key concepts along the way. For a complete working example on real hardware, however, refer to the [nrfx-blink-sdk](https://github.com/swiftlang/swift-embedded-examples/tree/main/nrfx-blink-sdk) project that is compatible with nRF or other boards.

> Note: Embedded Swift is experimental. Public releases of Swift do not support Embedded Swift, yet. See <doc:InstallEmbeddedSwift> for details.

## Zephyr Target Architecture Compatibility

Zephyr [supports quite a few target architectures](https://docs.zephyrproject.org/latest/introduction/index.html), but not all are supported by Embedded Swift. Please refer to the following table for an overview of Zephyr-supported architectures that are supported by Swift, along with the correct target triple to use:

| Architecture | Details             | Swift Triple            |
|--------------|---------------------|-------------------------|
| ARMv6-M      | Cortex M0, M1, M3   | armv6m-none-none-eabi   |
| ARMv7-M      | Cortex M4, M7       | armv7em-none-none-eabi  |
| ARMv8-M      | Cortex M23-85       | aarch64-none-none-elf   |
| Intel        | 32-bit (i686)       | i686-unknown-none-elf   |
| Intel        | 64-bit (x86_64)     | x86_64-unknown-none-elf |
| RISC-V       | 32-bit              | riscv32-none-none-eabi  |
| RISC-V       | 64-bit              | riscv64-none-none-eabi  |

## Zephyr Setup

Before setting up a Swift project that works with Zephyr, you need to setup dependencies and a Zephyr workspace as per the [Getting Started Guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html). Regardless of your platform (macOS or Linux), ensure that you can build the blinky example without errors before starting with Swift integration:

```bash
cd ~/zephyrproject/zephyr
west build -p always -b reel_board samples/basic/blinky
```

By default, the `main` revision of the Zephyr sources are checked out when calling `west init`, which contains pre-release and development changes that may cause instability and changing APIs that are not desirable. To checkout a specific release version of Zephyr, use the following commands:

```bash
cd ~/zephyrproject/zephyr
git checkout v4.1.0
west update
west packages pip --install

# For older versions of Zephyr (pre 4.1.0), use:
pip install -r ~/zephyrproject/zephyr/scripts/requirements.txt
```

Refer to the [Zephyr Releases](https://docs.zephyrproject.org/latest/releases/index.html) page for more information on current and LTS releases.

## Project Setup

Once Zephyr is setup, the next step is to setup a project with the following files included:

```plain
SwiftZephyrProject/src/BridgingHeader.h
SwiftZephyrProject/src/Main.swift
SwiftZephyrProject/src/Stubs.c
SwiftZephyrProject/CMakeLists.txt
SwiftZephyrProject/prj.conf
```

These are the minimum required files in order to build a Zephyr project. By convention, source files should be placed in the src/ subdirectory, but this is not a hard requirement. Also, `prj.conf` is required even if it is empty, or the project will not build.

Inside of `src/BridgingHeader.h`, add the following content:

```c
#pragma once

#include <autoconf.h>
#include <zephyr/kernel.h>
```

The `src/Main.swift` file must contain a `static func main()` as follows:

```swift
@main
struct Main {
  static func main() {
    print("Hello Zephyr from Swift!")

    while true {
      k_msleep(1000)
      print("Loop")
    }
  }
}
```

Since Embedded Swift requires `posix_memalign` to be defined, add the following to `src/Stubs.c` to define it:

```c
#include <stdlib.h>
#include <errno.h>

void *aligned_alloc(size_t alignment, size_t size);

// Embedded Swift currently requires posix_memalign, but the C libraries in the
// Zephyr SDK do not provide it. Let's implement it and forward the calls to
// aligned_alloc(3).
int
posix_memalign(void **memptr, size_t alignment, size_t size)
{
  void *p = aligned_alloc(alignment, size);
  if (p) {
    *memptr = p;
    return 0;
  }

  return errno;
}
```

Finally, add the following line to `prj.conf` so that the output of `print()` statements is sent to stdout:

```conf
CONFIG_STDOUT_CONSOLE=y
```

### CMakeLists.txt Setup

The `CMakeLists.txt` setup is more involved and complex since target, compilation flags, and library linking must be specified for Swift. First, some initial setup and flags:

```cmake
cmake_minimum_required(VERSION 3.29)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

# Enable "wmo" as needed by Embedded Swift
set(CMAKE_Swift_COMPILATION_MODE wholemodule)

# Create a new project called "SwiftZephyrProject" and enable "Swift" as a supported language
project(SwiftZephyrProject Swift)
```

Next, set the compiler target to the arch you are building for. For this example we use `armv6m-none-none-eabi` which is compatible with the [Cortex-M0](https://docs.zephyrproject.org/latest/boards/qemu/cortex_m0/doc/index.html) which we will compile for in a later step. If you are targeting a different architecture, see the [Zephyr Target Architecture Compatibility](#zephyr-target-architecture-compatibility) to see which target triple to use.

```cmake
# Use the armv6m-none-none-eabi target triple for Swift
set(CMAKE_Swift_COMPILER_TARGET armv6m-none-none-eabi)
```

After setting the target triple, some additional additional Swift compiler flags need to be defined:

```cmake
# Set global Swift compiler flags
add_compile_options(
    # Enable Embedded Swift
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-enable-experimental-feature Embedded>"

    # Enable function sections to enable dead code stripping on elf
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xfrontend -function-sections>"

    # Disable PIC
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -fno-pic>"

    # Disable PIE
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -fno-pie>"
)
```

There are quite a few other Zephyr flags that must also be imported in order to get Zephyr include paths and flags such `-mcpu`, `-mfloat-abi`, and so on:

```cmake
# Import TOOLCHAIN_C_FLAGS from Zephyr as -Xcc flags
foreach(flag ${TOOLCHAIN_C_FLAGS})
    # Skip flags that are not known to swiftc
    string(FIND "${flag}" "-imacro" is_imacro)
    string(FIND "${flag}" "-mfp16-format" is_mfp16)
    if(NOT is_imacro EQUAL -1 OR NOT is_mfp16 EQUAL -1)
        continue()
    endif()

    add_compile_options("$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc ${flag}>")
endforeach()
```

Next, add the following block to automatically grab Zephyr compilation flags (such as `-D__ZEPHYR__=1` and `-DKERNEL`) and set them as Swift compiler definitions. This is required to successfully build Swift code that works with Zephyr:

```cmake
# Add definitions from Zephyr to -Xcc flags
get_target_property(ZEPHYR_DEFINES zephyr_interface INTERFACE_COMPILE_DEFINITIONS)
if(ZEPHYR_DEFINES)
    foreach(flag ${ZEPHYR_DEFINES})
        # Ignore expressions like "$<SOMETHING>"
        string(FIND "${flag}" "$<" start_of_expression)
        if(NOT start_of_expression EQUAL -1)
            continue()
        endif()

        add_compile_options("$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -D${flag}>")
    endforeach()
endif()
```

Finally, setup targets, libraries, and additional compile options:

```cmake
target_sources(app PRIVATE src/Stubs.c)

# The Swift code providing "main" needs to be in an OBJECT library (instead of STATIC library) to make sure it actually gets linker.
# A STATIC library would get dropped from linking because Zephyr provides a default weak empty main definition.
add_library(app_swift OBJECT src/Main.swift)

add_dependencies(app_swift syscall_list_h_target)
target_compile_options(app_swift PRIVATE
    -parse-as-library

    -Osize

    -Xfrontend -disable-stack-protector

    # FIXME: add dependency on BridgingHeader.h
    -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/src/BridgingHeader.h
)

# Copy include paths from C target to Swift target
target_include_directories(app_swift PRIVATE
    "$<TARGET_PROPERTY:app,INCLUDE_DIRECTORIES>"
)

# Link the Swift target into the primary target
target_link_libraries(app PRIVATE app_swift)
```

### Building and Running

To build the project, ensure that the Zephyr workspace is sourced first:

```bash
source ~/zephyrproject/.venv/bin/activate
```

Run the following command to configure the project with CMake:

```console
(.venv)> cmake -B build -G Ninja -DBOARD=qemu_cortex_m0 -DUSE_CCACHE=0 .
Loading Zephyr default modules (Zephyr base (cached)).
...
-- Configuring done (7.6s)
-- Generating done (0.2s)
-- Build files have been written to: ~/SwiftZephyrProject/build
```

Then, the project can be built using `cmake --build`:

```console
(.venv)> cmake --build build
[1/135] Preparing syscall dependency handling

[2/135] Generating include/generated/zephyr/version.h
-- Zephyr version: 4.1.0 (~/zephyrproject/zephyr), build: v4.1.0
[130/135] Linking C executable zephyr/zephyr_pre0.elf
~/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.2.0/../../../../arm-zephyr-eabi/bin/ld.bfd: warning: orphan section `.swift_modhash' from `app/libapp.a(Main.swift.obj)' being placed in section `.swift_modhash'
[135/135] Linking C executable zephyr/zephyr.elf
~/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.2.0/../../../../arm-zephyr-eabi/bin/ld.bfd: warning: orphan section `.swift_modhash' from `app/libapp.a(Main.swift.obj)' being placed in section `.swift_modhash'
Memory region         Used Size  Region Size  %age Used
           FLASH:       14674 B       256 KB      5.60%
             RAM:        4032 B        16 KB     24.61%
        IDT_LIST:          0 GB        32 KB      0.00%
Generating files from ~/SwiftZephyrProject/build/zephyr/zephyr.elf for board: qemu_cortex_m0
```

Finally, to run the example in the qemu emulator, use `ninja run`:

```console
(.venv)> ninja -C build run
ninja: Entering directory `build'
[0/1] To exit from QEMU enter: 'CTRL+a, x'[QEMU] CPU: cortex-m0
*** Booting Zephyr OS build v4.1.0 ***
Hello Zephyr from Swift!
Loop
Loop
Loop
```

Congrats, you now have a Swift project running using Zephyr!

## West Integration

Up to now we have setup a project that works perfectly fine when used with just CMake and Ninja. However, projects can also be integrated with West, which is the official CLI tool used for Zephyr projects. To use `west`, start by adding a `west.yml` file to the root of the project:

```yml
manifest:
  remotes:
    - name: zephyrproject-rtos
      url-base: https://github.com/zephyrproject-rtos

  projects:
    - name: zephyr
      remote: zephyrproject-rtos
      revision: v4.1.0
      import:
        name-allowlist:
          - cmsis  # required by the ARM port
```

It is recommended to set the `revision` to a tagged version of Zephyr instead of always getting the main revision, which could have changing APIs.

Next, set the `ZEPHYR_BASE` environment variable to tell `west` where the Zephyr workspace is located:

```bash
(.venv)> export ZEPHYR_BASE=~/zephyrproject/zephyr
```

This could even be set as a global env variable for the user in `~/.bashrc` or `~/.zshrc` if desired.

With this, `west` commands now can be run instead of having to use `cmake` and `ninja` to build and run:

```bash
(.venv)> west build -b qemu_cortex_m0 . -p always
...
(.venv)> west build -t run
-- west build: running target run
[0/1] To exit from QEMU enter: 'CTRL+a, x'[QEMU] CPU: cortex-m0
*** Booting Zephyr OS build v4.1.0 ***
Hello Zephyr from Swift!
Loop
Loop
Loop
Loop
```

This setup may also be desirable since `west flash` is also available and can be used instead of invoking the flashing tools manually.

If compiling a firmware for a real/physical board such as the `nrf52840dk/nrf52840`, `west flash` will work if the SEGGER J-Link host tools are installed. As an example, with the [nrfx-blink-sdk](../../../../nrfx-blink-sdk/) project:

```console
> cd nrfx-blink-sdk
> source ~/zephyrproject/.venv/bin/activate
(.venv)> export ZEPHYR_BASE=~/zephyrproject/zephyr
(.venv)> west build -b nrf52840dk/nrf52840 . -p always
...
(.venv)> west flash -r jlink
-- west flash: rebuilding
ninja: no work to do.
-- west flash: using runner jlink
-- runners.jlink: reset after flashing requested
-- runners.jlink: JLink version: 8.26
-- runners.jlink: Flashing file: ~/swift-embedded-examples/nrfx-blink-sdk/build/zephyr/zephyr.hex
```

The `-r jlink` param is needed for this example to use the J-Link tools instead of using `nrfjprog`, which is the default for this board and also [deprecated](https://www.nordicsemi.com/Products/Development-tools/nRF-Command-Line-Tools).
