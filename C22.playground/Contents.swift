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
