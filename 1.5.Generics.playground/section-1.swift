
// Map full power with Generics

func myGenericMap<T, U>(array: [T], callback: T -> U) -> [U] {
    var newarray: [U] = [U]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}
let output = myGenericMap(["hello", "coucou"]) {$0+"!"}
output