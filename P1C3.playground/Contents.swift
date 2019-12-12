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
var floatValue: Float = 1234567890.1
let doubleValue: Double = 1234567890.1
print("float : \(floatValue), double : \(doubleValue)")

floatValue = 123456.1
print(floatValue)

print(Int.random(in: -100...100))
print("-------------------------------")





