

let array = [1, 3, 5, 6, 7, 6, 5, 6, 5]
let arrayString = ["hi", "apple", "orange", "Niece"]


func index<T: Equatable>(of value: T, list: Array<T>) -> Int? {
    for (index, element) in list.enumerated() {
        if element == value { return index }
    }
    return nil
}

let numberIndex = index(of: 5, list: array)
let stringIndex = index(of: "apple", list: arrayString)
