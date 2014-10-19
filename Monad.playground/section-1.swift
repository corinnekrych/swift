/*

http://nomothetis.svbtle.com/the-culmination-i
http://nomothetis.svbtle.com/the-culmination-part-ii

http://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics

*/

/*
 In the past, we’ve used NSJSONSerialization.JSONObjectWithData(NSData, Int, &NSError) which gives us an optional JSON data type and a possible error if there were problems with the parsing. The JSON object data type in Objective-C is NSDictionary which can hold any object in its values
*/
import Foundation

// Simulatinh an HTTP request
var jsonString:NSString = "{\"id\":1, \"name\": \"Eliott\", \"email\": \"eliott@gmail.com\"}"
var data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

// Get Data to serilazed into Json object
var jsonObject: AnyObject?
if let unwrappedData = data {
    jsonObject = NSJSONSerialization.JSONObjectWithData(unwrappedData, options: nil, error: nil)
}

jsonObject

struct User {
    var id: Int
    var name: String
    var email: String
}

func callback(name: String)(user: User) -> () {
    println("\(name):::User is \(user.name) with email \(user.email)")
}

let unwrappingCallback = callback("unwrapping")

// Unwrapping to populate model
if let json = jsonObject as? [String: AnyObject] {
    if let id = json["id"] as? Int {
        if let name = json["name"] as? String {
           if let email = json["email"] as? String {
                let user = User(id: id, name: name, email: email)
            unwrappingCallback(user: user)
           }
       }
   }
}

// 1. define alias
typealias JSON = AnyObject
typealias JSONDictionary = [String: JSON]
typealias JSONArray = [JSON]

// 2. eliminate type checking
func JSONString(object: JSON?) -> String? {
    return object as? String
}

func JSONInt(object: JSON?) -> Int? {
    return object as? Int
}

func JSONObject(object: JSON?) -> JSONDictionary? {
    return object as? JSONDictionary
}

let withFunctionCallback = callback("LessVerbose")
// less verbose
if let json = JSONObject(jsonObject) {
    if let id = JSONInt(json["id"]) {
        if let name = JSONString(json["name"]) {
            if let email = JSONString(json["email"]) {
                let user = User(id: id, name: name, email: email)
                withFunctionCallback(user: user)
            }
        }
    }
}

// 3.
// First, let’s look at the Maybe Monad which is similar to Swift optionals.
infix operator >>> { associativity left precedence 120 }

func >>><A, B>(a: A?, f: A -> B?) -> B? {
    if let x = a {
        return f(x)
    } else {
        return .None
    }
}

let withBindCallback = callback("WithBind")
if let json = jsonObject >>> JSONObject {
    if let id = json["id"] >>> JSONInt {
        if let name = json["name"] >>> JSONString {
            if let email = json["email"] >>> JSONString {
                let user = User(id: id, name: name, email: email)
                withBindCallback(user: user)
            }
        }
    }
}

// 4. Functor and apply
/*
Functors have an fmap operator for applying functions to values wrapped in some context. Applicative Functors also have an apply operator for applying wrapped functions to values wrapped in some context. The context here is an Optional which wraps our value.
*/


struct Person {
    let id: Int
    let name: String
    let email: String
    
    static func create(id: Int)(name: String)(email: String) -> Person {
        return Person(id: id, name: name, email: email)
    }
}

infix operator <^> { associativity left } // fmap
infix operator <*> { associativity left } // apply

func <^><A, B>(f: A -> B, a: A?) -> B? {
    if let x = a {
        return f(x)
    } else {
        return .None
    }
}

func <*><A, B>(f: (A -> B)?, a: A?) -> B? {
    if let x = a {
        if let fx = f {
            return fx(x)
        }
    }
    return .None
}

func withApplyCallback(person: Person) {
    println("Person is:\(person.name) with email\(person.email)")
}

if let json = jsonObject >>> JSONObject {
    
    let user = Person.create <^>
        json["id"]    >>> JSONInt    <*>
        json["name"]  >>> JSONString <*>
        json["email"] >>> JSONString
    
    withApplyCallback(user!)
}



