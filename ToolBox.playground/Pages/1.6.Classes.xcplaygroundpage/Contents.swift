//: [Previous](@previous)

//: # Classes
//: Use class followed by the class’s name to create a class. <br/>
//: A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. <br/>
//: Likewise, method and function declarations are written the same way.

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = NamedShape(name: "circle")
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//: Notice how self is used to distinguish the name property from the name argument to the initializer.

//: #### Designed for Safety
//: Every property needs a value assigned either in its declaration (as with numberOfSides) or in the initializer (as with name).

//: # Inheritance
//: Methods on a subclass that override the superclass’s implementation are marked with override.
//:
//: The compiler also detects methods with override that don’t actually override any method in the superclass.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

//: # Computed value
//: Stored vs Computed properties
//:
//: Computed properties, which do not actually store a value. <br/>
//: Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.


//: [Next](@next)
