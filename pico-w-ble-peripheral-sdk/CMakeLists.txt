cmake_minimum_required(VERSION 3.13)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(swift-peripheral)
pico_sdk_init()

if(APPLE)
execute_process(COMMAND xcrun -f swiftc OUTPUT_VARIABLE SWIFTC OUTPUT_STRIP_TRAILING_WHITESPACE)
else()
execute_process(COMMAND which swiftc OUTPUT_VARIABLE SWIFTC OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

add_executable(swift-peripheral)
target_link_libraries(swift-peripheral
    pico_stdlib hardware_uart hardware_gpio pico_lwip_arch pico_cyw43_arch_none pico_btstack_ble pico_btstack_cyw43
)

target_include_directories(swift-peripheral PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include # For btstack config
)

# Gather compile definitions from all dependencies
set_property(GLOBAL PROPERTY visited_targets "")
set_property(GLOBAL PROPERTY compilerdefs_list "")

function(gather_compile_definitions_recursive target)
    # Get the current value of visited_targets
    get_property(visited_targets GLOBAL PROPERTY visited_targets)
    
    # make sure we don't visit the same target twice
    # and that we don't visit the special generator expressions
    if (${target} MATCHES "\\$<" OR ${target} MATCHES "::@" OR ${target} IN_LIST visited_targets)
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

gather_compile_definitions_recursive(swift-peripheral)
get_property(COMPILE_DEFINITIONS GLOBAL PROPERTY compilerdefs_list)

# Parse compiler definitions into a format that swiftc can understand
list(REMOVE_DUPLICATES COMPILE_DEFINITIONS)
list(PREPEND COMPILE_DEFINITIONS "") # adds a semicolon at the beginning
string(REPLACE "$<TARGET_PROPERTY:PICO_TARGET_BINARY_TYPE>" "$<TARGET_PROPERTY:swift-peripheral,PICO_TARGET_BINARY_TYPE>" COMPILE_DEFINITIONS "${COMPILE_DEFINITIONS}")
string(REPLACE ";" ";-Xcc;-D" COMPILE_DEFINITIONS "${COMPILE_DEFINITIONS}")

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/_swiftcode.o
    COMMAND
        ${SWIFTC}
        -target armv6m-none-none-eabi -Xcc -mfloat-abi=soft -Xcc -fshort-enums
        ${COMPILE_DEFINITIONS}
        -Xcc -DCYW43_LWIP
        -Xcc -DPICO_CYW43_ARCH_THREADSAFE_BACKGROUND
        -Xcc -I$ENV{PICO_SDK_PATH}/lib/lwip/src/include
        -Xcc -I${CMAKE_CURRENT_LIST_DIR}/include
        -Xfrontend -function-sections -enable-experimental-feature Embedded -wmo -parse-as-library
        $$\( echo '$<TARGET_PROPERTY:swift-peripheral,INCLUDE_DIRECTORIES>' | tr '\;' '\\n' | sed -e 's/\\\(.*\\\)/-Xcc -I\\1/g' \)
        $$\( echo '${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES}'             | tr ' '  '\\n' | sed -e 's/\\\(.*\\\)/-Xcc -I\\1/g' \)
        -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
        ${CMAKE_CURRENT_LIST_DIR}/Main.swift
        ${CMAKE_CURRENT_LIST_DIR}/PicoError.swift
        ${CMAKE_CURRENT_LIST_DIR}/CYW43.swift
        ${CMAKE_CURRENT_LIST_DIR}/GPIO.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/Hexadecimal.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/Integer.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/String.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/System.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/UUID.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Generated/GeneratedCompanyIdentifiers.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Generated/GeneratedUnitIdentifiers.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Address.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/BluetoothUUID.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/ByteSwap.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/ByteValue.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/CompanyIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Data.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/DefinedUUIDExtension.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/iBeacon.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/L2CAPSocket.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/LowEnergyAdvertisingData.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/SecurityLevel.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt24.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt40.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt48.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt128.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt256.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt512.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Unit.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UnitIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/Decoder.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/Encoder.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPCompleteLocalName.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPDataType.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPFlags.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPManufacturerSpecificData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPShortLocalName.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/iBeaconManufacturerData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTAttributePermissions.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTConnection.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTError.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTErrorResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTExecuteWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTExecuteWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindByTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindByTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindInformationRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindInformationResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueConfirmation.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueIndication.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueNotification.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnit.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnitRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnitResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTOpcode.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTPrepareWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTPrepareWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTProtocolDataUnit.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadBlobRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadBlobResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByGroupTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByGroupTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadMultipleRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadMultipleResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTSignedWriteCommand.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteCommand.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTAttributes.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTCharacteristicProperties.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTClientCharacteristicConfiguration.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTDatabase.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTDescriptor.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTServer.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTUserDescription.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothHCI/HCIError.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothHCI/ChannelIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/Error.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GAP.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GATTPeripheral.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GATTServerConnection.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/HostController.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/L2CAPServer.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/Transport.swift
        ${CMAKE_CURRENT_LIST_DIR}/GATT/Peer.swift
        ${CMAKE_CURRENT_LIST_DIR}/GATT/PeripheralProtocol.swift
        -c -o ${CMAKE_CURRENT_BINARY_DIR}/_swiftcode.o
    DEPENDS
        ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
        ${CMAKE_CURRENT_LIST_DIR}/Main.swift
        ${CMAKE_CURRENT_LIST_DIR}/PicoError.swift
        ${CMAKE_CURRENT_LIST_DIR}/CYW43.swift
        ${CMAKE_CURRENT_LIST_DIR}/GPIO.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/Hexadecimal.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/Integer.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/String.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/System.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Extensions/UUID.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Generated/GeneratedCompanyIdentifiers.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Generated/GeneratedUnitIdentifiers.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Address.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/BluetoothUUID.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/ByteSwap.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/ByteValue.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/CompanyIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Data.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/DefinedUUIDExtension.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/iBeacon.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/L2CAPSocket.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/LowEnergyAdvertisingData.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/SecurityLevel.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt24.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt40.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt48.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt128.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt256.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UInt512.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/Unit.swift
        ${CMAKE_CURRENT_LIST_DIR}/Bluetooth/UnitIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/Decoder.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/Encoder.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPCompleteLocalName.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPDataType.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPFlags.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPManufacturerSpecificData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/GAPShortLocalName.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGAP/iBeaconManufacturerData.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTAttributePermissions.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTConnection.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTError.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTErrorResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTExecuteWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTExecuteWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindByTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindByTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindInformationRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTFindInformationResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueConfirmation.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueIndication.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTHandleValueNotification.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnit.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnitRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTMaximumTransmissionUnitResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTOpcode.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTPrepareWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTPrepareWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTProtocolDataUnit.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadBlobRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadBlobResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByGroupTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByGroupTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByTypeRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadByTypeResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadMultipleRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadMultipleResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTReadResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTSignedWriteCommand.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteCommand.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteRequest.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/ATTWriteResponse.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTAttributes.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTCharacteristicProperties.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTClientCharacteristicConfiguration.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTDatabase.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTDescriptor.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTServer.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothGATT/GATTUserDescription.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothHCI/HCIError.swift
        ${CMAKE_CURRENT_LIST_DIR}/BluetoothHCI/ChannelIdentifier.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/Error.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GAP.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GATTPeripheral.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/GATTServerConnection.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/HostController.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/L2CAPServer.swift
        ${CMAKE_CURRENT_LIST_DIR}/BTStack/Transport.swift
        ${CMAKE_CURRENT_LIST_DIR}/GATT/Peer.swift
        ${CMAKE_CURRENT_LIST_DIR}/GATT/PeripheralProtocol.swift
)
add_custom_target(swift-peripheral-swiftcode DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/_swiftcode.o)

target_link_libraries(swift-peripheral
    ${CMAKE_CURRENT_BINARY_DIR}/_swiftcode.o
)
add_dependencies(swift-peripheral swift-peripheral-swiftcode)
pico_add_extra_outputs(swift-peripheral)
