
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
