
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
