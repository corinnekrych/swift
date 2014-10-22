
func hello(firstname: String, lastname: String) -> String {
    return "hello, \(firstname) \(lastname)"
}

hello("Isabel", "Dupont")

func hello(firstname: String, lastname: String, age: Int, location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello("Isabel", "Dupont", 5, "Geneve")
