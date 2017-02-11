//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)

//: ## Working with enum
//: examples taken from [Match Me if you can: Swift Pattern Matching in Detail](http://appventure.me/2015/08/20/swift-pattern-matching-in-detail/) blog post

enum TraderType {
    case singleGuy
    case company
}

enum Trades {
    case buy(stock: String, amount: Int, stockPrice: Float, type: TraderType)
    case sell(stock: String, amount: Int, stockPrice: Float, type: TraderType)
}

let aTrade = Trades.sell(stock: "GOOG", amount: 100, stockPrice: 666.0, type: TraderType.company)


func processSlow(_ stock: String, _ amount: Int, _ fee: Float) { print("slow") }
func processFast(_ stock: String, _ amount: Int, _ fee: Float) { print("fast") }

switch aTrade {
case let .buy(stock, amount, _, TraderType.singleGuy):
    processSlow(stock, amount, 5.0)
case let .sell(stock, amount, _, TraderType.singleGuy):
    processSlow(stock, -1 * amount, 5.0)
case let .buy(stock, amount, _, TraderType.company):
    processFast(stock, amount, 2.0)
case let .sell(stock, amount, _, TraderType.company):
    processFast(stock, -1 * amount, 2.0)
}


//: Adding guard

let aTrade2 = Trades.buy(stock: "GOOG", amount: 1000, stockPrice: 666.0, type: TraderType.singleGuy)

switch aTrade2 {
case let .buy(stock, amount, _, TraderType.singleGuy):
    processSlow(stock, amount, 5.0)
case let .sell(stock, amount, price, TraderType.singleGuy)
    where price*Float(amount) > 1000000:
    processFast(stock, -1 * amount, 5.0)
case let .sell(stock, amount, _, TraderType.singleGuy):
    processSlow(stock, -1 * amount, 5.0)
case let .buy(stock, amount, price, TraderType.company)
    where price*Float(amount) < 1000:
    processSlow(stock, amount, 2.0)
case let .buy(stock, amount, _, TraderType.company):
    processFast(stock, amount, 2.0)
case let .sell(stock, amount, _, TraderType.company):
    processFast(stock, -1 * amount, 2.0)
}

//: Note that a ```switch``` statement should be complete. The compiler will remind you if not asking you to add a default case.


//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
