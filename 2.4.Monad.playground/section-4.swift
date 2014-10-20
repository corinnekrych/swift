
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
