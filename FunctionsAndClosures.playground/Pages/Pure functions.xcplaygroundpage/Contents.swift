import Foundation

var a = 1

//This isn't a pure function because its behaviour depends on the outside of its implementation
func add(_ b: Int) -> Int { // Impure function
    a + b
}

//In this case we can see that after call the function with the same value we recive differents results. A pure function with the same input must return the same output
add(3)
a = 3
add(3)

extension String {
    
    //This function is impure because it depends on self and has state. Pure function does not have state
   mutating func addSuffixImpure(suffix: String) {
        guard !hasSuffix(suffix) else { return }
        append(suffix)
    }
    
    //This is the proper way to add a suffix to a string with a pure function
    func addSuffix(suffix: String) -> String {
        guard !hasSuffix(suffix) else {
            return self
        }
        return appending(suffix)
    }
}

var text1: String = "head"
text1.addSuffixImpure(suffix: ".jpg")
text1

let text2: String = "body"
//text2.addSuffixImpure(suffix: ".pdf") ERROR! is a constant and can not call mutating function becaute they alter its value
text2.addSuffix(suffix: ".jpg")
text2
