
//Higher Order Function — Functions can be passed as arguments to other functions, and can be returned from other functions.
func myMap(array: [Int], callback: (Int) -> Int) -> [Int] {
    var newarray = [Int]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}

let inputArray = [1, 2, 3, 4, 5]

let outArray = myMap(inputArray, {(element: Int) -> Int in
    return element * element
})
outArray

// Let's strip the Closure syntax with some sugar
// If the Closure is the last argument to the function, you can write it as a trailing closure outside the function call, shown as below.
let outArray2 = myMap(inputArray) {(element: Int) -> Int in
    return element * element
}
outArray2

// remove last return
let outArray3 = myMap(inputArray) {(element: Int) -> Int in
    element * element
}
outArray3

// The arguments to a closure are available within a closure as shorthand as in $0, $1, $2
let outArray4 = myMap(inputArray) {$0*$0}
outArray4

//First Class Citizens — Functions can be treated like any other value in the language (first class citizen). You can assign them to variables, pass them as arguments and return them from functions.

func identity(s: Int) -> Int {
    return s
}

var id = identity

// nested function

// Closures — A Closure is a special case of a function. You can pass arguments to it, and return values from it. Unlike functions, it does not have a name. It is more like an anonymous function or lambda in other languages.

let squareClosure = {(element: Int) -> Int in
    return element * element
}

let square:Int->Int = {$0 * $0}

// enclose value
let factor = 3
let linear = {$0*factor}
linear(2)

// full power with Generics

func myGenericMap<T, U>(array: [T], callback: (T) -> U) -> [U] {
    var newarray: [U] = [U]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}
let output = myGenericMap(["hello", "coucou"]) {$0+"!"}
output

// Already exist on Array
let out = inputArray.map({$0*$0})
out

// Global function
let out2 = map(inputArray) {$0*$0}
out2


