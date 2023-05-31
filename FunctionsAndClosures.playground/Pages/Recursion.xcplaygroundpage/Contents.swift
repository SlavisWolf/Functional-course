

func factorial(n: Int) -> Int {
    n == 0 || n == 1 ? 1 : n * factorial(n: n - 1)
}
//Inefficient way
factorial(n: 5)


func factorialTail(n: Int, currentFactorial: Int = 1) -> Int {
    n == 0 ? currentFactorial : factorialTail(n: n - 1, currentFactorial: n * currentFactorial)
}
