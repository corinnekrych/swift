import UIKit


// Tuples are groups of values combined into a single, compound value. Very often use as
// return type of a function. For example, it allows you to return a value combined with an error code.

// Defining a Tuple
// Use parenthesis around the comma-delimited list of values without specifying types, so it relies on inference
let httpError404 = (404, "Not found")
let someOtherTuple = (Double(100), Bool(false))
let someOtherTuple2:(Double, Bool) = (100, false)

// Accessing a Tuple
// Decomposing tuples looks like this
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

// Tuple and Array
//With Beta3, syntax

// Tuple to enumerate a Dictionnary
var dict = ["onekey":"onevalue", "twokey":"twovalue"]

for (key, value) in dict {
    dict[key] = "assign-me-sth"
    println("\(key):\(value)")
}
dict

// Tuple in switch statement
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


// Array of tuple and issue with beta3

var myArray = [String]()
// Error in playgroung: invalid use of () to call a value of non-function type
//var array1 = [(String, String)]()

var array1: [(String, String)] = []
array1 +=  [("1", "2")]
array1

var array2:[(String, String)] = []
var tuple = ("fddfd", "fdfdf")
// Error in playgroung: Missing argument #2 in call
//array2.append(tuple)
array2 += [tuple]
array2

// Correct in playgroung
var array3:[String] = []
array3.append("ddd")



