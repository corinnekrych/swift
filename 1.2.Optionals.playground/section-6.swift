
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
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}

