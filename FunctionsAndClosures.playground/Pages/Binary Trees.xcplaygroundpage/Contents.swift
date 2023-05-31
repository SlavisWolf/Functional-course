

enum Tree<Int> {
    case empty
    indirect case node(Tree<Int>, Int, Tree<Int>)
}

let n4: Tree = .node(.empty, 4, .empty)
let n7: Tree = .node(.empty, 7, .empty)
let n13: Tree = .node(.empty, 13, .empty)


let n1: Tree = .node(.empty, 1, .empty)
let n6: Tree = .node(n4, 6, n7)
let n14: Tree = .node(n13, 14, .empty)


let n3: Tree = .node(n1, 3, n6)
let n10: Tree = .node(.empty, 10, n14)


let root: Tree = .node(n3, 8 , n10)

//Unordered binary tree
func contain(initial: Tree<Int>, value: Int) -> Bool {
    
    guard case let .node(left, number, right) = initial else { return false }
    
    print("Searching in node: \(number)")
    return value == number || contain(initial: left, value: value) || contain(initial: right, value: value)
}

// Ordered

func containOrdered(initial: Tree<Int>, value: Int) -> Bool {
    
    guard case let .node(left, number, right) = initial else { return false }
    
    print("Searching in node: \(number)")
    if value == number {
        return true
    } else if value < number {
        return containOrdered(initial: left, value: value)
    } else if value > number {
        return containOrdered(initial: right, value: value)
    }
    return false
}

print("searching 14")
contain(initial: root, value: 14)
print("searching 3")
contain(initial: root, value: 3)
print("searching 12")
contain(initial: root, value: 12)


print("searching 14 ordered")
containOrdered(initial: root, value: 14)
print("searching 3 ordered")
containOrdered(initial: root, value: 3)
print("searching 12 ordered")
containOrdered(initial: root, value: 12)
