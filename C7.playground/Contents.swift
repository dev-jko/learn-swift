import UIKit


func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)


func introduce(name: String) -> String {
    "제 이름은 \(name) 입니다"
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)


func helloWorld() -> String {
    return "Hello, world!"
}

print(helloWorld())


func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "nadarm", yourName: "Jenny"))


func sayHello(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(from: "nadarm", to: "Jenny"))


func sayHello(_ myName: String, _ yourName: String) -> String {
    return "Hello \(yourName), I'm \(myName)"
}

print(sayHello("nadarm", "Jenny"))


func sayHello(to name: String, _ times: Int = 4) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    return result
}

print(sayHello(to: "nadarm", 2))
print(sayHello(to: "nadarm", repeatCount: 3))


//func sayHello(to name: String, _ times: Int = 3) -> String {
//    var result: String = ""
//    for _ in 0..<times {
//        result += "Hello \(name) "
//    }
//    return result
//}

print(sayHello(to: "nadarm"))


func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello, \(friend)! "
    }
    
    result += "I'm \(me)!"
    return result
}

print(sayHelloToFriends(me: "nadarm", friends: "johansson", "jay", "wizplan"))
print(sayHelloToFriends(me: "nadarm"))


var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers)
referenceParameter(&numbers)
print(numbers)


func sayHelloWorld() {
    print("Hello world")
}
sayHelloWorld()

func sayHello(from myName: String, name: String) {
    print("hello \(name), i'm \(myName)")
}
sayHello(from: "nadarm", name: "yagom")

func sayGoodbye() -> Void {
    print("good bye")
}
sayGoodbye()


typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("result : \(mathFunction(a, b))")
}
printMathResult(mathFunction, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> (Int, Int) -> Int {
    return toAdd ? addTwoInts : multiplyTwoInts
}
print(chooseMathFunction(true)(2, 4))


typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionFroMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3
var moveToZero: MoveFunc = functionFroMove(position > 0)
print("원점으로 갑시다")
while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}
print("원점 도착")

func functionForMove2(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight2(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }

    func goLeft2(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft2 : goRight2
}

position = -4
moveToZero = functionForMove2(position > 0)
while position != 0 {
    print(position)
    position = moveToZero(position)
}



func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

//crashAndBurn() // 종료

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false) // 종료


func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("hello")
discardableResultSay("hello")

