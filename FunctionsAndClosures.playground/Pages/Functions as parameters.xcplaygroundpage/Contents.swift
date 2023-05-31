

let array = [4,6,3,5,7,8,7,5,6,4,5,6,7,6,5,4,3]

func add(a: Int, b: Int) -> Int {
    a + b
}

func subtract(a: Int, b: Int) -> Int {
    a - b
}

func multiplyAllByTwo(a: Int, b: Int) -> Int {
    a*2 + b*2
}


func calculation(numbers: [Int], algorithm: (Int, Int) -> Int) -> Int? {
    
    guard var result = numbers.first else { return nil }
    
    for value in numbers.dropFirst() {
        result = algorithm(result, value)
    }
    
    return result
}


calculation(numbers: array, algorithm: add)
calculation(numbers: array, algorithm: subtract)
calculation(numbers: array, algorithm: multiplyAllByTwo)
