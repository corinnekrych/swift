
func hello(first firstname: String, last lastname: String, age age: Int, loc location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(first: "Isabel", last: "Dupont", age: 5, loc: "Geneve")

func hello(#firstname: String, #lastname: String, #age: Int, #location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(firstname: "Isabel", lastname: "Dupont", age: 5, location: "Geneve")
