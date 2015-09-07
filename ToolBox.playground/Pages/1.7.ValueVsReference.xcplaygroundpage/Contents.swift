//: [Previous](@previous)

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

//: ### Difference between Struct / Class
class Rectangle {
    var length: Int = 0
    var width: Int = 0
}
var rect1 = Rectangle()
rect1.length = 6
var rect2 = rect1
rect2.length = 12
print("Rectangle1's length \(rect1.length)")
print("Rectangle2's length \(rect2.length)")
// both rect1 and rect2 have a lentgh of 24

struct EquilateralTriangle {
    var length: Int = 0
}

var tri1 = EquilateralTriangle()
tri1.length = 10
var tri2 = tri1
tri2.length = 12


print("Triangle1's length \(tri1.length)")
print("Triangle2's length \(tri2.length)")

// different length for tr1 and tr2

struct Drawing {
    var rect: Rectangle
    var tr: EquilateralTriangle
}
//let d1 = Drawing(rect: rectangle1, tr: triangle1)


//: #### By reference or by value?
//: Basics types, as Int, are value types, but in Swift the data structures like Array and Dictionary  <br/>
//: are also value types (implemented as Struct behind the scenes).

//var rectanglesList1 = [rect1, rect2]
//var rectanglesList2 = rectanglesList1
//rectanglesList2.append(Rectangle())
//rectanglesList2[1].length = 15
//rectanglesList1
//rectanglesList2

// Rectangle by Reference
// Array by value

//: ### Mixing: how to keep values types semantics?
//: Taken from [WWDC 2015 - Session 414: Building better apps with value types in Swift](https://developer.apple.com/videos/wwdc/2015/?id=414), let's define:


struct Diagram {
    var rect: Rectangle
    var tri: EquilateralTriangle
    mutating func nextTri() {
        tri.length = tri.length + 1
    }
    func nextRect() {
        rect.length = rect.length + 1
    }
}
// Define rect and tri
var rect = Rectangle()
rect.length = 12
var tri = EquilateralTriangle()
tri.length = 10

var dia1 = Diagram(rect: rect, tri: tri)
print("Dia1's rect \(dia1.rect.length) tri \(dia1.tri.length)")
dia1.nextTri()
dia1.nextRect()
print("Dia1's rect \(dia1.rect.length) tri \(dia1.tri.length)")
rect.length = 45
tri.length = 45
print("Dia1's rect \(dia1.rect.length) tri \(dia1.tri.length)")


//: copy on write pattern
//: unrestricted mutation of referenced objects breaks value semantics
//: 1. Separate non-mutating operations are always safe
//: 2. Mutating operations must first copy
struct DiagramRevisited {
    var rect: Rectangle
    var tri: EquilateralTriangle
    mutating func nextTri() {
        tri.length = tri.length + 1
    }
    mutating func nextRect() {
        let old = rect.length
        rect = Rectangle()
        rect.length = old + 1
    }
}
// Define rect and tri
var rect_ = Rectangle()
rect_.length = 12
var tri_ = EquilateralTriangle()
tri_.length = 10
var dia11 = DiagramRevisited(rect: rect_, tri: tri_)
print("Dia1's rect \(dia11.rect.length) tri \(dia11.tri.length)")
dia11.nextTri()
dia11.nextRect()
print("Dia1's rect \(dia11.rect.length) tri \(dia11.tri.length)")
rect_.length = 45
tri_.length = 45
print("Dia1's rect \(dia11.rect.length) tri \(dia11.tri.length)")



//: [Next](@next)
