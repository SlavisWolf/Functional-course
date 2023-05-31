

func showSomething(datum: Int) {
    print(datum)
}


func showSomething(datum: String) {
    print(datum)
}

func showSomething(datum: Double) {
    print(datum)
}


showSomething(datum: 5)
showSomething(datum: 10.32)
showSomething(datum: "No generics for now ;(")

// Version with generics =D


func showSomethingWithGenerics<T>(datum: T) {
    print(datum)
}


showSomethingWithGenerics(datum: "Jonathan")
showSomethingWithGenerics(datum: 4)
