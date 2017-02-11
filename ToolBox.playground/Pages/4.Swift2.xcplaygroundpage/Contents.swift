//: [Previous](@previous)

//: in Swift beta2
enum Either<T, U> { case left(T), right(U) }
let lefts: [Either<Int, String>] = [1, 2, 3].map(Either.left)
let rights: [Either<Int, String>] = ["one", "two", "three"].map(Either.right)

//: puzzled by the 3 times displayed when inline, 2 times when 2 lines
//: must be a playground bug
let optionalArray1 = ["one", "two"].map(Optional.some)
let optionalArray2 = ["one", "two"].map{Optional.some($0)}

let optionalArray3 = ["one", "two"].map({ (s:String) in return Optional.some(s)})
optionalArray1
optionalArray2


//: [Next](@next)
