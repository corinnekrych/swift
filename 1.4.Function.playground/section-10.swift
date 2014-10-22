
func map(array: [Int], callback: (Int) -> Int) -> [Int] {
    var newarray = [Int]()
    for elt in array {
        newarray += [callback(elt)]
    }
    return newarray
}

let inputArray = [1, 2, 3, 4, 5]

let outArray = map(inputArray, {(element: Int) -> Int in
    return element * element
})
outArray
