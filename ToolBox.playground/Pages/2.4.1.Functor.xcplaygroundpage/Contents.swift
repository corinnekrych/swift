//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
/*: 
# Functor

From 
    func mapOptional<T, U>(maybeX: Optional<T>,
    transform: T -> U) -> Optional<U>
    func mapArray<T, U>(xs: Array<T>, transform: T -> U) -> Array<U>

Both Optional and Array are type constructors that expect a generic type argument. 
For instance, Array<T> and Optional<Int>
are valid types, but Array by itself is not. 
Both of these map functions take two arguments: the structure being mapped and a function transform of type T -> U. 
The map functions use a function argument to transform all the values of type T to values of type U in the argument 
array or optional. 
Type constructors — such as optionals or arrays — that support a map operation are sometimes referred to as functors.
*/

//TODO

/*: 
# Applicative Functor
The choice for these two operations is no coin- cidence. Any type constructor for which we can define appropriate pure 
and <*> operations is called an applicative functor. To be more precise, a functor F is applicative when it supports 
the following operations:
    func pure<A>(value: A) -> F<A>
    func <*><A,B>(f: F<A -> B>, x: F<A>) -> F<B>
<*> is called ```apply```
*/

/*:
# flapMap
The flatMap function is impossible to define in terms of the applica- tive functions. In fact, the flatMap 
function is one of the two functions supported by monads. More generally, a type constructor F is a monad if 
it defines the following two functions:
    func pure<A>(value: A) -> F<A>
    func flatMap<A, B>(x: F<A>, f: A -> F<B>) -> F<B>
The flatMap function is sometimes defined as an operator, >>=. This op- erator is pronounced “bind,” as it binds the result of the first argument to the parameter of its second argument.
*/

//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
