// Optional Values = sth or nothing
// only optional values can be nil.
var optionalString: String?
optionalString == nil
// Non optional values needs to be initialized before using them. So they don't need explicit nil checks.
var string: String = "Test String"
string == "Test String"

// short name ? and ! for Optional<T> and ImplicitlyUnwrappedOptional<T> (for which the ‘?’ and ‘!’ type modifiers are syntactic sugar).


// Optional are everywhere in CocoaTouch API
// When translating

// An optional is sth or nothing, you can not compute operation with optional
// you need to unwarp them
var i: Int?
var j: Int?
//var k = i + j     // compilation issue
//var k = i! + j!   // no compilation issue but runtime issue if i/j not initialised
//var k = (i ?? 0) + (j ?? 0) // nil

// Most of the time, operating on optionals required unwrapping...
// Except for println and string interpolation
var kitty: String? = "Kitty"
var greeting = "Hello \(kitty)"     // No compiler error!
print("Hello")
println(kitty)      // Also fine.
//var nope = "Hello " + kitty         // Compiler error


// Several way of unwrapping
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
