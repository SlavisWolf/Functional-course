

let array = [4,6,3,5,7,8,7,5,6,4,5,6,7,6,5,4,3]

//array.sorted(by: <).map { String($0) }

let arrayA = array
    .filter { $0 <= 5}
    .sorted(by: <)
    .map { String($0) }
    .reduce("") { "\($0), \($1)" }
    .dropFirst()


print(arrayA)
