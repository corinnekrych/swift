
for var i = 0; i < countElements(strings); i++ {
    println(strings[i])
}
// Note: open the side bar

// Fast enumeration
for string in strings {
    println(string)
}

// ".each" based
strings.map({ (string: String) -> Void in
    println(string)
})

strings.map { (string: String) -> Void in
    println(string)
}

strings.filter { (string: String) -> Bool in
    return string.hasPrefix("A")
}

strings.filter { $0.hasPrefix("A") }

let luckyNumbers = ["Ash": 17, "Samuel": 11, "Marga": 1337]

for (key, value) in luckyNumbers {
    println("The lucky number of \(key) is \(value)")
}

