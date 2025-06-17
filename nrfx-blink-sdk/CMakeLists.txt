cmake_minimum_required(VERSION 3.29)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

# Use the armv7em-none-none-eabi target triple for Swift
set(CMAKE_Swift_COMPILER_TARGET armv7em-none-none-eabi)
# Enable "wmo" as needed by Embedded Swift
set(CMAKE_Swift_COMPILATION_MODE wholemodule)
# FIXME: Skip checking if the compiler works
set(CMAKE_Swift_COMPILER_WORKS true)

# Create a new project called "blinky" and enable "Swift" as a supported language
project(blinky Swift)

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

    # Add Libc include paths
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-Xcc -I -Xcc ${ZEPHYR_SDK_INSTALL_DIR}/arm-zephyr-eabi/picolibc/include>"
)

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

target_sources(app PRIVATE Stubs.c)

# The Swift code providing "main" needs to be in an OBJECT library (instead of STATIC library) to make sure it actually gets linker.
# A STATIC library would get dropped from linking because Zephyr provides a default weak empty main definition.
add_library(app_swift OBJECT Main.swift)

add_dependencies(app_swift syscall_list_h_target)
target_compile_options(app_swift PRIVATE
    -parse-as-library

    -Osize

    -Xfrontend -disable-stack-protector

    # FIXME: add dependency on BridgingHeader.h
    -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
)

# Copy include paths from C target to Swift target
target_include_directories(app_swift PRIVATE
    "$<TARGET_PROPERTY:app,INCLUDE_DIRECTORIES>"
)

# Link the Swift target into the primary target
target_link_libraries(app PRIVATE app_swift)
