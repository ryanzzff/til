# Implement Equatable protocol with Inheritance

To implement the equatable protocol is as simple as follow:

```swift
class SimpleClass: Equatable {
    var propA: String?
    var propB: Int?
    public static func == (lhs: SimpleClass, rhs: SimpleClass) -> Bool {
        return lhs.propA == rhs.propA
            && lhs.propB == rhs.propB
    }
}
```

But the problem is, if you have an subclass, it is not going to work.

```swift
class SimpleSubClass: SimpleClass {
    var propC: String?

    public static func == (lhs: SimpleSubClass, rhs: SimpleSubClass) -> Bool {
        return lhs.propC == rhs.propC
    }
}
```

Because when you comparing two `SimpleSubClass` objects, only the super class's `==` function is called.

---

## Solution

Add an extra `equals` function that can be overriden in subclass

```swift
class SimpleClass: Equatable {
    var propA: String?
    var propB: Int?
    public static func == (lhs: SimpleClass, rhs: SimpleClass) -> Bool {
        return lhs.equals(rhs: rhs)
    }

    func equals(rhs: SimpleClass) -> Bool {
        return self.propA == rhs.propA
            && self.propB == rhs.propB
    }
}

class SimpleSubClass: SimpleClass {
    var propC: String?

    public override func equals(rhs: SimpleClass) -> Bool {
        guard let other = rhs as? SimpleSubClass else { return false }
        return super.equals(rhs: other)
            && self.propC == other.propC
    }
}

```

---

# References

- https://forums.swift.org/t/implement-equatable-protocol-in-a-class-hierarchy/13844
- https://gist.github.com/fjfdeztoro/a5097f1b24379e127674eb1df8c97d96