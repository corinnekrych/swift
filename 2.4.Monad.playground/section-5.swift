
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
