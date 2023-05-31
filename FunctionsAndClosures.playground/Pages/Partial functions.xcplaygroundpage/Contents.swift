


func moreLess2(number: Int, moreLess: Bool) -> Int {
    
    func increment(_ num: Int) -> Int {
        num + 2
    }
    
    func decrease(_ num: Int) -> Int {
        num - 2
    }
    
    return moreLess ? increment(number) : decrease(number)
}

func countTwo(moreLess: Bool) -> (Int) -> Int {
    
    func increment(_ num: Int) -> Int {
        num + 2
    }
    
    func decrease(_ num: Int) -> Int {
        num - 2
    }
    
    return !moreLess ? increment : decrease
}


var value = 16
let count = countTwo(moreLess: value > .zero)

while value != .zero {
    value = count(value)
    print(value)
}
