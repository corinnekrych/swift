
var dict = ["onekey":"onevalue", "twokey":"twovalue"]

for (key, value) in dict {
    dict[key] = "assign-me-sth"
    println("\(key):\(value)")
}
dict

