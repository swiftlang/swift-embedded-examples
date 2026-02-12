# ==============================================================================
# ESP-IDF Component Configuration for Swift-Based Applications
# ==============================================================================
# This CMakeLists.txt configures the "main" component of an ESP-IDF project
# that uses Embedded Swift instead of traditional C/C++.
# ==============================================================================
# ------------------------------------------------------------------------------
# Step 1: Register the component with ESP-IDF
# ------------------------------------------------------------------------------
# idf_component_register() tells the build system about this component's files
# and dependencies. Even though we're using Swift, we still need to register
# as an IDF component.
#
# Parameters:
#   SRCS: C/C++ source files to compile.
#   PRIV_INCLUDE_DIRS: Private header directories for this component only.
#                      Set to "." so the BridgingHeader.h can be found.
#   PRIV_REQUIRES: Components this component depends on (linked privately):
#     - swift: Provides Embedded Swift runtime and compilation support
#     - esp_driver_gpio: ESP-IDF GPIO driver for controlling hardware pins
#
# IMPORTANT: All dependencies must be explicitly listed.
idf_component_register(
    SRCS /dev/null
    PRIV_INCLUDE_DIRS "."
    PRIV_REQUIRES swift esp_driver_gpio
)

# ------------------------------------------------------------------------------
# Step 2: Configure Embedded Swift compilation
# ------------------------------------------------------------------------------
# idf_component_register_swift() is a custom function (provided by the 'swift'
# component) that configures the Swift compiler for embedded systems.
#
# Parameters:
#   ${COMPONENT_LIB}: The CMake library target created by idf_component_register()
#                     (automatically available after registration)
#   BRIDGING_HEADER: C header file that exposes C APIs to Swift code.
#                    This allows Swift to call ESP-IDF C functions.
#   SRCS: Swift source files to compile. List all .swift files in your project.
idf_component_register_swift(
    ${COMPONENT_LIB}
    BRIDGING_HEADER ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
    SRCS Main.swift Led.swift
)
