# Zephyr RTOS SDK

Integrating Swift with Zephyr RTOS for embedded systems development

[Zephyr](https://www.zephyrproject.org/) is an open-source RTOS for embedded systems that is sponsored by the Linux Foundation. Since it depends on CMake primarily for its build system, it can easily be integrated to be used with Embedded Swift.

The following document outlines how to setup a Swift to Zephyr project for an emulated ARM Cortex M0, explaining a few key concepts along the way. For a complete working example on real hardware, however, refer to the [nrfx-blink-sdk](https://github.com/swiftlang/swift-embedded-examples/tree/main/nrfx-blink-sdk) project that is compatible with nRF or other boards.

> Note: Embedded Swift is experimental. Public releases of Swift do not support Embedded Swift, yet. See <doc:InstallEmbeddedSwift> for details.

## Target Architecture Compatibility

Zephyr [supports quite a few target architectures](https://docs.zephyrproject.org/latest/introduction/index.html), but not all are supported by Embedded Swift. Please refer to the following table for an overview of Zephyr-supported architectures that are supported by Swift, along with the correct target triple to use:

| Architecture | Details             | Swift Triple            |
|--------------|---------------------|-------------------------|
| ARMv6-M      | Cortex M0, M0+, M1  | armv6m-none-none-eabi   |
| ARMv7-M      | Cortex M3           | armv7-none-none-eabi    |
| ARMv7-EM     | Cortex M4/M4F, M7   | armv7em-none-none-eabi  |
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

After setting the target triple, some additional additional Swift compiler flags need to be defined.

```cmake
# Set global Swift compiler flags
add_compile_options(
    # Enable Embedded Swift
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-enable-experimental-feature Embedded>"

    # Enable function sections to enable dead code stripping on elf
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xfrontend -function-sections>"

    # Use software floating point operations matching GCC
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -mfloat-abi=soft>"

    # Use compacted C enums matching GCC
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -fshort-enums>"

    # Disable PIC
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -fno-pic>"

    # Disable PIE
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -fno-pie>"

    # Add Libc include paths
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -I -Xcc ${ZEPHYR_SDK_INSTALL_DIR}/arm-zephyr-eabi/picolibc/include>"
)
```

- NOTE: The `-mfloat-abi=soft` flag may need to change to `-mfloat-abi=hard` for ARM CPUs that support hard-float, such as the Cortex-M4F and Cortex-M7. This and the `-fshort-enums` flags are not required for non-ARM architectures such as Intel and RISC-V.

There are quite a few other Zephyr flags that can also be imported (optional) in order to get Zephyr include paths and flags such `-mcpu`, `mthumb`, `-mabi`, and so on:

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

- It is recommended to set the `revision` to a tagged version of Zephyr instead of always getting the main revision, which could have changing APIs.
- Also, please note that depending on what architecture you are targeting, you may need to add more/different targets to the `name-allowlist`, which is useful to get needed dependencies when compiling a project from a CI. See the [Zephyr workflow from swift-embedded-examples](https://github.com/swiftlang/swift-embedded-examples/blob/main/.github/workflows/build-zephyr.yml) for an example of setting up a CI for Zephyr.

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

## Customizing the Linker

The default linker configuration for building a Zephyr project from CMake works well for simple projects, but it can be customized as needed. The following sections show off some useful ways to customize linking Zephyr projects for Swift.

### Stripping Out Unused Sections

When compiling Swift to Zephyr projects, you may see some warnings about orphaned sections from the linker, like `.swift_modhash`:

```console
~/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.2.0/../../../../arm-zephyr-eabi/bin/ld.bfd: warning: orphan section `.swift_modhash' from `app/libapp.a(Main.swift.obj)' being placed in section `.swift_modhash'
[135/135] Linking C executable zephyr/zephyr.elf
~/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.2.0/../../../../arm-zephyr-eabi/bin/ld.bfd: warning: orphan section `.swift_modhash' from `app/libapp.a(Main.swift.obj)' being placed in section `.swift_modhash
```

These types of warnings can be suppressed by passing a custom linker script to Zephyr that discards the sections, especially if they are not needed. For example, a script called `sections.ld` can be created at the root of the project with the following contents:

```ld
/DISCARD/ : { *(.swift_modhash*) }
/DISCARD/ : { *(.ARM.attributes*) *(.ARM.exidx) }
```

Then, in `CMakeLists.txt`, add the following line:

```cmake
# Remove unused sections
zephyr_linker_sources(SECTIONS "sections.ld")
```

This can also help to reduce the size of the output elf/binary since unused sections are stripped out. Be careful what sections you strip out, however, as some sections may be required.

### Linking Swift Libraries

This example adds the `swiftUnicodeDataTables` library from Swift to be linked into the Zephyr project. This is useful for linking unicode symbols when using strings. See <doc:Strings> for more information on this.

In order to add additional linker params, the CMake `target_link_libraries` invocation can be used against `zephyr_pre0` and `zephyr_final`, like this:

```cmake
# The code is using a String as a Dictionary key and thus require linking with libswiftUnicodeDataTables.a
# We compute the path where this file reside, taking into accout how the toolchain is referenced (Swiftly or TOOLCHAINS env variable). 
find_program(SWIFTLY "swiftly")
IF(SWIFTLY)
  execute_process(COMMAND swiftly use --print-location OUTPUT_VARIABLE toolchain_path)
  cmake_path(SET additional_lib_path NORMALIZE "${toolchain_path}/usr/lib/swift/embedded/${CMAKE_Swift_COMPILER_TARGET}")
ELSE()
  get_filename_component(compiler_bin_dir ${CMAKE_Swift_COMPILER} DIRECTORY)
  cmake_path(SET additional_lib_path NORMALIZE "${compiler_bin_dir}/../lib/swift/embedded/${CMAKE_Swift_COMPILER_TARGET}")
ENDIF()

target_link_directories(zephyr_pre0 PRIVATE "${additional_lib_path}")
target_link_libraries(zephyr_pre0
    -Wl,--whole-archive
    swiftUnicodeDataTables
    -Wl,--no-whole-archive
    )

target_link_directories(zephyr_final PRIVATE "${additional_lib_path}")
target_link_libraries(zephyr_final
    -Wl,--whole-archive
    swiftUnicodeDataTables
    -Wl,--no-whole-archive
    )
```

Extra code is required to find the right paths where the `swiftUnicodeDataTables.a` file is located, depending on how Swift is installed.

When this is built, depending on the target architecture, warnings may then be printed about 32-bit enums, like this:

```console
~/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.2.0/../../../../arm-zephyr-eabi/bin/ld.bfd: warning: ~/.local/share/swiftly/toolchains/6.1.0/usr/lib/swift/embedded/armv6m-none-none-eabi/libswiftUnicodeDataTables.a(UnicodeWord.cpp.o) uses 32-bit enums yet the output is to use variable-size enums; use of enum values across objects may fail
```

To suppress these, simply add `-Wl,--no-enum-size-warning` to the `target_link_libraries` invocations.
