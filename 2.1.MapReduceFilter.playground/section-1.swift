
func map(array: [Int], callback: (Int) -> Int) -> [Int] {
    var newarray = [Int]()
    for elt in array {
        newarray += [callback(elt)]
    }
    return newarray
}
// let's take go ful power and define it as generics


func myGenericMap<T, U>(array: [T], callback: T -> U) -> [U] {
    var newarray: [U] = [U]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}
let output = myGenericMap(["hello", "coucou"]) {$0+"!"}
output

// Already exist on Array
let inputArray = [1, 2, 3, 4, 5]
let out = inputArray.map({$0*$0})
out

// Global function
let out2 = map(inputArray) {$0*$0}
out2
