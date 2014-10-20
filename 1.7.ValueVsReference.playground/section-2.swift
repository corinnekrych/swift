// Value type vs Reference type
var i = 1
var j = i

j = 2
i
j

class Person {
    var name:String = "Rachel"
}
let rachel = Person()
var rachelle = rachel
rachelle.name = "Rachelle"
rachel
rachelle
