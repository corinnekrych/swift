// Take all the voc from
// https://medium.com/swift-programming/2-functional-swift-c98be9533183


func map<T, U>(array: [T], callback: (T) -> U) -> [U] {
    var newarray: [U] = [U]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}
//let mappedArray = map([1, 2, 3, 4, 5], square)




// https://medium.com/@santoshrajan/4bb7256c087d