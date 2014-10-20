
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

