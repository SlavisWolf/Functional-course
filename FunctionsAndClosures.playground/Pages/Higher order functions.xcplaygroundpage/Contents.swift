import UIKit

//This functions are coded in C, for that reason they are faster than any funcion we can do.

//MARK: Map: This function transforms the content of an array.

let numbersArray =  [4,6,3,5,7,8,7,5,6,4,5,6,7,6,5,4,3]
let picsArray = ["braveheart", "deadpool", "hollywood", "legend", "purge", "rabbit"]


let newArrayEqual = numbersArray.map({ $0 })
let doubleArray = numbersArray.map( {Double($0) } )
let numberArrayPlusOne = numbersArray.map({ $0 + 1 } )
let moneyArray = numbersArray.map( { "\($0)€" })

let imagesArray = picsArray.map({ UIImage(imageLiteralResourceName: "\($0).jpeg") } )


//MARK: Filter: This function returns another array only with the elements that return true in the given closure.


let filteredArray = numbersArray.filter({ $0 <= 5 } )
let highImages = imagesArray.filter({ $0.size.height >= 1000 } )


//MARK: Reduce

let reduce1 =  numbersArray.reduce(0) { $0 + $1 } // This starts to add the first parameter with the first array's element after that it will do the same with the result and the second element and it continue doing the same with the rest of the elements.
let reduce2 = numbersArray.reduce(1, *) // Same as before but multiplying instead of adding.

let comma = numbersArray.reduce("") { "\($0), \($1)" }
comma.dropFirst()


let coma2 = numbersArray.reduce(into: "") { $0 += "\($1)," }
coma2.dropLast()

//MARK: AllSafisfy returns true if all elements return true with the given closure, if one of them return false this function return false too

let lesserThanTen = numbersArray.allSatisfy({ $0 < 10 } )
let graterThanFour = numbersArray.allSatisfy { $0 > 4 }

//MARK: CompactMap: Same than map but it doesn't add the nil values to the final result


let falsePicsArray = ["Impostor1", "Impostor2", "Impostor3"] + picsArray
let optionalImagesArray = falsePicsArray.map({ UIImage(named: "\($0).jpeg") } )
let compactImagesArray = falsePicsArray.compactMap({ UIImage(named: "\($0).jpeg") } )


//MARK: Contains: Return true is at least one element return true in the given closure

let sizeSixHundred = imagesArray.contains { image in
    let with = image.size.width
    return with >= 600 && with < 700
}

let lessThanHundred = imagesArray.contains { $0.size.width < 100 }

//MARK: Drop and Prefix

numbersArray.drop { $0 < 7 } //It is skipping elements while the given closure return true, when it reaches the first element that return false it return that element and those that have not been analized.

numbersArray.prefix { $0 < 8 } // It is adding the elements to the new array's copy and when the the closure returns false it skips that element and the remaining.

//MARK: First and last: Return the first/last element as an optional value that returns true with the given closure

if let firstA = picsArray.first(where: { $0.contains(where: { $0 == "p" } ) } ) {
    print(firstA)
}

if let lastA = picsArray.last(where: { $0.contains(where: { $0 == "p" } ) } ) {
    print(lastA)
}

// In this case the function returns the position in the array
if let firstAIndex = picsArray.firstIndex(where: { $0.contains(where: { $0 == "l" } ) } ) {
    print("The value in the position \(firstAIndex) is \(picsArray[firstAIndex])")
}

if let lastAIndex = picsArray.lastIndex(where: { $0.contains(where: { $0 == "l" } ) } ) {
    print("The value in the position \(lastAIndex) is \(picsArray[lastAIndex])")
}

//MARK: FlatMap

let twoDimensionalArray = [[1,4,5,7], [8,7,6,4,5], [4,5,4], [3,2,4,5,6,7] ]

moneyArray
let twoDimensionalMoneyArrayWrong = twoDimensionalArray.map { "\($0)€" }

let arrayFlat = twoDimensionalArray.flatMap { $0 } // This convert the array in an one-dimensional array
let arrayFlatAddingOne = twoDimensionalArray.flatMap { $0.map { $0 + 1} }


//MARK: ForEach is the same behaviour than for in but like the others higher order functions, forEach is more efficient because its writed in C

for num in numbersArray {
    print(num)
}

numbersArray.forEach { print($0) } // better

for num in numbersArray where num % 2 == 0 {
    print(num)
}

numbersArray.forEach { // This is faster than the previous
    if $0 % 2 == 0 {
        print($0)
    }
}

for value in numbersArray.enumerated() {
    print("Index: \(value.offset), value: \(value.element)")
}

numbersArray.enumerated().forEach {
    print("Index: \($0.offset), value: \($0.element)")
}


//MARK: Sorted
//No highter order function because they modify the state of the origial array
var numbersUnordered = [2, 1, 7, 4, 3, 1, 5]
numbersUnordered.sort()
let newArray = numbersArray.sorted()
numbersUnordered.reverse()
let newArrayReversed = newArray.reversed()

// These are the greatest, they offers you more options and are faster because they are writed in C and they do not modify the state of the original array

// < and > like +, *, / or % are functions and we can pass it as parameters
numbersUnordered.sort(by: >) // Descendent
numbersUnordered.sort(by: <) // Ascendent

let imagesArrayWithAscendent = imagesArray.sorted { $0.size.width < $1.size.width }
let imagesArrayHeightDescendent = imagesArray.sorted { $0.size.height > $1.size.height }

//MARK: RemoveAll

var imagesArrayCopy = imagesArray
imagesArrayCopy.removeAll(keepingCapacity: true)
imagesArrayCopy = imagesArray
imagesArrayCopy.removeAll { $0.size.height > 900 }


