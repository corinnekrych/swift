//: [Previous](@previous)

//: # Defining Custom Operators
//:
//: There are three steps to define a custom operator:
//: - Name your operator: any unicode
//: - Choose a type: Unary | Binary | Ternary
//: - Assign precedence and associativity
//: ----
//: to resolve this semantics issue, let's go custom operator ⊕ and ⊖

infix operator ⊕ { associativity left precedence 140 }
func ⊕(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerate() {
        minus.append(left[key] + right[key])
    }
    return minus
}

infix operator  ⊖ { associativity left precedence 140 }
func ⊖(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerate() {
        minus.append(left[key] - right[key])
    }
    return minus
}
var sumArray3 = [1, 2, 3] ⊕ [1, 2, 3]
var minusArray3 = [1, 2, 3] ⊖ [1, 2, 3]
minusArray3 = [1, 2, 3] ⊖ [0, -2, 4]

infix operator  ⊖= { associativity left precedence 140 }
func ⊖=(inout left: [Int], right: [Int]) {
    left = left ⊖ right
}
infix operator  ⊕= { associativity left precedence 140 }
func ⊕=(inout left: [Int], right: [Int]) {
    left = left ⊕ right
}
sumArray3 ⊕= [1, 1, 1]

//: Fixing - to mean remove those elements from array

func -(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int]()
    minus = left.filter {!right.contains($0)}
    return minus
}

var minusArray = [1, 2, 3] - [1] + [5, 7]

//: ```+``` mean append

var appendArray = [1, 2] + [3]


//: [Next](@next)
