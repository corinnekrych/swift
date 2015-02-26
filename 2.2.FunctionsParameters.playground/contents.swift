//: # Function
//: #### Functions vs Methods
//: Functions are standalone, while methods are functions that are encapsulated in a class, struct, or enum.

func hello(firstname: String, lastname: String) -> String {
    return "hello, \(firstname) \(lastname)"
}

hello("Isabel", "Dupont")

func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello("Isabel", "Dupont", 5, "Geneve")

//: # Local vs external parameter name
//: #### Functions
//: All parameter names in a function are local parameter name by default. <br/>

func hello(first firstname: String, last lastname: String, age age: Int, loc location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(first: "Isabel", last: "Dupont", age: 5, loc: "Geneve")

func hello(#firstname: String, #lastname: String, #age: Int, #location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(firstname: "Isabel", lastname: "Dupont", age: 5, location: "Geneve")

//: # Methods
//: #### Methods
//: Swift gives the first parameter name in a method a local parameter name by default, <br/>
//: and gives the second and subsequent parameter names both local and external parameter names by default.    <br/>
//: This convention matches the typical naming and calling convention you will be familiar with from writing Objective-C methods,  <br/>
//: and makes for expressive method calls without the need to qualify your parameter names.
//: <pre>- (NSString *)myMethodNameWithParameter1:(NSString *)param1 parameter2:(NSNumber *)param2 {
//:        // instance method
//:        // one parameter of type NSString pointer, one parameter of type NSNumber pointer
//:        // must return a value of type NSString pointer
//:        return @"hello, world!";
//:} </pre>

class Greetings {
    
    func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
        return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
    }

    
}

let morning = Greetings()
morning.hello("Isabel", lastname: "Dupont", age: 5, location: "Geneve")
// idea rename method helloWithName
// add _ or #

//: #Init
//: Special case :)


// 4. Init
class GreetingPolyglot {
    var language:String
    init(language: String) {
        self.language = language
    }
}
let frenchGreeting = GreetingPolyglot(language: "french")
// why?
