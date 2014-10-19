
//class Rectangle {
struct Rectangle {
    var length: Int = 0
    var breadth: Int = 0
}
var rectangle1 = Rectangle()
rectangle1.length = 12
var rectangle2 = rectangle1
rectangle2.length = 24
println(rectangle1.length)
println(rectangle2.length)
