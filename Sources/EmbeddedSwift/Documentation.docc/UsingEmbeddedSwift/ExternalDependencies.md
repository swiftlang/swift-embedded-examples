# External dependencies

What external system dependencies should you expect from Embedded Swift compilations

Embedded Swift minimizes external dependencies (i.e. functions that need to be available at link-time), but they still exist. There are generally two categories of dependencies: (1) functions that the Swift standard library or Embedded Swift runtime need to call, and (2) functions/symbols that are implicitly added by LLVM and the compiler pipeline.

For (1), external dependencies are only used based on actual usage of the program under compilation:

- instantiating a class, or using UnsafeMutablePointer.allocate()
  - dependency: `int posix_memalign(void **, size_t, size_t);`
  - dependency: `void free(void *);`
- using print()
  - dependency: `int putchar(int);`
- using Hashable, Set, Dictionary, or random-number generating APIs
  - dependency: `void arc4random_buf(void *, size_t);`

For (2), external dependencies are also triggered by specific code needing them, but they are somewhat lower-level patterns where it might not be obvious that such patterns should cause external dependencies:

- **basic memory copying and zeroing functions**
  - usage added for a variety of reasons (e.g. using structs on the stack)
  - dependency: `void *memset(void *, int, size_t);`
  - dependency: `void *memcpy(void *, const void *, size_t);`
- **stack protectors** (aka stack cookies or stack canaries)
  - dependency: `void *__stack_chk_guard;`
  - dependency: `void __stack_chk_fail(void);`
  - stack protectors can be disabled with `-disable-stack-protector` swiftc flag
- **atomics intrinsics**
  - on CPU architectures that don't have direct load-acquire/store-release support in the ISA, LLVM calls helper functions for atomic operations
  - needed by refcounting in the Embedded Swift runtime (so any class usage will trigger this dependency)
  - also needed when using atomics from the Synchronization module
- **multiplication/division/modulo intrinsics**
  - on CPU architectures that don't have direct support for the math operations in the ISA
  - dependency (on Mach-O): `__divti3`
  - dependency (on Mach-O): `__modti3`
  - dependency (with EABI): `__aeabi_ldivmod`
- **dynamic exclusivity checking** (enabled with `-enforce-exclusivity=checked`)
  - for single-threaded environments, link `swiftExclusivitySingleThreaded` library
  - for multi-threaded environments that support C++11 thread-local storage, link `swiftExclusivityC11ThreadLocal`
  - for environments where neither of the above will suffice
    - dependency: `void * _swift_getExclusivityTLS()`
    - dependency: void `_swift_setExclusivityTLS(void *newValue)`


The user and/or the platform (via basic libraries like libc or compiler builtins) is expected to provide these APIs.
