# Swift and NSCoding

This is a very small example playground on how to use `NSCoding` with a Swift object.

You can implement `NSCoding` protocol but your object must use the Objective-C runtime.
So you have two options:

1. Use the `@objc` annotation on the class
2. Extend the `NSObject` class

`NSCoding` is implemented by two methods:

- `init?(coder: NSCoder)` is the constructor to be able to unfroze a serialized object.
- `encodeWithCoder(aCoder: NSCoder)` will be used to serialize the object with the specified coding.


