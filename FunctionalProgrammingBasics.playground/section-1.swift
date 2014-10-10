// Take all the voc from
// https://medium.com/swift-programming/2-functional-swift-c98be9533183

/*
Functional programming features supported by Swift.
    
Higher Order Function — Functions can be passed as arguments to other functions, and can be returned from other functions.
First Class Citizens — Functions can be treated like any other value in the language (first class citizen). You can assign them to variables, pass them as arguments and return them from functions.
Nested Functions — You can define functions within a functions.
Closures — A Closure is a special case of a function. You can pass arguments to it, and return values from it. Unlike functions, it does not have a name. It is more like an anonymous function or lambda in other languages. Though I suspect the nature of Closures in Swift is more akin to blocks in Objective-C.
Anonymous Functions — They are just Closures
Functional programming features not supported in Swift

Tail Call Optimisation. TCO is supported under certain circumstances though. Under maximum optimisation if ARC allows.
Pure Functions
Recursion — You can actually do recursion in Swift. However since there is no tail call optimisation, it is risky to use recursion. But you can safely use recursion if you are sure the depth of recursion is not in the magnitude of tens of thousands. Eg. you could use recursion for traversing tree structures like DOM, XML, JSON.
*/

func map<T, U>(array: [T], callback: (T) -> U) -> [U] {
    var newarray: [U] = [U]()
    for i in 0..<array.count {
        newarray += [callback(array[i])]
    }
    return newarray
}
//let mappedArray = map([1, 2, 3, 4, 5], square)




// https://medium.com/@santoshrajan/4bb7256c087d

// http://www.objc.io/issue-16/functional-swift-apis.html
// florian
// build a photo filter