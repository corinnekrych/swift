
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
