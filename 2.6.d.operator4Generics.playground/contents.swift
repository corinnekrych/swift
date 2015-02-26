//: # More Than One Type
//:
//: #### Generics to the Rescue!

protocol Number {
    func +(l: Self, r: Self) -> Self
    func -(l: Self, r: Self) -> Self
}

extension Double : Number {}
extension Float  : Number {}
extension Int    : Number {}

infix operator ⊕ { associativity left precedence 140 }
func ⊕<T: Number>(left: [T], right: [T]) -> [T] {
    var minus = [T]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus.append(left[key] + right[key])
    }
    return minus
}

var doubleArray = [2.4, 3.6] ⊕ [1.6, 2.4]

