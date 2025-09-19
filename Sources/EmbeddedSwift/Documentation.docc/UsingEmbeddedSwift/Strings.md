# Strings

How to enable full Unicode-compliant string support in Embedded Swift

Both StaticString and String types are available in Embedded Swift. As is the case in desktop Swift, certain operations on strings require Unicode data tables for strict Unicode compliance. In Embedded Swift these data tables are provided as a separate static library (libswiftUnicodeDataTables.a) that users need to link in manually – if they need to use these string operations. If the library is required, linking will fail due to missing on one or more of the following symbols:

```
_swift_stdlib_getAge
_swift_stdlib_getBinaryProperties
_swift_stdlib_getCaseMapping
_swift_stdlib_getComposition
_swift_stdlib_getDecompositionEntry
_swift_stdlib_getGeneralCategory
_swift_stdlib_getGraphemeBreakProperty
_swift_stdlib_getMapping
_swift_stdlib_getMphIdx
_swift_stdlib_getNameAlias
_swift_stdlib_getNormData
_swift_stdlib_getNumericType
_swift_stdlib_getNumericValue
_swift_stdlib_getScalarBitArrayIdx
_swift_stdlib_getScalarName
_swift_stdlib_getScript
_swift_stdlib_getScriptExtensions
_swift_stdlib_getSpecialMapping
_swift_stdlib_getWordBreakProperty
_swift_stdlib_isLinkingConsonant
_swift_stdlib_nfd_decompositions
```

To resolve this, link in the `libswiftUnicodeDataTables.a` that's in Swift toolchain's resource directory (`lib/swift/`) under the target triple that you're using:

```bash
$ swiftc <inputs> -target armv6m-none-none-eabi -enable-experimental-feature Embedded -wmo -c -o output.o
$ ld ... -o binary output.o $(dirname `which swiftc`)/../lib/swift/embedded/armv6m-none-none-eabi/libswiftUnicodeDataTables.a
```

Alternatively in a CMake build try something like the below which will check a Swiftly based install.

Update the `COMPILER_TARGET` variable to the architecture desired.

```

set(COMPILER_TARGET "riscv32-none-none-eabi")

find_program(SWIFTLY "swiftly")
IF(SWIFTLY)
  execute_process(COMMAND swiftly use --print-location OUTPUT_VARIABLE toolchain_path OUTPUT_STRIP_TRAILING_WHITESPACE)
  cmake_path(SET additional_lib_path NORMALIZE "${toolchain_path}/usr/lib/swift/embedded/${COMPILER_TARGET}")
ELSE()
  get_filename_component(compiler_bin_dir ${CMAKE_Swift_COMPILER} DIRECTORY)
  cmake_path(SET additional_lib_path NORMALIZE "${compiler_bin_dir}/../lib/swift/embedded/${COMPILER_TARGET}")
ENDIF()

target_link_directories(${COMPONENT_LIB} PUBLIC "${additional_lib_path}")
target_link_libraries(${COMPONENT_LIB}
    -Wl,--whole-archive
    swiftUnicodeDataTables
    -Wl,--no-whole-archive
    )

# message(" ----------::: ${additional_lib_path} :::---------- ")
```

**Unicode data tables are required for (list not exhaustive):**

- Comparing String objects for equality
- Sorting Strings
- Using String's hash values, and in particular using String as dictionary keys
- Using String's `.count` property
- Using Unicode-aware string processing APIs (`.split()`, iterating characters, indexing)
- Using Unicode-aware conversion String APIs (`.uppercased()`, `.lowercased()`, etc.)

**For contrast, unicode data tables are *not required for* (list not exhaustive):**

- Using StaticString
- Creating, concatenating, string interpolating, and printing String objects
- Using `.utf8`, `.utf16`, and `.unicodeScalars` views of strings, including their .count property, using them as dictionary keys

Manually linking `libswiftUnicodeDataTables.a` is required for several reasons, including acknowledging that the data tables are desirable: Since they have a non-negligible size, it's useful to be aware that you are using them.
