//: # Problem to solve
//: 
//: Write an object from JSON object
//:
//: ----
//: OBJECTIVE-C WAY
//:
//: we’ve used ```NSJSONSerialization.JSONObjectWithData(NSData, Int, &NSError)``` 
//: which gives us an optional JSON data type and a possible error if there were problems with the parsing. 
//: The JSON object data type in Objective-C is NSDictionary which can hold any object in its values
//: ----
//:
//: #### Here is our JSON object

import Foundation

var jsonString:NSString = "{\"id\":1, \"name\": \"Eliott\", \"email\": \"eliott@gmail.com\"}"
var data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

// Get Data to serialized into Json object
var jsonObject: AnyObject?
if let unwrappedData = data {
    jsonObject = NSJSONSerialization.JSONObjectWithData(unwrappedData, options: nil, error: nil)
}

jsonObject

//: #### Here object model structure:

struct User {
    var id: Int
    var name: String
    var email: String
}

func callback(name: String)(user: User) -> () {
    println("\(name):::User is \(user.name) with email \(user.email)")
}

//: #### How o do in Swift

let unwrappingCallback = callback("unwrapping")

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

//: # Solving the problem in Swift
//: #### Step1 - making it more elegant: eliminate type checking

// define alias
typealias JSON = AnyObject
typealias JSONDictionary = [String: JSON]
typealias JSONArray = [JSON]

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

//: #### Step2 - define bind

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

//: #### Step3 - Functor and apply bind
//: ----
//: **Functors** have an fmap operator for applying functions to values wrapped in some context. 
//: 
//: Applicative Functors also have an apply operator for applying wrapped functions to values wrapped in some context.
//: The context here is an Optional which wraps our value.

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
