
var names = ["Emile", "Agathe", "Eglantine", "Simon"]

func filter<T>(xs: [T], check: T -> Bool) -> [T] {
    var result: [T] = []
    for x in xs {
        if check(x) {
            result.append(x)
        }
    }
    return result
}

let filteredNames = filter(names) {!$0.hasPrefix("E")}
filteredNames

// of course filter is already there
let filteredNames2 = names.filter {!$0.hasPrefix("E")}
filteredNames2
