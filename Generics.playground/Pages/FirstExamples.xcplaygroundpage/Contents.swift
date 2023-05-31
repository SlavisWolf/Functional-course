

func showSomething(datum: Int) {
    print(datum)
}


func showSomething(datum: Double) {
    print(datum)
}

func showSomething(datum: String) {
    print(datum)
}

showSomething(datum: "datum")
showSomething(datum: 26)
showSomething(datum: 26.5)

func showGeneric<T>(datum: T) {
    print("\(datum) of type: \(String(describing: T.self))")
}


showGeneric(datum: "datum")
showGeneric(datum: 26)
showGeneric(datum: 26.5)
