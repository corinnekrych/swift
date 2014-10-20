/*
http://www.slideee.com/slide/swift-functional-programming-and-the-future-of-objective-c?utm_content=buffered685&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer


HOF
map

reduce HOF for processing a collection into a single value

JSON as algebraic data type
SwiftyJSON


SwiftZ Dollar



https://github.com/pNre/ExSwift

https://github.com/ankurp/Dollar.swift
*/

//Let's take a tour some of the higher-order functions on arrays from the Swift standard library.

// 1. Map

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

// 2. Filter
var names = ["Emile", "Agathe", "Eglantine", "Simon"]
func filter<T>(xs: [T], check: T -> Bool) -> [T] {
    var result: [T] = []
    for x in xs {        if check(x) {            result.append(x)
        }    }    return result
}

let filetredNames = filter(names) {!$0.hasPrefix("E")}

// of course filter is already there
let withoutE = names.filter {!$0.hasPrefix("E")}
withoutE

// 3. Reduce
func concatenate(xs: [String]) -> String {
    var result: String = ""    for x in xs {        result += x
    }    return result
}
let namesString = concatenate(names)
namesString

// with generics
func reduce<A, R>(arr: [A], initialValue: R, combine: (R, A) -> R) -> R {    var result = initialValue
    for i in arr {        result = combine(result, i)
    }    return result
}

func concatUsingReduce(xs: [String]) -> String {
    return reduce(xs, "", +)
}
let namesString2 = concatUsingReduce(names)
namesString2

println("\(namesString2)")
        

// Going surthe
