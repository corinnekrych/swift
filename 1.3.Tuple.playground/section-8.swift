
var imageName: String
var condition = 310
var nightTime = true
switch (condition, nightTime) {
case let (x, y) where x < 300 && y == true:     imageName = "11n"
case let (x, y) where x < 300 && y == false:    imageName = "11d"
    
case let (x, y) where x < 1000 && y == true:    imageName = "11n"
case let (x, y) where x < 1000 && y == false:   imageName = "11d"
    
case let (x, y): imageName = "dunno"
}




