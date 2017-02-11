//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
//: # Compound Type
//: Tuples are groups of values combined into a single, compound value. Very often use as return type of a function. For example, it allows you to return a value combined with an error code.
//: ### Compound type
//: In Swift, there are two kinds of types: **named** types and **compound** types.<br>
//: A named type is a type that can be given a particular name when it is defined.<br>
//: A compound type is a type without a name, defined in the Swift language itself.<br>
//:
//: There are two compound types: function types and tuple types.
//:
//: # Defining a Tuple
//: Use parenthesis around the comma-delimited list of values without specifying types, so it relies on inference.

let httpError404 = (404, "Not found")
let someOtherTuple = (Double(100), Bool(false))
let someOtherTuple2:(Double, Bool) = (100, false)

typealias Error = (Int, String)
let error = (404, "Noy found")

//: # Different ways of accessing a tuple
//: 1. create tuple with separate variable<br>
//: 2. Access tuple values with the dot operator followed by their index <br>
//: 3. you can name the elements of a Tuple.<br>
//: When you name the elements you effectively assign names to their indices, so the dot operator works with names or integers


var (varStatusCode, varStatusMessage) = httpError404
varStatusCode
varStatusMessage

// Access tuple values with the dot operator followed by their index:
httpError404.0
httpError404.1

// Alternatively, you can name the elements of a Tuple
let namedTuple = (statusCode: 404, message: "Not found")

// When you name the elements you effectively assign names to their indices, so the dot operator works with names or integers:
namedTuple.statusCode == namedTuple.0
namedTuple.message == namedTuple.1

//: # When tuple are handy
//: #### Go through arrays


var dict = ["onekey":"onevalue", "twokey":"twovalue"]

for (key, value) in dict {
    dict[key] = "assign-me-sth"
    print("\(key):\(value)")
}
dict

//: #### Tuple in switch statement

var imageName: String
var condition = 310
var nightTime = true
switch (condition, nightTime) {
case let (x, y) where x < 300 && y == true:     imageName = "11n"
case let (x, y) where x < 300 && y == false:    imageName = "11d"
    
case let (x, y) where x < 1000 && y == true:    imageName = "11n"
case let (x, y) where x < 1000 && y == false:   imageName = "11d"
    
case let (x, y): imageName = "dunno"
}

//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
