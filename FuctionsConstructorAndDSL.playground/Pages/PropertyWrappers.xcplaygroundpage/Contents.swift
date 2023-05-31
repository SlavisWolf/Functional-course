

struct FIFOStack<T> {
    
    private var elements: [T] = []
    
    mutating func addValue(_ newValue: T) {
        elements.insert(newValue, at: 0)
    }
    
    mutating func extractValue() -> T {
        elements.removeLast()
    }
}


var fifo1 = FIFOStack<Int>()

fifo1.addValue(5)
fifo1.addValue(8)
fifo1.addValue(1)
print(fifo1.extractValue() )

@propertyWrapper
class FIFOStackClass<T> {
    
    private var storage: [T] = []
    
    var wrappedValue: T {
        get {
            storage.removeLast()
        }
        set {
            storage.insert(newValue, at: .zero)
        }
    }
}

struct FIFOApp {
    @FIFOStackClass private var stack: Int
    @FIFOStackClass private var stackS: String
    
    func addValueInt(_ newValue: Int) {
        stack = newValue
    }
    
    func extractInt() -> Int {
        stack
    }
}

let fifo2 = FIFOApp()

fifo2.addValueInt(5)
fifo2.addValueInt(8)
fifo2.addValueInt(1)
print(fifo2.extractInt() )
