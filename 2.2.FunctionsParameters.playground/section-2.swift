
func hello(First firstname: String, Last lastname: String, Age age: Int, Loc location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(First: "Isabel", Last: "Dupont", Age: 5, Loc: "Geneve")

func hello(#firstname: String, #lastname: String, #age: Int, #location: String) -> String {
    return "Hello \(firstname) \(lastname). I live in \(location) too. When is your \(age + 1)th birthday?"
}

hello(firstname: "Isabel", lastname: "Dupont", age: 5, location: "Geneve")
