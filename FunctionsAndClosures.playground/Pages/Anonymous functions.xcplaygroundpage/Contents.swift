

let array = [4,6,3,5,7,8,7,5,6,4,5,6,7,6,5,4,3]

func add(a: Int, b: Int) -> Int {
    a + b
}

func subtract(a: Int, b: Int) -> Int {
    a - b
}

func multiply(a: Int, b: Int) -> Int {
    a * b
}

func divide(a: Int, b: Int) -> Int {
    a / b
}


func calculation(numbers: [Int], algorithm: (Int, Int) -> Int) -> Int? {
    
    guard var result = numbers.first else { return nil }
    
    for value in numbers.dropFirst() {
        result = algorithm(result == 0 ? 1 : result, value)
    }
    
    return result
}


calculation(numbers: array, algorithm: add)
calculation(numbers: array, algorithm: subtract)
calculation(numbers: array, algorithm: multiply)
calculation(numbers: array, algorithm: divide)

// With anonymous functions ordered by inference from least to most

let addResult = calculation(numbers: array, algorithm: { (a: Int, b: Int) -> Int in
    return a + b
})

let subtractResult = calculation(numbers: array, algorithm: { (a: Int, b: Int) in
    a - b
})
let multiplyResult = calculation(numbers: array, algorithm: { a, b in
    a * b
})
let divideResult = calculation(numbers: array, algorithm: { $0 / $1 })

// With pre-existing functions

calculation(numbers: array, algorithm: +)
calculation(numbers: array, algorithm: -)
calculation(numbers: array, algorithm: *)
calculation(numbers: array, algorithm: /)
