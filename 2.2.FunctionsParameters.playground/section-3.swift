
class Greetings {
    
    func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
        return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
    }

    
}

let morning = Greetings()
morning.hello("Isabel", lastname: "Dupont", age: 5, location: "Geneve")
// idea rename method helloWithName
// add _ or #
