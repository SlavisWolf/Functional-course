


// Very ineficient way because the number of executions is very high
func fibonacci(pos: Int) -> Double {
    pos < 2 ? Double(pos) : fibonacci(pos: pos - 1) + fibonacci(pos: pos - 2)
}
//109 executions =0
fibonacci(pos: 9)


var fibonacciCache: [Int: Double] = [:]

func fibonacciMM(pos: Int) -> Double {
    
    if let result = fibonacciCache[pos] {
        return result
    }
    let result =  pos < 2 ? Double(pos) : fibonacciMM(pos: pos - 1) + fibonacciMM(pos: pos - 2)
    fibonacciCache[pos] = result
    return result
}

// 21 executions with cache xD there is no difference
fibonacciMM(pos: 20)
