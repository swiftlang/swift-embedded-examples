# Register the app as an IDF component
idf_component_register(
    SRCS /dev/null # We don't have any C++ sources
    PRIV_INCLUDE_DIRS "."
    LDFRAGMENTS "linker.lf"
    PRIV_REQUIRES esp_driver_uart vfs
)

idf_build_get_property(target IDF_TARGET)
idf_build_get_property(arch IDF_TARGET_ARCH)

if("${arch}" STREQUAL "xtensa")
    message(FATAL_ERROR "Not supported target: ${target}")
endif()

# Extract -march and -mabi flags
set(march_flag "")
set(mabi_flag "")

# Method 1: Read from IDF's cflags response file (IDF 6.0+)
if(DEFINED IDF_TOOLCHAIN_BUILD_DIR AND EXISTS "${IDF_TOOLCHAIN_BUILD_DIR}/cflags")
    file(STRINGS "${IDF_TOOLCHAIN_BUILD_DIR}/cflags" cflags_lines)
    foreach(line IN LISTS cflags_lines)
        if(line MATCHES "^-march=")
            set(march_flag "${line}")
        elseif(line MATCHES "^-mabi=")
            set(mabi_flag "${line}")
        endif()
    endforeach()
endif()

# Method 2: Fallback to parsing CMAKE_C_FLAGS directly (older IDF versions)
if(NOT march_flag OR NOT mabi_flag)
    string(REGEX MATCH "-march=[^ ]+" march_flag_fallback "${CMAKE_C_FLAGS}")
    string(REGEX MATCH "-mabi=[^ ]+" mabi_flag_fallback "${CMAKE_C_FLAGS}")
    if(NOT march_flag AND march_flag_fallback)
        set(march_flag "${march_flag_fallback}")
    endif()
    if(NOT mabi_flag AND mabi_flag_fallback)
        set(mabi_flag "${mabi_flag_fallback}")
    endif()
endif()

# Default mabi if not found
if(NOT mabi_flag)
    set(mabi_flag "-mabi=ilp32")
endif()

# Strip Espressif custom extensions not supported by Swift
if(march_flag)
    string(REGEX REPLACE "_x[^ ]*" "" march_flag "${march_flag}")
endif()

# Clear the default COMPILE_OPTIONS which include a lot of C/C++ specific compiler flags that the Swift compiler will not accept
get_target_property(var ${COMPONENT_LIB} COMPILE_OPTIONS)
set_target_properties(${COMPONENT_LIB} PROPERTIES COMPILE_OPTIONS "")

# Compute -Xcc flags to set up the C and C++ header search paths for Swift (for bridging header).
set(SWIFT_INCLUDES)
foreach(dir ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-Xcc ")
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-I${dir} ")
endforeach()
foreach(dir ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-Xcc ")
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-I${dir} ")
endforeach()

# Swift compiler flags to build in Embedded Swift mode, optimize for size, choose the right ISA, ABI, etc.
target_compile_options(${COMPONENT_LIB} PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:SHELL:
        -target riscv32-none-none-eabi
        -Xfrontend -function-sections -enable-experimental-feature Embedded -wmo -parse-as-library -Osize
        -Xcc ${march_flag} -Xcc ${mabi_flag} -Xcc -fno-pic -Xcc -fno-pie
        
        -pch-output-dir /tmp
        -Xfrontend -enable-single-module-llvm-emission
        
        ${SWIFT_INCLUDES}

        -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
    >")



# Enable Swift support in CMake, force Whole Module builds (required by Embedded Swift), and use "CMAKE_Swift_COMPILER_WORKS" to
# skip the trial compilations which don't (yet) correctly work when cross-compiling.
set(CMAKE_Swift_COMPILER_WORKS YES)
set(CMAKE_Swift_COMPILATION_MODE_DEFAULT wholemodule)
set(CMAKE_Swift_COMPILATION_MODE wholemodule)
enable_language(Swift)

# List of Swift source files to build.
target_sources(${COMPONENT_LIB}
    PRIVATE
    Main.swift
    Uart.swift
    SwiftStubs.c
)
