
// 1. force unwrapped
var optionalValue: String?
// optionalValue! // no compilation issue but runtime issue because optionaValue is nil

// 2. if let: unwrap with
var optionalName: String?
var hello = "Hello!"
if let name = optionalName {
    hello = "Hello, \(name)" // not executed
}
optionalName = "John Appleseed"
hello = "Hello, \(optionalName)"

if let name = optionalName {
    hello = "Hello, \(name)" // executed
}

// 3. optional chaining
// do not unwrap optionals if not needed, work with then

//if let a = m() {
//    if let u = a.la1 {
//        if let o = u.la1 {
//            // and so on
//        }
//    }
//}

// Using implicitly unwrapped optionals.
// These can be nil just like a normal optional, but is automatically unwrapped when it is used, which may result in a runtime error (exactly as if you had placed an exclamation point after the variable).

func toInt(first:String!) -> Int! {
    return Int(first.toInt()!)
}
var myIn:Int = toInt("3")
// var myIn:Int = toInt("3e") // runtime error
