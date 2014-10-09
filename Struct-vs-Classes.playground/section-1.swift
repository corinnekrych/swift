// from http://rshankar.com/difference-between-struct-and-class-in-swift/
// The main difference is that objects on Struct are passed by value and objects on Class are passed by reference.


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

// So if you want to encapsulate simple data types and use less memory space then go for Struct. Where as if you need to use inheritance, for example you have another class Shape and you want to inherit the methods and properties of Shape class for Rectangle then go for Class. In short, if the importance is for value of the object use Struct and for identify of object use Class.


// Understanding Value and Reference Types in Swift
/*
One of the coolest parts about Swift is how powerful all the types are. Structs are not like basic C structs, they have a lot of similarities with classes, and the same goes for the Enums. This is really good but also comes with the risk that newcomers doesn't know the differences between them. The oficial Swift blog has a great post about [Value and Reference Types](https://developer.apple.com/swift/blog/?id=10), read it.

In this post/playground I want to go step by step in some cases that will help newcomers understand how the different types work in Swift. It's good for people that comes form Objective-C to understand how Swift still has pointers, but hidden behind the language to make it safe. And for the newcomers, that doesn't know much about programming or *pointers*, will be good to understand what's actually happening behind the scenes.

## Categorization

Swift has two categories of Types: Value and Reference.

> A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

⁣

> Reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.


It's good to see to which category each *construct* belongs to:

Value types:

- 	struct
- 	enum
- 	tuple

Reference types:

- 	class

## Let´s play

To understand exactly the implications of all this descriptions we can use playgrounds.

The basic types like *Int* are (obviously if you have C knowledge) value types so if we define an int variable
*/

var a = 1


//and we assign it to another variable

var b = a

//we can modify one without affecting the other:


a = 2
a // 2
b // 1

//As I said this is what you expect if you come from other languages so nothing new here. Let's move on.


class Thing {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


//In the other hand we have *classes* that are reference types, so when you assign an instance of a class (usually called object) to a variable what you are actually doing is assigning a *reference* (a pointer 😜) to that same instance in memory.

//To try it we can instantiate a *bed*

var bed = Thing(name: "Bed");

//And assign that instance to a new variable

var sameBed = bed

//When we change on variable we also change the other because we are actually modifying the underlaying instance.


bed.name = "Big bed"
bed // "Big bed"
sameBed // "Big bed"

//This is the behavior that we expect from classes and objects.

//Structs and Enums in Swift are really powerful, they are quite similar to Classes but we have to remember that they are value types, so they are copied.

struct Stuff {
    var name: String
}
var table = Stuff(name: "Table")
var otherTable = table


//When we change on *table* the other remains intact because we actually have two different structs.

table.name = "Round table"
table // "Round Table"
otherTable // "Table"

//We already said that the *basic* types, as Ints, are value types, but in Swift the data structures like Array and Dictionary are also value types (implemented as Structs behind the scenes).

var array = [1, 2, 3]
var otherArray = array

//If we have on array and we assign it to another variable we have to know that we actually have two different arrays. And that the changes on one doesn't affect the other.

array[1] = 99
array // [1, 99, 3]
otherArray // [1, 2, 3]

//The important part is that this behavior is true when we are modifying the array (or other value type) **itself**, but it doesn't mean that the contents are always copied.

//We can see what happens in the next example. We store objects, instances of classes (reference types), inside arrays (value types) and modify the instances.

var ipad = Thing(name: "iPad")
var mac = Thing(name: "MacBook")
var iphone = Thing(name: "iPhone")
var atv = Thing(name: "AppleTV")

var products = [ipad, mac, iphone]
var otherProducts = products

//Now, as we already know, we have two different arrays here, so we can add one product in the second array without affecting the first:

otherProducts.append(atv)
products // [iPad, MacBook, iPhone]
otherProducts // [iPad, MacBook, iPhone, AppleTV]

//We already knew that, but let's see what happens if we modify the "MacBook" of the first array to be an "iMac".

products[1].name = "iMac"
products // [iPad, iMac, iPhone]
otherProducts // [iPad, iMac, iPhone, AppleTV]

//We see how we changed the name of the *mac* in both arrays. We have the same **references** in both arrays, but the arrays itself are different.
/*
## Conclusion

I hope that all of this was already know by the majority, but I know that some people has difficulties understanding how this things work. And it's worse when you don't have the background of working with *pointers*. Don't think that *pointers* aren't important anymore. They are still here but Swift hides them to make thing easy. I actually like this decision but I'm afraid that the new comers will not understand how actually things work.

Anyways, I hope that this post helps you understand better how the types in Swift work and what expect from them. It's important to know how thing works to use the more appropriate one for every case.
*/