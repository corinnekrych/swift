//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
//: # Generics
//: #### What is the problem we're trying to solve?


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings( a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: #### Let's make it generic!

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: # Generic Functions
//: ```swap``` actually already exists as global function.
//: Did you know there are 74 “built-in function” defined in swift?<br/>
//: - join
//: - max
//: - map
//: - find
//:
//: Full list in <a href="http://practicalswift.com/2014/06/14/the-swift-standard-library-list-of-built-in-functions/">practicalswift.com blog post</a> <br/>
//:
//: A built-in function is available in Swift without importing any modules (such as Foundation, etc.) or referencing any classes.

swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: # Type parameter.
//: #### UpperCameCase for type
//: Always give type parameters UpperCamelCase names (such as T and Key) to indicate that they are a placeholder for a type, not a value.

func anyCommonElements <T, U> (_ lhs: T, _ rhs: U) -> Bool where T: Sequence, U: Sequence, T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

//: # Generics type
//: Swift enables you to define your own generic types. <br/>
//: These are custom classes, structures, and enumerations that can work with any type, in a similar way to Array and Dictionary.

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

//: # Type constraints
//: Type Constraints, enable you to define requirements on the type parameters associated with a generic function or type.

func findIndex<T>(_ array: [T], _ valueToFind: T) -> Int? where T: Equatable {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

findIndex([4, 7], 4)

//: # Associated type
//: When defining a protocol, it is sometimes useful to declare one or more associated types as part of the protocol’s definition. <br/>
//: An associated type gives a placeholder name (or alias) to a type that is used as part of the protocol.
//:
//: The actual type to use for that associated type is not specified until the protocol is adopted.
//:
//: Associated types are specified with the associatedtype keyword (since Swift3, prior we used keyword typealias).

public protocol DataStore {
    associatedtype ContentType
    func save(data: ContentType) -> Bool
}

public class InMemoryDataStore<T>: DataStore {
    public typealias ContentType = T
    public init() {}
    public func save(data: ContentType) -> Bool {
        print("Saving data: \(data)")
        return true;
    }
}

public class Manager<DS: DataStore> {
    let dataStore: DS
    
    public init(dataStore: DS) {
        self.dataStore = dataStore
    }
    
    public func storeData(data: DS.ContentType) {
        dataStore.save(data: data)
    }
    
}
let dataStore = InMemoryDataStore<String>()
let manager = Manager(dataStore: dataStore)
manager.storeData(data: "text")

let dataStoreInt = InMemoryDataStore<Int>()
let managerInt = Manager(dataStore: dataStoreInt)
managerInt.storeData(data: 123456)
managerInt

//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
