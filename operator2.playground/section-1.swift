// overloading
func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
      sum.append(left[key] + right[key])
    }
    return sum
}
var sumArray1 = [1, 2, 3] + [1, 2, 3]

func -(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus.append(left[key] - right[key])
    }
    return minus
}
var minusArray2 = [1, 2, 3] - [1, 2, 3]
minusArray2 = [1, 2, 3] - [0, -2, 4]