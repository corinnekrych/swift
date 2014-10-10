// http://www.russbishop.net/swift-function-currying

// triangle pascal
//def pascal(c: Int, r: Int): Int = {
//    if (c == 0) 1
//    else
//    if (c == r ) 1
//    else pascal(c - 1, r - 1) + pascal(c, r - 1)
//}

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

greetShoftShake("Eloise", "Dupont")


func greetingsEasy(firstname:String)(lastname:String)(age:Int)(location:String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

// => no mutable global state