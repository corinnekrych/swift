//: # Go functional
//: To enter smoothly in FP world, let's look at just three important higher-order functions used in functional programming:
//: - map (transform),
//: - filter,
//: - and reduce (accumulate).
            
//: # Map
//: map/transform: this function takes a unary function and a list and produces a same-sized list of mapped/transformed values based on substituting each value with the result of calling the parameter function on it. </p>
// #### Not only closures
//: Note that closures are frequently (but not exclusively) used in calls to the map function. We can use regularly defined functions as well, but often we need only a short function, so lambdas often work out well.

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

//: # Filter
//: filter: this function takes a predicate (a unary function returning a bool) and some list of values and produces a list (the same size or smaller) with only those values for which the predicate returns true.

var names = ["Emile", "Agathe", "Eglantine", "Simon"]

func filter<T>(xs: [T], check: T -> Bool) -> [T] {
    var result: [T] = []
    for x in xs {
        if check(x) {
            result.append(x)
        }
    }
    return result
}

let filteredNames = filter(names) {!$0.hasPrefix("E")}
filteredNames

// of course filter is already there
let filteredNames2 = names.filter {!$0.hasPrefix("E")}
filteredNames2

//: # Reduce
//: reduce/accumulate: this function is different than the previous two: it takes a binary function and some list of values and typically produces a single value: it reduces or accumulates these results into a single value.

func concatenate(xs: [String]) -> String {
    var result: String = ""
    for x in xs {
        result += x
    }
    return result
}
let namesString = concatenate(names)
namesString

// with generics
func reduce<A, R>(arr: [A], initialValue: R, combine: (R, A) -> R) -> R {
    var result = initialValue
    for i in arr {
        result = combine(result, i)
    }
    return result
}

func concatUsingReduce(xs: [String]) -> String {
    return reduce(xs, "", +)
}

let namesString2 = concatUsingReduce(names)
namesString2

println("\(namesString2)")