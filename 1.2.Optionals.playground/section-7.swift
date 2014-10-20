
func toInt(first:String!) -> Int! {
    return Int(first.toInt()!)
}
var myIn:Int = toInt("3")
// var myIn:Int = toInt("3e") // runtime error
