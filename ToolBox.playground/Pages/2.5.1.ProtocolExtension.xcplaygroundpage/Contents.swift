//: [Previous](@previous)

//: This playground is very inspired by [Mike Ask blog post on protocol extension](https://mikeash.com/pyblog/friday-qa-2015-06-19-the-best-of-whats-new-in-swift.html).

//: # Extension
//: Let's define an extension to the Array structure. Waht about doing our own implementation of ```filter``` method!
extension Array {
    func myFilter(fn: (Element) -> Bool) -> [Element] {
        var to = [Element]()
        for x in self {
            let t = x as Element;
            if fn(t) {
                to += [t]
            }
        }
        return to
    }
}
let upperThanThree = [1, 3, 4, 24].myFilter({$0 > 3})

//: Say you now want to implement a function that gives you the maximun element of the array. mmm.... we;ve got a problem houston. How does the compiler know ```<``` is a valid operator for generics Element?
//: For example, here is an example how to define an extension for an Array<Int>.
extension Array {
    var max: Element {
        var best = self[self.startIndex]
        for elt in self {
            if (elt as! Int) > (best as! Int) {
                best = elt
            }
        }
        return best
    }
}

let maxInt = [1, 3, 4, 24].max

//: Notice the downcast to Int type. Not good.

//: # With Swift2.0, extension with type constraints
//: ```max``` doesn't conceptually work with all collections, only collections of objects that have some sort of ordering. Let's make it work for all array of comparable element.
extension Array where Element: Comparable {
    var max2: Element {
        var best = self[self.startIndex]
        for elt in self {
            if elt > best {
                best = elt
            }
        }
        return best
    }
}

let maxInt2 = [1, 3, 4, 24].max2
//: We fixed one code smell, the downcast but our ```max``` method would only be available on Array.

//: # With Swift2.0, protocol extension
//: What about now if you want it to work with Set, Array, Range etc... All those collection implement the protocol ```CollectionType```.


extension CollectionType where Self.Generator.Element: Comparable {
    var max: Self.Generator.Element {
        var best = self[self.startIndex]
        for elt in self {
            if elt > best {
                best = elt
            }
        }
        return best
    }
}

Set([5, 4, 3, 2, 1]).max

//: # Dynamic dipatch
//: Mike mentioned it in his post: 
//: There's one wrinkle with protocol extensions, which is a subtle but important distinction which determines whether protocol extension methods are subject to dynamic dispatch.
//: A method in a protocol extension may also be declared in the protocol itself, or it may exist solely in the extension. Methods which exist solely in the extension are not dynamically dispatched and cannot be overridden. Methods which are also declared in the protocol itself are dynamically dispatched and can be overridden. This is a bit difficult to explain, here's an example:

//TODO

//: [Next](@next)
