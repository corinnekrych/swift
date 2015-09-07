//: [Previous](@previous)

//: # An Optional is a box
//:
//: ![Box](box.jpg)
//:
//: Optionals is an enum to say "I have something" or "it's empty". You can picture it as a box which can be empty or contain something. It's just a box, to know what's inside you need to unwrap it. When defining an optional type, use ?, when unwrapping it, use !.
//:
//: #### Note
//:
//: ? and ! are short name for Optional and ImplicitlyUnwrappedOptional.


var optionalString: String?
optionalString == nil
// optional default - nil
// non-optional need value
var string: String = "Test String"
string == "Test String"

//: #### Syntactic sugar: **?** and **!**
//:
//: short name ? and ! for Optional<T> and ImplicitlyUnwrappedOptional<T> (for which the ‘?’ and ‘!’ type modifiers are syntactic sugar).
typealias StringOrNill = Optional<String>
/*
public enum Optional<Wrapped> : _Reflectable, NilLiteralConvertible {
    case None
    case Some(Wrapped)
    /// Construct a `nil` instance.
    public init()
    /// Construct a non-`nil` instance that stores `some`.
    public init(_ some: Wrapped)
    /// If `self == nil`, returns `nil`.  Otherwise, returns `f(self!)`.
    @warn_unused_result
    @rethrows public func map<U>(@noescape f: (Wrapped) throws -> U) rethrows -> U?
    /// Returns `nil` if `self` is nil, `f(self!)` otherwise.
    @warn_unused_result
    @rethrows public func flatMap<U>(@noescape f: (Wrapped) throws -> U?) rethrows -> U?
    /// Create an instance initialized with `nil`.
    public init(nilLiteral: ())
}
*/
//: # To unwrap or not to unwrap?


var i: Int?
var j: Int?
//var k = i + j     // compilation issue
//var k = i! + j!   // no compilation issue but runtime issue if i/j not initialised
//var k = (i ?? 0) + (j ?? 0) // nil

// Most of the time, operating on optionals required unwrapping...
// Except for println and string interpolation
var kitty: String? = "Kitty"
var greeting = "Hello \(kitty)"     // No compiler error!
print("Hello")
print(kitty)      // Also fine.
//var nope = "Hello " + kitty         // Compiler error

//: # Different ways of unwrapping
//:
//: Several way of unwrapping: <br/>
//: 1. either go the brute way, unwrap without checking and risk a runtime error<br>
//: 2. or check before with if statement, you can even use the if let or if var statement<br>
//: 3. or go with optional chaining with elvis operator ?. <br/>

//: #### 1. force unwrapped
var optionalValue: String?
// optionalValue! // no compilation issue but runtime issue because optionaValue is nil

//: #### 2. if let: unwrap with
var optionalName: String?
var hello = "Hello!"
if let name = optionalName {
    hello = "Hello, \(name)" // not executed
}
optionalName = "John Appleseed"
hello = "Hello, \(optionalName)"

if let name = optionalName {
    hello = "Hello, \(name)" // executed
}

//: #### 3. Optional chaining
//: Take the "do not unwrap optionals if not needed, work with then" approach.
//: ##### From Swift 1.0
class Person {
    var name: String?
    var residence: Residence?
}

class Residence {
    var address:  Address?
}

class Address {
    var city: String?
}


func whichCity(person: Person) -> String? {
    if let name = person.name {
        if let city = person.residence?.address?.city {
            print("\(name) lives in \(city).")
            return city
        } else {
            print("I don't know where \(name) lives.")
            return nil
        }
    } else {
        print("I don't know anything.")
        return nil
    }
}

let john = Person()
whichCity(john)
john.name = "John"
whichCity(john)

//: ##### From Swift 1.2
//: Optional chaining with a single ```if let``` to avoid pyramid of doom
func whichCity2(person: Person) -> String? {
    if let name = person.name, city = person.residence?.address?.city {
        print("\(name) lives in \(city).")
        return city
    } else {
        (person.name != nil) ? print("I don't know where \(person.name!) lives.") : print("I don't know anything.")
        return nil
    }
}

let eliot = Person()
whichCity2(eliot)
eliot.name = "Eliot"
whichCity2(eliot)

//: ##### From Swift 2.0
//: Taking the other part of the check, not checking if not nil but rather focus on what is happening when nil. Exit/return the function.
func whichCity3(person: Person) -> String? {
    guard let name = person.name else {
        print("I don't know anything.")
        return nil
    }
    guard let city = person.residence?.address?.city else {
        print("I don't know where \(person.name!) lives.")
        return nil
    }
    print("\(name) lives in \(city).")
    return city
}
let mike = Person()
whichCity3(mike)
mike.name = "Mike"
whichCity3(mike)
//: #### Caution when unwrapping
//:
//: Check first or use optional chaining

func toInt(first:String!) -> Int! {
    return Int(first)!
}
var myIn:Int = toInt("3")
// var myIn:Int = toInt("3e") // runtime error

//: [Next](@next)
