//: [Previous](@previous)

//: # Function
//: #### Functions vs Methods
//: Functions are standalone, while methods are functions that are encapsulated in a class, struct, or enum.

func hello(firstname: String, lastname: String) -> String {
    return "hello, \(firstname) \(lastname)"
}

hello("Isabel", lastname: "Dupont")

func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello("Isabel", lastname: "Dupont", age: 5, location: "Geneve")


func hello(firstname  firstname: String, lastname: String, age: Int, location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(firstname: "Isabel", lastname: "Dupont", age: 5, location: "Geneve")

//: # Methods
//: #### Methods
//: Swift gives the first parameter name in a method a local parameter name by default,
//: and gives the second and subsequent parameter names both local and external parameter names by default.


//: This convention matches the typical naming and calling convention you will be familiar with from writing Objective-C methods,
//: and makes for expressive method calls without the need to qualify your parameter names.

//:     - (NSString *)myMethodNameWithParameter1:(NSString *)param1 parameter2:(NSNumber *)param2 {
//:        // instance method
//:        // one parameter of type NSString pointer, one parameter of type NSNumber pointer
//:        // must return a value of type NSString pointer
//:        return @"hello, world!";
//:    }

class Greetings {
    
    func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
        return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
    }
    
    
}

let morning = Greetings()
morning.hello("Isabel", lastname: "Dupont", age: 5, location: "Geneve")
// idea rename method helloWithName
// add _ or #

//: # Init
//: Special case :)


// 4. Init
class GreetingPolyglot {
    var language:String
    init(language: String) {
        self.language = language
    }
}
let frenchGreeting = GreetingPolyglot(language: "french")

//: [Next](@next)
