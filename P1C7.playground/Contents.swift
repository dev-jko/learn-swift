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
