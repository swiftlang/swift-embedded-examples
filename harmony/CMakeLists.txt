cmake_minimum_required(VERSION 3.29)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
include($ENV{PICO_EXTRAS_PATH}/external/pico_extras_import.cmake)

project(app)
pico_sdk_init()

set(CMSISCORE "$ENV{PICO_SDK_PATH}/src/rp2_common/cmsis/stub/CMSIS/Core")
set(DISABLEFLOAT16 ON)
include(FetchContent)
FetchContent_Declare(cmsisdsp
   GIT_REPOSITORY https://github.com/ARM-software/CMSIS-DSP.git
   GIT_TAG "v1.16.2"
)
FetchContent_MakeAvailable(cmsisdsp)



add_executable(app)

pico_generate_pio_header(app ${CMAKE_CURRENT_LIST_DIR}/Sources/PIOPrograms/I2S.pio)
pico_generate_pio_header(app ${CMAKE_CURRENT_LIST_DIR}/Sources/PIOPrograms/QuadratureEncoder.pio)
pico_generate_pio_header(app ${CMAKE_CURRENT_LIST_DIR}/Sources/PIOPrograms/WS2812.pio)

# Which Pico SDK libraries are we using. This also automatically sets up header
# search paths (via target_include_directories / INTERFACE_INCLUDE_DIRECTORIES).
target_link_libraries(app
    pico_cyw43_arch_lwip_threadsafe_background
    pico_multicore
    pico_stdlib

    pico_btstack_ble
    pico_btstack_classic
    pico_btstack_sbc_common
    pico_btstack_sbc_decoder
    pico_btstack_sbc_encoder
    pico_btstack_cyw43
    
    # FIXME: remove
    pico_audio
    hardware_adc
    hardware_dma
    hardware_i2c
    hardware_pio
    hardware_irq
)

# Make our "config headers" (e.g. lwipopts.h) discoverable by libraries themselves.
target_include_directories(app PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/include"
    "${CMAKE_CURRENT_LIST_DIR}/dsp"
    "${CMAKE_CURRENT_LIST_DIR}/platform"
    "${cmsisdsp_SOURCE_DIR}/Include"
)

# Uncomment to debug lwIP.
# target_compile_definitions(app PRIVATE PICO_DEBUG_MALLOC=1)
# target_compile_definitions(pico_standard_link INTERFACE "LWIP_DEBUG=1")
# target_compile_definitions(pico_standard_link INTERFACE "WANT_HCI_DUMP=1")
target_compile_definitions(app PRIVATE "PICO_AUDIO_I2S_DATA_PIN=26")
target_compile_definitions(app PRIVATE "PICO_AUDIO_I2S_CLOCK_PIN_BASE=27")

# Gather compile definitions from all dependencies
set_property(GLOBAL PROPERTY visited_targets "")
set_property(GLOBAL PROPERTY compilerdefs_list "")

function(gather_compile_definitions_recursive target)
    # Get the current value of visited_targets
    get_property(visited_targets GLOBAL PROPERTY visited_targets)
    
    # make sure we don't visit the same target twice
    # and that we don't visit the special generator expressions
    if (${target} MATCHES "\\\$<" OR ${target} MATCHES "::@" OR ${target} IN_LIST visited_targets)
        return()
    endif()

    # Append the target to visited_targets
    list(APPEND visited_targets ${target})
    set_property(GLOBAL PROPERTY visited_targets "${visited_targets}")

    # Get the current value of compilerdefs_list
    get_property(compilerdefs_list GLOBAL PROPERTY compilerdefs_list)

    get_target_property(target_definitions ${target} INTERFACE_COMPILE_DEFINITIONS)
    if (target_definitions)
        # Append the target definitions to compilerdefs_list
        list(APPEND compilerdefs_list ${target_definitions})
        set_property(GLOBAL PROPERTY compilerdefs_list "${compilerdefs_list}")
    endif()

    get_target_property(target_linked_libs ${target} INTERFACE_LINK_LIBRARIES)
    if (target_linked_libs)
        foreach(linked_target ${target_linked_libs})
            # Recursively gather compile definitions from dependencies
            gather_compile_definitions_recursive(${linked_target})
        endforeach()
    endif()
endfunction()

gather_compile_definitions_recursive(app)

add_dependencies(app CMSISDSP)
target_link_libraries(app
    ${cmsisdsp_BINARY_DIR}/Source/libCMSISDSP.a
)

