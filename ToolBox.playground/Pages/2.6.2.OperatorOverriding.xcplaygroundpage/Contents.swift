//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)

//: # Operator Overloading
//:
//: Operator overloading allows you to change the way existing operators work with specific structures or classes.
//:
//: This is exactly what you need – you’d like to change the way the + operator works with Int arrays!

func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerated() {
        sum.append(left[key] + right[key])
    }
    return sum
}
var sumArray1 = [1, 2, 3] + [1, 2, 3]

func -(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerated() {
        minus.append(left[key] - right[key])
    }
    return minus
}
var minusArray2 = [1, 2, 3] - [1, 2, 3]
minusArray2 = [1, 2, 3] - [0, -2, 4]

//: ![Operator rage](OperatorRage.png)
//: #### Remember the operator overloading mantra
//:
//: *With great power comes great responsibility.*
//:
//: Typically, you’ll use overloading to extend an operation to a new object while maintaining the original semantics, rather than defining different (and confusing) behavior.

//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
