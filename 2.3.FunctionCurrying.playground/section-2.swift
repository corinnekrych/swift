
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
