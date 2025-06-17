cmake_minimum_required(VERSION 3.14...3.30)

project(blink
    VERSION 1.0
    DESCRIPTION "Blink on NuttX"
    LANGUAGES Swift
)

if("${CMAKE_Swift_COMPILER_VERSION}" VERSION_LESS 6.1)
    message(FATAL_ERROR "Swift 6.1 or later is required")
endif()

if(POLICY CMP0169)
    # allow to call FetchContent_Populate directly
    cmake_policy(SET CMP0169 OLD)
endif()

option(LIST_ALL_BOARDS "List all available boards" OFF)
option(ENABLE_NUTTX_TRACE "Enable NuttX trace" OFF)

if(ENABLE_NUTTX_TRACE)
    set(TRACEFLAG "--trace")
else()
    set(TRACEFLAG "")
endif()

set(FETCHCONTENT_QUIET FALSE)
include(FetchContent)
FetchContent_Declare(
    apps
    GIT_REPOSITORY https://github.com/apache/nuttx-apps.git
    GIT_TAG nuttx-12.7.0
    SOURCE_DIR ${CMAKE_BINARY_DIR}/apps
    FIND_PACKAGE_ARGS
)
FetchContent_GetProperties(apps)
if(NOT apps_POPULATED)
    FetchContent_Populate(apps)
endif()

FetchContent_Declare(
    nuttx
    GIT_REPOSITORY https://github.com/apache/nuttx.git
    GIT_TAG nuttx-12.7.0
    SOURCE_DIR ${CMAKE_BINARY_DIR}/nuttx
    FIND_PACKAGE_ARGS
)
FetchContent_GetProperties(nuttx)
if(NOT nuttx_POPULATED)
    FetchContent_Populate(nuttx)
endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    set(SCRIPT_SUFFIX .bat)
else()
    set(SCRIPT_SUFFIX .sh)
endif()

if(LIST_ALL_BOARDS)
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E chdir ${nuttx_SOURCE_DIR}
        ${CMAKE_COMMAND} -E env PATH=${nuttx_SOURCE_DIR}/tools:$ENV{PATH}
        ${nuttx_SOURCE_DIR}/tools/configure${SCRIPT_SUFFIX} -L
        RESULT_VARIABLE result
    )
    if(result)
        message(FATAL_ERROR "Failed to run tools/configure")
    endif()
else()
    if(NOT DEFINED BOARD_CONFIG)
        message(FATAL_ERROR "Please define configuration with BOARD_CONFIG")
    else()
        message(STATUS "BOARD_CONFIG: ${BOARD_CONFIG}")
    endif()

    # Send swift-blinky example to nuttx-apps path
    file(COPY ${CMAKE_SOURCE_DIR}/leds_swift DESTINATION ${apps_SOURCE_DIR}/examples)
    file(COPY ${CMAKE_SOURCE_DIR}/defconfig DESTINATION ${nuttx_SOURCE_DIR}/boards/risc-v/qemu-rv/rv-virt/configs/leds_swift)

    add_custom_target(distclean
        COMMAND ${CMAKE_COMMAND} -E chdir ${nuttx_SOURCE_DIR}
        ${CMAKE_COMMAND} -E env PATH=${nuttx_SOURCE_DIR}/tools:$ENV{PATH}
        make distclean
        COMMENT "Clean NuttX"
    )

    execute_process(
        COMMAND ${CMAKE_COMMAND} -E chdir ${nuttx_SOURCE_DIR}
        ${CMAKE_COMMAND} -E env PATH=${nuttx_SOURCE_DIR}/tools:$ENV{PATH}
        ${nuttx_SOURCE_DIR}/tools/configure${SCRIPT_SUFFIX} -l ${BOARD_CONFIG}
        RESULT_VARIABLE result
    )
    if(result)
        message(FATAL_ERROR "Failed to run tools/configure")
    endif()

    add_custom_target(copy_swift_example
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/leds_swift ${apps_SOURCE_DIR}/examples/leds_swift
        COMMENT "Copying leds_swift example to nuttx-apps"
    )

    add_custom_target(build_nuttx ALL
        COMMAND ${CMAKE_COMMAND} -E chdir ${nuttx_SOURCE_DIR}
        ${CMAKE_COMMAND} -E env PATH=${nuttx_SOURCE_DIR}/tools:$ENV{PATH}
        make ${TRACEFLAG} -j ${JOB_POOLS}
        DEPENDS copy_swift_example
        COMMENT "Building NuttX"
    )

    add_custom_command(
        TARGET build_nuttx
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy ${nuttx_SOURCE_DIR}/nuttx ${CMAKE_BINARY_DIR}/nuttx.elf
    )

    add_custom_target(export_nuttx
        COMMAND ${CMAKE_COMMAND} -E chdir ${nuttx_SOURCE_DIR}
        ${CMAKE_COMMAND} -E env PATH=${nuttx_SOURCE_DIR}/tools:$ENV{PATH}
        make export
        COMMENT "Exporting NuttX"
    )

    add_custom_target(extract_nuttx_export
        COMMAND ${CMAKE_COMMAND} -E tar xzf ${nuttx_SOURCE_DIR}/nuttx-export-12.7.0.tar.gz
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMAND ${CMAKE_COMMAND} -E remove ${nuttx_SOURCE_DIR}/nuttx-export-12.7.0.tar.gz
        DEPENDS export_nuttx
        COMMENT "Extracting NuttX export"
    )

    add_custom_target(nuttx-libs
        DEPENDS build_nuttx export_nuttx extract_nuttx_export
    )
endif()
