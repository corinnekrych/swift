
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


