# Implementation Status

Implementation status of compiler and language features in Embedded Swift, comparison to standard Swift

## Embedded Swift Language Features

| **Language Feature**                                  | **Currently Supported In Embedded Swift**                                          |
|-------------------------------------------------------|------------------------------------------------------------------------------------|
| *Anything not listed below*                           | Yes                                                                                |
| Library Evolution (resilience)                        | No, intentionally unsupported long-term                                            |
| Objective-C interoperability                          | No, intentionally unsupported long-term                                            |
| Non-WMO builds                                        | No, intentionally unsupported long-term (WMO should be used)                       |
| Existentials (values of protocol types)               | Only class-bound existentials (for protocols derived from AnyObject) are supported |
| Any                                                   | No, currently disallowed                                                           |
| AnyObject                                             | Yes                                                                                |
| Metatypes                                             | No, currently only allowed as unused arguments (type hints)                        |
| Untyped throwing                                      | No, intentionally unsupported long-term (typed throwing should be used instead)    |
| Weak references, unowned references                   | No                                                                                 |
| Non-final generic class methods                       | No, intentionally unsupported long-term, see <doc:NonFinalGenericMethods>|
| Parameter packs (variadic generics)                   | No, not yet supported                                                              |

## Embedded Standard Library Breakdown

This status table describes which of the following standard library features can be used in Embedded Swift:

| **Swift Standard Library Feature**                         | **Currently Supported In Embedded Swift?**          |
|------------------------------------------------------------|-----------------------------------------------------|
| Array (dynamic heap-allocated container)                   | Yes    |                                      
| Array slices                                               | Yes    |                                      
| assert, precondition, fatalError                           | Partial, only StaticStrings can be used as a failure message |
| Bool, Integer types, Float types                           | Yes    |
| Codable, Encodable, Decodable                              | No     |
| Collection + related protocols                             | Yes    |
| Collection algorithms (sort, reverse)                      | Yes    |
| CustomStringConvertible, CustomDebugStringConvertible      | Yes, except those that require reflection (e.g. Array's .description)     |
| Dictionary (dynamic heap-allocated container)              | Yes    |
| Floating-point conversion to string                        | No     |
| Floating-point parsing                                     | No     |
| FixedWidthInteger + related protocols                      | Yes    |
| Hashable, Equatable, Comparable protocols                  | Yes    |
| InputStream, OutputStream                                  | No     |
| Integer conversion to string                               | Yes    |
| Integer parsing                                            | Yes    |
| KeyPaths                                                   | Partial (only compile-time constant key paths to stored properties supported, only usable in MemoryLayout and UnsafePointer APIs)     |
| Lazy collections                                           | Yes    |
| ManagedBuffer                                              | Yes    |
| Mirror (runtime reflection)                                | No, intentionally unsupported long-term |
| Objective-C bridging                                       | No, intentionally unsupported long-term |
| Optional                                                   | Yes    |
| print / debugPrint                                         | Partial (only String, string interpolation, StaticStrings, integers, pointers and booleans, and custom types that are CustomStringConvertible) |
| Range, ClosedRange, Stride                                 | Yes    |
| Result                                                     | Yes    |
| Set (dynamic heap-allocated container)                     | Yes    |                                      
| SIMD types                                                 | Yes    |
| StaticString                                               | Yes    |
| String (dynamic)                                           | Yes    |
| String interpolations                                      | Partial (only strings, integers, booleans, and custom types that are CustomStringConvertible can be interpolated)    |
| Unicode                                                    | Yes    |
| Unsafe\[Mutable\]\[Raw\]\[Buffer\]Pointer                  | Yes    |
| VarArgs                                                    | No     |

## Non-stdlib Features

This status table describes which of the following Swift features can be used in Embedded Swift:

| **Swift Feature**                                          | **Currently Supported In Embedded Swift?**          |
|------------------------------------------------------------|-----------------------------------------------------|
| Synchronization module                                     | Partial (only Atomic types, no Mutex)    |
| Swift Concurrency                                          | Partial, experimental (basics of actors and tasks work in single-threaded concurrency mode) |
| C interop                                                  | Yes    | 
| C++ interop                                                | Yes    |
| ObjC interop                                               | No, intentionally unsupported long-term |
| Library Evolution                                          | No, intentionally unsupported long-term |
