# Language subset

Details of the Embedded Swift language subset compared to full Swift

Embedded Swift is a subset of the Swift language, and some features are not available in Embedded Swift. This is necessary in order to achieve small binaries with effective dead-code elimination and minimized system dependencies.

That said, *the vast majority* of the Swift language works exactly the same in Embedded Swift. This includes generics, protocols, enums with associated values, tuples, optionals, classes (instances are allocated on the heap and refcounted just like in regular Swift), inheritance, runtime polymorphism, arrays (heap-allocated copy-on-write just like in regular Swift) and much more.

Note that there are no behavior changes in Embedded Swift compared to full Swift, and Embedded Swift is strictly a *subset* and not a *dialect*. Any code compatible with Embedded Swift will also compile and have the same semantics in full Swift.

## Code-level features that are not available

- **Not available**: Runtime reflection (`Mirror` APIs).
- **Not available**: Values of protocol types ("existentials"), unless the protocol is restricted to be class-bound (derived from AnyObject). E.g. `let a: Hashable = ...` is not allowed. `Any` is also not allowed. See <doc:Existentials> for details and alternatives of existentials.
- **Not available**: Throwing errors or `any Error` type (in contrast with "typed throws", which *is* supported in Embedded Swift).
- **Not available**: Metatypes, e.g. `let t = SomeClass.Type` or `type(of: value)` are not allowed.
- **Not available**: Standard library types that rely on the above, for example `Codable` and `KeyPath`, are not allowed.
- **Not available**: Printing and stringification of arbitrary types (which is achieved via reflection in desktop Swift).
- **Not available**: Using non-final generic class methods. See <doc:NonFinalGenericMethods> for details on this.
- **Not available**: Weak and unowned references are not allowed (unsafe unowned references *are* available).

## Compilation facilities that are not available

- **Not available**: Library Evolution (stable ABI), and facilities that requires Library Evolution (e.g. internal module imports)
- **Not available**: Objective-C interoperability
- **Not available**: Builds without WMO (whole module optimization)

## Further resources

The above lists are describing features that are removed from Embedded Swift *by design*. Since Embedded Swift is currently an experimental preview, there might also be  features that are not yet implemented. See the in-development status at <doc:Status>.
