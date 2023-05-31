


var closuresArray: [() -> ()] = []
let closure = { print("Hello") }
closuresArray.append(closure)
closuresArray.append { print("Goodbye") }

closuresArray.count


class Test {
    
    var x = 1
    
    func completed(completion: () -> () ) {
        completion()
    }
    
    func completedE(completion: @escaping () -> () ) {
        closuresArray.append(completion)
    }
    
    func test() {
        completed { x = 20 }
        
        completedE { print("I'm saved in the array!!") }
        completedE { [weak self] in
            self?.x = 25
            print(self?.x ?? .zero)
        }
    }
}

do {
    let test = Test()
    test.x
    test.test()
    test.x
}

closuresArray.last?()
