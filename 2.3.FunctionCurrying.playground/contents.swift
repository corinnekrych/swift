//: # Curried functions
//:
//: ----
//: PARTIALLY APPLIED FUNCTIONS
//:
//: The basic idea behind currying is that a function can be partially applied, meaning that some of its parameter values can be specified (bound) before the function is called.
//: Partial function application yields a new function. 
//: That new function’s signature is based on the original function’s signature, but the bound parameters are not in the parameter list.
//: ----
//: #### Full blown syntax:


func greetings(firstname: String) -> (String -> (String -> (String -> String))) {
    func lastname(lastname: String) -> (String -> (String -> String)) {
         func date(today: String) -> (String -> String) {
                func location(location: String) -> String {
                    return "Hello \(firstname) \(lastname). Welcome in \(location) today \(today)"
            }
            return location
        }
        return date
    }
    return lastname
}

let greetNathalie = greetings("Natalie")
greetNathalie("Dupont")("Thursday 23rd October")("Geneve")

func greetShoftShake(firstname: String, lastname: String) -> String {
    return greetings(firstname)(lastname)("Thursday 23rd October")("Geneva")
}

greetShoftShake("Eloise", lastname: "Dupont")

//: #### with some syntactic sugar:


func greetingsEasy(firstname:String)(lastname:String)(today:String)(location:String) -> String {
    return "Hello \(firstname) \(lastname). Welcome in \(location) today \(today)"
}

let greetMichelle = greetingsEasy("Michelle")
greetMichelle(lastname: "Dupont")(today: "Thursday 23rd October")(location: "Geneve")
