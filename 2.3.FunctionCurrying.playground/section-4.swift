
func greetingsEasy(firstname:String)(lastname:String)(today:String)(location:String) -> String {
    return "Hello \(firstname) \(lastname). Welcome in \(location) today \(today)"
}

let greetMichelle = greetingsEasy("Michelle")
greetMichelle(lastname: "Dupont")(today: "Thursday 23rd October")(location: "Geneve")

