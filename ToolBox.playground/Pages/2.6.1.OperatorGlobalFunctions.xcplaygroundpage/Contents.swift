//: [Previous](@previous)

//: ### Adding Isn’t Just for Ints
//:
//: In this case, Swift interprets the + as an append instruction.
//:
//: But what if you did want to add each element by position? This is known as vector addition.
//: Well, you could add a custom function to do this.

var simpleSum = 1 + 3

// Array addition ??
var sumArray = [1, 2] + [1, 2]

// Array substraction
var minusArray = [1, 2] - [1, 2]

// Global func vs operator
func add(left: [Int], _ right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerate() {
        sum.append(left[key] + right[key])
    }
    return sum
}

var arr1 = [1, 1]
var arr2 = [1, 1]
var arr3 = add(arr1, arr2)

//: [Next](@next)
