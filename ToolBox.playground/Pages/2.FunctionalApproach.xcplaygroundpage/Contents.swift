//: [Previous](@previous)

//: The problem with object-oriented languages is they’ve got all this implicit environment that they carry around with them. You wanted a banana but what you got was a gorilla holding the banana and the entire jungle.
//: **Joe Armstrong**

//: # Imparative vs Declative
//: ## Taking OOP approach: building the jungle

struct Position {
    var x: Int
    var y: Int
}

struct SquareAera {
    // left corner origin of the square
    var origin: Position
    var length: Int
}

class Gorilla {
    let name: String
    var position: Position
    init(name: String, position: Position) {
        self.name = name
        self.position = position
        
    }
    func isInRange(target: SquareAera) -> Bool {
        return target.origin.x <= position.x && position.x <= target.origin.x + target.length
            && target.origin.y <= position.y && position.y <= target.origin.y + target.length
    }
}

class Jungle {
    var bananaAera: SquareAera
    var gorillas: [Gorilla]
    init(bananaAera:SquareAera, gorillas: [Gorilla]) {
        self.bananaAera = bananaAera
        self.gorillas = gorillas
    }
    func gorillasInBananaAera() -> [Gorilla] {
        var gorillasInBananaAera: [Gorilla] = []
        for gorilla in gorillas {
            if gorilla.isInRange(bananaAera) {
                gorillasInBananaAera.append(gorilla)
            }
        }
        return gorillasInBananaAera
    }
}




let julia = Gorilla(name: "Julia", position: Position(x: 12, y: 5))
let emily = Gorilla(name: "Emily", position: Position(x: 5, y: 5))
let eva = Gorilla(name: "Eva", position: Position(x: 10, y: 10))
let jungle = Jungle(bananaAera: SquareAera(origin: Position(x: 1, y: 1), length: 10), gorillas: [julia, emily, eva])

let list = jungle.gorillasInBananaAera()

//: ## Fuctional way
typealias Position2 = (x: Int, y: Int)
typealias SquareAera2 = (origin: Position2, length: Int)

struct Gorilla2 {
    var name: String
    let position: Position2
}


let target2 = SquareAera2(origin: Position2(x: 1, y: 1), length: 10)

// high order function
func inRange(gorilla: Gorilla2) -> Bool {
    return target2.origin.x <= gorilla.position.x && gorilla.position.x <= target2.origin.x + target2.length
        && target2.origin.y <= gorilla.position.y && gorilla.position.y <= target2.origin.y + target2.length
}
// no need of imperative for
let julia2 = Gorilla2(name: "Julia", position: Position2(x: 12, y: 5))
let emily2 = Gorilla2(name: "Emily", position: Position2(x: 5, y: 5))
let eva2 = Gorilla2(name: "Eva", position: Position2(x: 10, y: 10))
let listOfGorillasInBananaAera = [julia2, emily2, eva2].filter(inRange)

//: By taking away the for loop in the ```inRange``` function you remove some on the "how to do it" imperative statement to focus more on what you want to achieve.

//: With functional programming, you are at a higher level of abstraction, removing some of the boiler plate code.

//: # Working with functions
//: HOF (high order function) allows us to work with function as we'll do with object.

//: ## Map / Reduce / filter to get gorillas
//: Let's carry on with our example:


func toUpperCase(gorilla: Gorilla2) -> Gorilla2 {
    var goril = gorilla
    goril.name = gorilla.name.uppercaseString
    return goril
}
func toLowerCase(gorilla: Gorilla2) -> Gorilla2 {
    var goril = gorilla
    goril.name = gorilla.name.lowercaseString
    return goril
}

let namesString = [julia2, emily2, eva2].map(toUpperCase)
    .reduce("List of names:", combine: { name, gorilla in name + " " + gorilla.name})

//: ## Function compositiom

//: I coined the term for the first time in [Chris Eidehof's book](https://www.objc.io/books/fpinswift/) here is how to do function compisition with our Gorillas:

typealias Transfrom = Gorilla2 -> Gorilla2

func compose(filter1: Transfrom, filter2: Transfrom) -> Transfrom {
    return { gorilla in
        filter2(filter1(gorilla))
    }
}
let composedFunction = compose(toUpperCase, filter2: toLowerCase)

let listA2 = [julia2, emily2, eva2].map(composedFunction)


//: With function composition, we very close to be able to use operator overloading:

infix  operator >>> {associativity left}
func >>> (filter1: Transfrom, filter2: Transfrom) -> Transfrom {
    return { gorilla in
        filter2(filter1(gorilla))
    }
}
let composed = toUpperCase >>> toLowerCase


let listA3 = [julia2, emily2, eva2].map(toUpperCase >>> toLowerCase)

//: ## Curried function: a first hint
//: If we take back the example with ```inRange``` function, we noticed target was defined as a global 
//: variable. Let's change it to include it as a prametrized function. Instead of having a function with arity 2 (ie: 2 parameter) we've choosen to have a function with on parameter that return another function.
func inRange_returnFunction(target: SquareAera) -> Gorilla -> Bool {
    return { gorilla in
        target.origin.x <= gorilla.position.x && gorilla.position.x <= target.origin.x + target.length
            && target.origin.y <= gorilla.position.y && gorilla.position.y <= target.origin.y + target.length
    }
}
//: Since we have a function that return a function, we can then defined a partially applied function:
let inRangeAera = inRange_returnFunction(SquareAera(origin: Position(x: 1, y: 1), length: 10))
let listOfGorillasInBananaAera_returnFunction = [julia, emily, eva].filter(inRangeAera)

//: Another way of doing it is by using this simplified syntax:
func inRange_curry(target: SquareAera)(gorilla: Gorilla) -> Bool {
    return target.origin.x <= gorilla.position.x && gorilla.position.x <= target.origin.x + target.length
        && target.origin.y <= gorilla.position.y && gorilla.position.y <= target.origin.y + target.length
}
let inRangeAera2 = inRange_returnFunction(SquareAera(origin: Position(x: 1, y: 1), length: 10))
let listOfGorillasInBananaAera_ = [julia, emily, eva].filter(inRangeAera2)

let listA = [julia, emily, eva].filter(inRangeAera2).filter({$0.name.characters.contains("a")})
//: The action of transformaing of function of arity n to n function of one parameter is called: currying. this technique allow you to partially apply a function which is very powefull when working with functions.
//: [Next](@next)
