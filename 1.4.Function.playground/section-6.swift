
let outArray2 = map(inputArray) {(element: Int) -> Int in
    return element * element
}
outArray2

// remove last return
let outArray3 = map(inputArray) {(element: Int) -> Int in
    element * element
}
outArray3

// The arguments to a closure are available within a closure as shorthand as in $0, $1, $2
let outArray4 = map(inputArray) {$0*$0}
outArray4
