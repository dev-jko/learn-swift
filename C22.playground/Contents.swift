prefix operator **
prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive
print(sqrtMinusFive)


prefix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let five: UInt = 5
let sqrtFive: UInt = **five
print(sqrtFive)


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp: Int = a
    a = b
    b = temp
}

var numberOne: Int = 5
var numberTwo: Int = 10
swapTwoInts(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")


func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp: String = a
    a = b
    b = temp
}

var stringOne: String = "A"
var stringTwo: String = "B"
swapTwoStrings(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")


func swapTwoValues(_ a: inout Any, _ b: inout Any) {
    let temp: Any = a
    a = b
    b = temp
}

var anyOne: Any = 1
var anyTwo: Any = "A"
swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

anyOne = stringOne
anyTwo = stringTwo
swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")
print("\(stringOne), \(stringTwo)")


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp: T = a
    a = b
    b = temp
}

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")
swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")
//swapTwoValues(&numberOne, &stringOne)  // error



struct IntStack {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var integerStack: IntStack = IntStack()
integerStack.push(3)
print(integerStack.items)
integerStack.push(2)
print(integerStack.items)
integerStack.push(3)
print(integerStack.items)
integerStack.push(5)
print(integerStack.items)
integerStack.pop()
print(integerStack.items)
integerStack.pop()
print(integerStack.items)


struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    func printStack() {
        print(self.items)
    }
}

var doubleStack: Stack<Double> = Stack()
doubleStack.push(1)
doubleStack.push(3.0)
print(doubleStack.items)
doubleStack.pop()
print(doubleStack.items)

var stringStack: Stack<String> = Stack()
stringStack.push("A")
print(stringStack.items)
stringStack.push("B")
stringStack.printStack()

var anyStack: Stack<Any> = Stack()
anyStack.push(1)
anyStack.printStack()
anyStack.push("A")
anyStack.printStack()
anyStack.push(2.0)
anyStack.printStack()









