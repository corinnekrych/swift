//: # Value type vs Reference type
//: Swift has two categories of Types: Value and Reference.
//: - **Value type** is a type whose value is **copied** when it is assigned to a variable or constant, or when it is passed to a function.            ⁣
//: - **Reference types** are not copied when they are assigned to a variable or constant, or when they are passed to a function. 
//: Rather than a copy, a reference to the same existing instance is used instead. 

//: It's good to see to which category each construct belongs to</p>
//:
//: **Value types:**
//: - struct
//: - enum
//: - tuple
//:
//: **Reference types:**
//: - class
//: - function

class Rectangle {
    var length: Int = 0
    var width: Int = 0
}
var rectangle1 = Rectangle()
rectangle1.length = 12
var rectangle2 = rectangle1
rectangle2.length = 24
println(rectangle1.length)
println(rectangle2.length)


struct EquilateralTriangle {
    var length: Int = 0
}

var triangle1 = EquilateralTriangle()
triangle1.length = 10
var triangle2 = triangle1
triangle1.length = 12

println(triangle1.length)
println(triangle2.length)

//: #### By reference or by value?
//: Basics types, as Int, are value types, but in Swift the data structures like Array and Dictionary  <br/>
//: are also value types (implemented as Struct behind the scenes).

var rectanglesList1 = [rectangle1, rectangle2]
var rectanglesList2 = rectanglesList1
rectanglesList2.append(Rectangle())
rectanglesList2[1].length = 15
rectanglesList1
rectanglesList2

// Rectangle by Reference
// Array by value
