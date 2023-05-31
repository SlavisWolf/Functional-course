
import Foundation

func generateNumber(max: Int) -> Int {
    Int.random(in: 1...max)
}


func spell(number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en")
    formatter.numberStyle = .spellOut
    return formatter.string(for: number) ?? ""
}

func currencyNumber(number: Int) -> String {
    "\(number)€"
}

func plusTwo(number: Int) -> Int {
    number + 2
}

let randomNumber = generateNumber(max: 5000)
print("The random number is: \(spell(number: randomNumber) )")

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>><T, U, V>(lhs: @escaping (T) -> (U), rhs: @escaping (U) -> (V) ) -> (T) -> (V) {
    return { rhs(lhs($0) ) }
}


let spellOutRandom = generateNumber >>> spell
let randomCurrency = generateNumber >>> currencyNumber
let randomPlusFourCurrency = generateNumber >>> plusTwo >>> plusTwo >>> currencyNumber

let executionInlineExample = (generateNumber >>> plusTwo)(10) * (2+3)

print(spellOutRandom(25) )
print(randomCurrency(18) )
print(randomPlusFourCurrency(50) )
