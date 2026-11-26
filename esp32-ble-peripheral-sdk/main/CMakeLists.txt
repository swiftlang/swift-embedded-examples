# Register the app as an IDF component
idf_component_register(
    SRCS /dev/null # We don't have any C++ sources
    PRIV_INCLUDE_DIRS "."
    LDFRAGMENTS "linker.lf"
    REQUIRES bt driver
)

idf_build_get_property(target IDF_TARGET)
idf_build_get_property(arch IDF_TARGET_ARCH)

if("${arch}" STREQUAL "xtensa")
    message(FATAL_ERROR "Not supported target: ${target}")
endif()

if(${target} STREQUAL "esp32c2" OR ${target} STREQUAL "esp32c3")
    set(march_flag "rv32imc_zicsr_zifencei")
    set(mabi_flag "ilp32")
elseif(${target} STREQUAL "esp32p4")
    set(march_flag "rv32imafc_zicsr_zifencei")
    set(mabi_flag "ilp32f")
else()
    set(march_flag "rv32imac_zicsr_zifencei")
    set(mabi_flag "ilp32")
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
    -Xcc -march=${march_flag} -Xcc -mabi=${mabi_flag}
    
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
    Led.swift
    LedStrip.swift
    Error.swift
    NimBLE.swift
    BluetoothAddress.swift
    BluetoothUUID.swift
    ByteValue.swift
    ByteSwap.swift
    CompanyIdentifier.swift
    LowEnergyAddressType.swift
    LowEnergyAdvertisingData.swift
    Data.swift
    String.swift
    System.swift
    Hexadecimal.swift
    Encoder.swift
    GAPData.swift
    GAPDataType.swift
    GAPFlags.swift
    GAPShortLocalName.swift
    GAPManufacturerSpecificData.swift
    UInt128.swift
    UUID.swift
    iBeacon.swift
    Integer.swift
    ATTError.swift
    ATTAttributePermissions.swift
    GATTAttributes.swift
    GATTCharacteristicProperties.swift
    Peer.swift
    PeripheralProtocol.swift
)
