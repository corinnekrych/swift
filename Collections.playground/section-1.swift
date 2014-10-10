
//Question if I do
//what to expect

// inout param
func doubleLast(inout a: [Int]) {
   a[a.count-1] = a.last!*2
}

func tripleLast(a: [Int]) -> [Int] {
    var tripledLast = a
    tripledLast[a.count-1] = a.last!*3
    return tripledLast
}
var d = [1, 2, 3]

doubleLast(&d)
d

tripleLast(d)
d
