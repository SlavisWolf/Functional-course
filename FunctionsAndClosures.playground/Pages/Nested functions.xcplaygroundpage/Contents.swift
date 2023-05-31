

func moreLess2(number: Int, moreLess: Bool) -> Int {
    
    func increment(_ num: Int) -> Int {
        num + 2
    }
    
    func decrease(_ num: Int) -> Int {
        num - 2
    }
    
    return moreLess ? increment(number) : decrease(number)
}


moreLess2(number: 4, moreLess: true)
moreLess2(number: 4, moreLess: false)
