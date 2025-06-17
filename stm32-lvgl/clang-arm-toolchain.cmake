set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING TRUE)

# Specify the compilers
set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/bin/clang")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/bin/clang++")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH}/bin/clang")

# Target flags
set(CMAKE_C_FLAGS "-target arm-none-eabi -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -std=c++11 -fno-exceptions -fno-rtti")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

# Search paths for libraries
set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_PATH}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
