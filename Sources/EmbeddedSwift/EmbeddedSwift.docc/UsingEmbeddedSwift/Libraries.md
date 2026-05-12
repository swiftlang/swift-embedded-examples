# Libraries and modules in Embedded Swift

Understand the library setup and linkage model of Embedded Swift

Traditional library build and use model of Swift is that library code is compiled into a .swiftmodule, containing the interfaces, and a compiled library with binary code, either a .a static library or a .dylib/.so dynamic library. A client's build then uses the .swiftmodule at compile-time, and the static/dynamic library at link-time.

The library model in Embedded Swift works slightly differently: All Swift source code of a library is promoted into being inlinable and visible to client builds (this is necessary for generic code, and beneficial for optimizations for non-generic code), and ends up serialized into the .swiftmodule, the interface of the library. Therefore, the compiled code of a library is never needed, and doesn't even need to be produced. For example:

```bash
# Build the library, only as a .swiftmodule. Notice that we never build the .o or .a for the library.
$ swiftc -target <target> -enable-experimental-feature Embedded -wmo \
  a.swift b.swift -module-name MyLibrary -emit-module -emit-module-path ./MyLibrary.swiftmodule

# Build the client, "-I ." add the current directory to the module search path list
$ swiftc -target <target> -enable-experimental-feature Embedded -wmo \
  client.swift -I . -c -o client.o
```

The Embedded Swift standard library is distributed in the toolchain the same way: It's strictly a .swiftmodule without any compiled code present anywhere. All the compiling into machine code is performed as part of the client's build. This has the major benefit that the client's build can provide additional ABI and ISA defining flags, such as the above-mentioned `-mfloat-abi`, `-fshort-enums`, `-mcpu`, `-march` flags, and these flags in the client's build will apply to all the library code (including standard library code) as well.
