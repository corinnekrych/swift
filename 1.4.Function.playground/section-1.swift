//1. Functions
//Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")


// Functions can be nested. Nested functions have access to variables that were declared in the outer function. 


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//2. Closures — A Closure is a special case of a function. You can pass arguments to it, and return values from it. Unlike functions, it does not have a name. It is more like an anonymous function or lambda in other languages.

let squareClosure = {(element: Int) -> Int in
    return element * element
}

let square:Int->Int = {$0 * $0}

// enclose value
//Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. 
let factor = 3
let linear = {$0*factor}
linear(2)

//3. Higher Order Function — Functions can be passed as arguments to other functions, and can be returned from other functions.
func map(array: [Int], callback: (Int) -> Int) -> [Int] {
    var newarray = [Int]()
    for elt in array {
        newarray += [callback(elt)]
    }
    return newarray
}

let inputArray = [1, 2, 3, 4, 5]

let outArray = map(inputArray, {(element: Int) -> Int in
    return element * element
})
outArray

// Let's strip the Closure syntax with some sugar
// If the Closure is the last argument to the function, you can write it as a trailing closure outside the function call, shown as below.
let outArray2 = map(inputArray) {(element: Int) -> Int in
    return element * element
}
outArray2

// remove last return
let outArray3 = map(inputArray) {(element: Int) -> Int in
    element * element
}
outArray3

// The arguments to a closure are available within a closure as shorthand as in $0, $1, $2
let outArray4 = map(inputArray) {$0*$0}
outArray4

//First Class Citizens — Functions can be treated like any other value in the language (first class citizen). You can assign them to variables, pass them as arguments and return them from functions.

func identity(s: Int) -> Int {
    return s
}

var id = identity








