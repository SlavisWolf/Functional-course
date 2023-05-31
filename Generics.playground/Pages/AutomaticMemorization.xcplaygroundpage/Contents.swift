


var fibonacciMemo = Dictionary<Int, Double> ()

func fibonacciMM(n:Int) -> Double {
    if let result = fibonacciMemo [n] {
        return result
    }
    let result = n < 2 ? Double(n) : fibonacciMM(n: n - 1) + fibonacciMM(n: n - 2)
    fibonacciMemo [n] = result
    return result
}
let phimm = fibonacciMM(n: 45) / fibonacciMM(n: 44)


func memorize<T:Hashable,U>(body: @escaping ((T) -> U, T) -> U ) -> (T) -> U {
    var memorization = [T:U]()
    var result: ((T) -> U)!
     result = { key in
        if let finded = memorization[key] {
            return finded
        }
        let r = body(result, key)
        memorization[key] = r
        return r
    }
    
    return result
}


let fibonacciAM = memorize { fibonacci, number in
    number < 2 ? Double(number) : fibonacci(n: number - 1) + fibonacci(n: number - 2)
}

print(fibonacciAM(55) )

let factorial = memorize { factorial, x in
    x == 0 ? 1 : x * factorial(x - 1)
}

print(factorial(10) )
