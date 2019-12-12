import UIKit
import Swift



/// Int, UInt
print("- Int, UInt ------------------")
var integer: Int = -100
let unsignedInteger: UInt = 50
print("integer : \(integer), unsignedInteger : \(unsignedInteger)")
print("Int max : \(Int.max), min : \(Int.min)")
print("UInt max : \(UInt.max), min : \(UInt.min)")

let largeInteger: Int64 = Int64.max
let smallUnsingedInteger: UInt8 = UInt8.max
print("Int64 max : \(largeInteger), Int8 max : \(smallUnsingedInteger)")
        
//let tooLarge: Int = Int.max + 1 // error
//let cannotBeNegetive: UInt = -5 // error
        
//integer = unsignedInteger // error
integer = Int(unsignedInteger)

let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100
let octalInteger: Int = 0o34
let hexadecimalInteger: Int = 0x1c
print("-------------------------------")
        



/// Bool
print("- Bool ------------------------")
var boolean: Bool = true
boolean.toggle()
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimited)")
print("-------------------------------")




/// Float, Double
print("- Float, Double -----------------")
var floatValue: Float = 1234567890.1
let doubleValue: Double = 1234567890.1
print("float : \(floatValue), double : \(doubleValue)")

floatValue = 123456.1
print(floatValue)

print(Int.random(in: -100...100))
print("-------------------------------")




/// Character
print("- Character -------------------")
let alphabetA: Character = "A"
let commandCharacter: Character = "❤︎"
print(commandCharacter)

let 한글변수이름: Character = "ㄱ"
print("한글 변수 \(한글변수이름)")
print("-------------------------------")




/// String
print("- String ---------------------")
let name: String = "nadarm"

var introduce: String = String()
introduce.append("제 이름은")

introduce = introduce + " " + name + "입니다."
print(introduce)

print("name의 글자 수 : \(name.count)")
print("introduce가 비어있습니까? \(introduce.isEmpty)")

let unicodeScalarValue: String = "\u{2665}"

let hello: String = "Hello"
let nadarm: String = "nadarm"
var greeting: String = hello + " " + nadarm + "!"
print(greeting)

greeting = hello
greeting += " "
greeting += nadarm
greeting += "!"
print(greeting)

var isSameString: Bool = false
isSameString = hello == "Hello"
print(isSameString)

isSameString = hello == "hello"
print(isSameString)

isSameString = nadarm == "nadarm"
print(isSameString)

isSameString = nadarm == hello
print(isSameString)


var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)

hasPrefix = hello.hasPrefix("he")
print(hasPrefix)

hasPrefix = greeting.hasPrefix("Hello ")
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix)

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)

hasSuffix = nadarm.hasSuffix("darm")
print(hasSuffix)

var convertedString: String = ""
convertedString = hello.uppercased()
print(convertedString)

convertedString = hello.lowercased()
print(convertedString)

var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString)

print(greeting.count)

greeting = "안녕하세요"
print(greeting.count)

greeting = """
안녕하세요 저는 나닮입니다
스위프트 잘하고 싶어요!
잘 부탁합니다!
"""
print(greeting)


print("문자열 내부에\n 이런 \"특수문자\"를 \t사용하면 \\이런 놀라운 결과를 볼 수 있습니다.")
print(#"문자열 내부에서 특수문자를 사용하기 싫다면 문자열 앞, 뒤에 #를 붙여주세요"#)
let number: Int = 100
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 이렇게 \#(number) 해보세요"#)
print("-------------------------------")




