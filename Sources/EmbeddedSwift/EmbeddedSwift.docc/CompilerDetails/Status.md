# Tracking implementation status

Compare compiler and language feature support in Embedded Swift to standard Swift.

## Embedded Swift Language Features

| **Language Feature**                    | **Currently Supported In Embedded Swift**                    |
| --------------------------------------- | ------------------------------------------------------------ |
| *Anything not listed below*             | Yes                                                          |
| Library Evolution (resilience)          | No, intentionally unsupported long-term                      |
| Objective-C interoperability            | No, intentionally unsupported long-term                      |
| Non-WMO builds                          | No, intentionally unsupported long-term (WMO should be used) |
| Existentials (values of protocol types) | Yes, with some restrictions. See <doc:Existentials>          |
| Any                                     | Yes                                                          |
| AnyObject                               | Yes                                                          |
| Metatypes                               | Yes                                                          |
| Untyped throwing                        | Yes                                                          |
| Weak references, unowned references     | No                                                           |
| Non-final generic class methods         | No, intentionally unsupported long-term, see <doc:NonFinalGenericMethods> |
| Parameter packs (variadic generics)     | No, not yet supported                                        |

## Embedded Standard Library Breakdown

This status table describes which of the following standard library features can be used in Embedded Swift:

| **Swift Standard Library Feature**                    | **Currently Supported In Embedded Swift?**                   |
| ----------------------------------------------------- | ------------------------------------------------------------ |
| Array (dynamic heap-allocated container)              | Yes                                                          |
| Array slices                                          | Yes                                                          |
| assert, precondition, fatalError                      | Partial, only StaticStrings can be used as a failure message |
| Bool, Integer types, Float types                      | Yes                                                          |
| Codable, Encodable, Decodable                         | No                                                           |
| Collection + related protocols                        | Yes                                                          |
| Collection algorithms (sort, reverse)                 | Yes                                                          |
| CustomStringConvertible, CustomDebugStringConvertible | Yes, except those that require reflection (for example, Array's .description) |
| Dictionary (dynamic heap-allocated container)         | Yes                                                          |
| Floating-point conversion to string                   | Yes                                                          |
| Floating-point parsing                                | Yes                                                          |
| FixedWidthInteger + related protocols                 | Yes                                                          |
| Hashable, Equatable, Comparable protocols             | Yes                                                          |
| InputStream, OutputStream                             | No                                                           |
| Integer conversion to string                          | Yes                                                          |
| Integer parsing                                       | Yes                                                          |
| KeyPaths                                              | Partial (only compile-time constant key paths to stored properties supported, only usable in MemoryLayout and UnsafePointer APIs) |
| Lazy collections                                      | Yes                                                          |
| ManagedBuffer                                         | Yes                                                          |
| Mirror (runtime reflection)                           | No, intentionally unsupported long-term                      |
| Objective-C bridging                                  | No, intentionally unsupported long-term                      |
| Optional                                              | Yes                                                          |
| print / debugPrint                                    | Partial (only String, string interpolation, StaticStrings, integers, pointers and booleans, and custom types that are CustomStringConvertible) |
| Range, ClosedRange, Stride                            | Yes                                                          |
| Result                                                | Yes                                                          |
| Set (dynamic heap-allocated container)                | Yes                                                          |
| SIMD types                                            | Yes                                                          |
| StaticString                                          | Yes                                                          |
| String (dynamic)                                      | Yes                                                          |
| String interpolations                                 | Partial (only strings, integers, booleans, and custom types that are CustomStringConvertible can be interpolated) |
| Unicode                                               | Yes                                                          |
| Unsafe\[Mutable\]\[Raw\]\[Buffer\]Pointer             | Yes                                                          |
| VarArgs                                               | No                                                           |

## Non-stdlib Features

This status table describes which of the following Swift features can be used in Embedded Swift:

| **Swift Feature**      | **Currently Supported In Embedded Swift?**                   |
| ---------------------- | ------------------------------------------------------------ |
| Synchronization module | Partial (only Atomic types, no Mutex)                        |
| Swift Concurrency      | Partial, experimental (basics of actors and tasks work in single-threaded concurrency mode) |
| C interop              | Yes                                                          |
| C++ interop            | Partial, interoperability libraries are not built yet        |
| ObjC interop           | No, intentionally unsupported long-term                      |
| Library Evolution      | No, intentionally unsupported long-term                      |