target_include_directories(app PRIVATE
#   ${CMAKE_CURRENT_LIST_DIR}/dsp
#   ${CMAKE_CURRENT_LIST_DIR}/platform
  ${cmsisdsp_SOURCE_DIR}/Include
  ${PICO_SDK_PATH}/src/rp2_common/cmsis/stub/CMSIS/Core/Include
)


get_property(COMPILE_DEFINITIONS GLOBAL PROPERTY compilerdefs_list)

# Parse compiler definitions into a format that swiftc can understand
list(REMOVE_DUPLICATES COMPILE_DEFINITIONS)
list(PREPEND COMPILE_DEFINITIONS "") # adds a semicolon at the beginning
string(REPLACE "$<TARGET_PROPERTY:PICO_TARGET_BINARY_TYPE>" "$<TARGET_PROPERTY:app,PICO_TARGET_BINARY_TYPE>" COMPILE_DEFINITIONS "${COMPILE_DEFINITIONS}")
string(REPLACE ";" " -Xcc -D" COMPILE_DEFINITIONS "${COMPILE_DEFINITIONS} ")
message("COMPILE_DEFINITIONS: ${COMPILE_DEFINITIONS}")

get_target_property(var pico_standard_link INTERFACE_COMPILE_OPTIONS)
set_target_properties(pico_standard_link PROPERTIES INTERFACE_COMPILE_OPTIONS "")

# Compute -Xcc flags to set up the C and C++ header search paths for Swift (for
# the bridging header).
set(SWIFT_INCLUDES)
foreach(dir ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-Xcc ")
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-I${dir} ")
endforeach()
foreach(dir ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-Xcc ")
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-I${dir} ")
endforeach()

# Swift compiler flags to build in Embedded Swift mode, optimize for size,
# choose the right ISA, ABI, etc.
target_compile_options(app PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:SHELL:
        -target armv6m-none-none-eabi
        -Xfrontend -function-sections -wmo -parse-as-library -Osize
        -enable-experimental-feature Embedded
        -enable-experimental-feature Extern
        -enable-experimental-feature Span
        -enable-experimental-feature SymbolLinkageMarkers

        -assert-config Debug

        -Xcc -mfloat-abi=soft -Xcc -fshort-enums
        -Xcc -D__APPLE_CC__

        -Xcc -I${CMAKE_CURRENT_LIST_DIR}/include

        -pch-output-dir /tmp
        -Xfrontend -enable-single-module-llvm-emission
        
        ${SWIFT_INCLUDES}
        ${COMPILE_DEFINITIONS}

        -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/Sources/Application/BridgingHeader.h
    >")

# Enable Swift support in CMake, force Whole Module builds (required by Embedded
# Swift), and use "CMAKE_Swift_COMPILER_WORKS" to skip the trial compilations
# which don't (yet) correctly work when cross-compiling.
set(CMAKE_Swift_COMPILER_WORKS YES)
set(CMAKE_Swift_COMPILATION_MODE_DEFAULT wholemodule)
set(CMAKE_Swift_COMPILATION_MODE wholemodule)
enable_language(Swift)

# Don't link via the Swift driver, it doesn't understand some GNU linker
# arguments, and it's not necessary for Embedded Swift.
set_property(TARGET app PROPERTY LINKER_LANGUAGE C)

# List of Swift and C source files to build.
target_sources(app
    PRIVATE
    Sources/Application/Button.swift
    Sources/Application/ButtonTimes.swift
    Sources/Application/LEDStrip.swift
    Sources/Application/Logging.swift
    Sources/Application/Main.swift
    Sources/Application/QuadratureEncoder.swift
    Sources/Application/Stubs.swift
    
    Sources/Audio/AudioAnalyzer.swift
    Sources/Audio/AudioBuffer.swift
    Sources/Audio/AudioBufferTransport.swift
    Sources/Audio/AudioEngine.swift
    Sources/Audio/AudioI2S.swift
    Sources/Audio/AudioPico.swift
    Sources/Audio/MAX9744.swift
    Sources/Audio/Resampler.swift
    Sources/Audio/Ring.swift
    Sources/Audio/RingBuffer.swift
    Sources/Audio/SpinLock.swift
    Sources/Audio/TPA2016D2.swift

    Sources/Bluetooth/A2DP.swift
    Sources/Bluetooth/AVRCP.swift
    Sources/Bluetooth/HCI.swift
    Sources/Bluetooth/SBC.swift
    Sources/Bluetooth/SDP.swift

    Sources/PIOPrograms/I2S.pio
    Sources/PIOPrograms/QuadratureEncoder.pio
    Sources/PIOPrograms/WS2812.pio
)

pico_add_extra_outputs(app)
