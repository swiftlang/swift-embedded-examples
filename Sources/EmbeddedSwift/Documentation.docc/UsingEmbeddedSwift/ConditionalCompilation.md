# Conditionalizing compilation for Embedded Swift

How to share code between Embedded Swift and full Swift using conditional compilation

It's often useful to have source code be compilable under both regular Swift and Embedded Swift. The following syntax is available for that (but note that as the rest of Embedded Swift, it's experimental, subject to change and not considered source stable):

```swift
func sayHello() {
  #if hasFeature(Embedded)
  print("I'm Embedded Swift")
  #else
  print("I'm regular Swift")
  #endif
}
```

Additionally, you can also use an attribute (also experimental, and not source stable) to make entire functions, types and other declarations unavailable in Embedded Swift. This can be particularly useful to explicitly mark your own code (and also entire types and conformances) that relies on features unavailable in Embedded Swift, e.g. the Any type or Codable -- it is explicitly allowed to use those in unavailable contexts:

```swift
@_unavailableInEmbedded
func useAny(_: Any) { ... }

@_unavailableInEmbedded
extension MyStruct: Codable {
  ...
}
```
