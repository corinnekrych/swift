// http://www.objc.io/issue-16/swift-functions.html

// TL;DR: Functions are standalone, while methods are functions that are encapsulated in a class, struct, or enum.

// 1.functions

func hello() {
    println("hello, world!")
}

func hello(firstname: String, lastname: String) -> String {
    return "hello, \(firstname) \(lastname)"
}

hello()

hello("Isabel", "Dupont")

func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello("Isabel", "Dupont", 5, "Geneve")

// label name
// either different label or the same (shortcut #)
func hello(#firstname: String, #lastname: String, #age: Int, #location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(firstname: "Isabel", lastname: "Dupont", age: 5, location: "Geneve")

// 2. methods
// When encapsulated in a class (or struct or enum), the first parameter name of a method is not included externally, while all following parameter names are included externally when the method is called:

class Greetings {
    
    func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
        return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
    }

    
}

let morning = Greetings()
morning.hello("Isabel", lastname: "Dupont", age: 5, location: "Geneve")
// idea rename method helloWithName
// add _ or #

// 3. Instance Methods Are Curried Functions
// The basic idea behind currying is that a function can be partially applied, meaning that some of its parameter values can be specified (bound) before the function is called. Partial function application yields a new function.

let greetings = Greetings.hello
greetings(morning)("Isabel", lastname: "Dupont", age: 5, location: "Geneve")

// => Function first class citizen

// 4. Init

