# Existentials

Restrictions on existentials ("any" types) that apply in Embedded Swift

## Background

Existentials (also known as "any" types) in Swift are a way to express a type-erased value, where the actual type is not known statically, and at runtime it can be any type that conforms to the specified protocol. Because the possible types can vary in size, the representation of such a value is an "existential container" and the actual represented value is stored either inline (when it fits) or indirectly as a pointer to a heap allocation. There are also multiple concrete representations of the existential container that are optimized for different constraints. For example, with class-bound existentials, the value does not make sense to ever store inline, so the size of the container is matched to hold exactly one pointer).

Existentials are somewhat restricted in Embedded Swift due to the requirement that all generics be fully specialized. Concretely, the following operations that are allowed in non-embedded Swift are prohibited in Embedded Swift:

* A value cannot be dynamically cast to an existential type.
* Generic operations cannot be called on an existential value.
* Existential values cannot be "opened" into a generic value.

The restrictions are described in more detail below. Additionally, all compiler diagnostics related to Embedded Swift restrictions are documented as part of the [`EmbeddedRestrictions`](https://docs.swift.org/compiler/documentation/diagnostics/embedded-restrictions/) diagnostic group, which can also be enabled in non-embedded Swift code to help ensure that the code will continue to work with Embedded Swift.

## Forming existentials

Embedded Swift allows and supports forming existentials of any kind:

```swift
protocol P { // ✅
    func genericFoo<T>(_ value: T) { }
}

extension Int: P { ... }
class Base: P { ... }
class Derived: Base { ... } // also conforms to P

let existential: any P = ... // ✅, can be initialized with an Int, Base, Derived, etc.
existential.foo() // ✅
```

Existentials in Embedded Swift allow the "is" and "as!" / "as?" operators to check whether an existential holds a specific concrete type (or subclass thereof):

```swift
let existential: any P = ...
if existential is Base { ... } // ✅
guard let concrete = existential as? Derived else { ... } // ✅
let concrete = existential as! Derived // ✅, and will trap at runtime if a different type is inside the existential
```

## Restrictions on casting to existential types

Existentials can be formed only from a concrete type. It is not possible to form an existential by casting to it from another type. For example:

```swift
let existential: Any = ...

if let p = existential as? any P { ... } // ❌, cannot cast to existential type "any P"
let p = existential as! any P { ... } // ❌, cannot cast to existential type "any P"
```

The same restriction applies to casting to an existential metatype, e.g.,

```swift
let anyType: Any.Type
if let metaP = anyType as? (any Error).Type { ... } // ❌, cannot cast to existential metatype
let metaP = anyType as! (any Error).Type // ❌, cannot cast to existential metatype
```

## Restrictions on use of generics on existentials

You cannot use an existential to call a unbounded generic method from a protocol or an extension of a protocol. This is described in depth in <doc:NonFinalGenericMethods>. For example:
```swift
protocol Q {
  func genericFoo<T>(t: T)
}

extension Q {
  func genericBar<T>(t: T) { }
}

let ex: any Q = ... // ✅
ex.genericFoo(t: 42) // ❌, genericFoo is an unbounded generic
ex.genericBar(t: 42) // ❌, genericBar is an unbounded generic
```

## Alternatives to existentials

When existentials are not possible, or not desirable (e.g. because the indirection on an existential causes an observation performance or code-size degradation), consider one of the following alternatives (which all have different tradeoffs and code structure implications):

**(1) Avoid using an existential, use generics instead**

```swift
protocol MyProtocol {
    func write<T>(t: T)
}

func usingProtocolAsGeneric(p: some MyProtocol) {
    p.write(t: 42) // ✅
}
```

**(2) If you only need a different type based on compile-time configuration (e.g. mocking for unit testing), use #if and typealiases:**
```swift
#if UNIT_TESTING
typealias HWAccess = MMIOBasedHWAccess
#else
typealias HWAccess = MockHWAccess
#endif

let v = HWAccess()
```

**(3) If you only have a handful of tightly-coupled types that need to participate in an existential, use an enum instead:**
```swift
enum E {
    case type1(Type1)
    case type2(Type2)
    case type3(Type3)
}
```
