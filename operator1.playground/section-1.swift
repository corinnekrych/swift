// Mathematics operator
var simpleSum = 1 + 3

// Precedence and associativity
var sumWithMultiplication = 1 + 3 - 3 * 2

// Array addition ??
var sumArray = [1, 2] + [1, 2]

// Array substraction
var minusArray = [1, 2] - [1, 2]

// Global func vs operator
func add(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        sum.append(left[key] + right[key])
    }
    return sum
}

var arr1 = [1, 1]
var arr2 = [1, 1]
var arr3 = add(arr1, arr2)




