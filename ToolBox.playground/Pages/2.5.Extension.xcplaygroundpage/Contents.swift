//: [Previous](@previous)

//: # Protocol and Extension

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//: Classes, enumerations, and structs can all adopt protocols.

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

//: MUTATING
//:
//: ----
//: If you mark a protocol instance method requirement as mutating, you do not need to write the mutating keyword when writing an implementation of that method for a class(because methods on a class can always modify the class.).
//: The mutating keyword is only used by structures and enumerations.
//: ----

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription


//: [Next](@next)
