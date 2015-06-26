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

// 1. force unwrapped
var optionalValue: String?
// optionalValue! // no compilation issue but runtime issue because optionaValue is nil

// 2. if let: unwrap with
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

// 3. optional chaining
// do not unwrap optionals if not needed, work with then

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
   
//: #### Caution when unwrapping
//:
//: Check first or use optional chaining

func toInt(first:String!) -> Int! {
    return Int(first)!
}
var myIn:Int = toInt("3")
// var myIn:Int = toInt("3e") // runtime error

