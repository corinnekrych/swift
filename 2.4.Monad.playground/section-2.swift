
struct User {
    var id: Int
    var name: String
    var email: String
}

func callback(name: String)(user: User) -> () {
    println("\(name):::User is \(user.name) with email \(user.email)")
}
