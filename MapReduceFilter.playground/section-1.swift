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

// Already exist on Array
let inputArray = [1, 2, 3, 4, 5]
let out = inputArray.map({$0*$0})
out

// Global function
let out2 = map(inputArray) {$0*$0}
out2

// 2. Filter
var names = ["Emile", "Agathe", "Eglantine", "Simon"]

    var result: [T] = []
    for x in xs {
        }
}

let filetredNames = filter(names) {!$0.hasPrefix("E")}

// of course filter is already there
let withoutE = names.filter {!$0.hasPrefix("E")}
withoutE

// 3. Reduce
func concatenate(xs: [String]) -> String {
    var result: String = ""
    }
}
let namesString = concatenate(names)
namesString

// with generics
func reduce<A, R>(arr: [A], initialValue: R, combine: (R, A) -> R) -> R {
    for i in arr {
    }
}

func concatUsingReduce(xs: [String]) -> String {
    return reduce(xs, "", +)
}

namesString2

println("\(namesString2)")
        

// Going surthe