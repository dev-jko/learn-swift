import UIKit


/// Operator
let number: Double = 5.0
var result: Double = number.truncatingRemainder(dividingBy: 1.5)
print(result)
result = 12.truncatingRemainder(dividingBy: 2.5)
print(result)

var result2: Int = 5 / 3
print(result2)
result2 = 10 / 3
print(result2)


var valueA: Int = 3
var valueB: Int = 5
let valueC: Int = 5

print(valueA == valueB)
print(valueB == valueC)

class SomeClass {}
let referenceA: SomeClass = SomeClass()
let referenceB: SomeClass = SomeClass()
let referenceC: SomeClass = referenceA

print(referenceA === referenceB)
print(referenceA === referenceC)


print(valueA > valueB ? valueA : valueB)

valueA = 0
valueB = -3
print(valueA > valueB ? valueA : valueB)

var stringA: String = ""
var stringB: String = "String"
print(stringA.isEmpty ? 1.0 : 0.0)
print(stringB.isEmpty ? 1.0 : 0.0)


for i in 1...5 {
    print(i)
}
for i in 1..<5 {
    print(i)
}
//for i in 1... {  // 1부터 무한대 -> 무한 루프
//    print(i)
//}
1...
...1
..<2


print(!true)
print(true && false)
print(true || false)

print(~1)
print(1 & 0)
print(1 | 0)
print(1 ^ 1)
print(1 >> 1)
print(1 << 1)


var a = 1
a += 1
print(a)
a -= 1
print(a)
a *= 2
print(a)
a /= 2
print(a)
a %= 2
print(a)
a <<= 2
print(a)
a >>= 1
print(a)
a &= 3
print(a)
a |= 1
print(a)
a ^= 2
print(a)


var unsignedInteger: UInt8 = 0
//print(unsignedInteger - 1)  // error
print(unsignedInteger &- 1)

unsignedInteger = UInt8.max
//print(unsignedInteger + 1)  // error
print(unsignedInteger &+ 1)


var n1: Int? = nil
print(n1)
print(n1 ?? 1)
n1 = 1
print(n1)
print(n1 ?? 2)
print(-n1!)
print(n1!)

let valueInt: Int = n1 != nil ? n1! : 0
let valueInt2: Int = n1 ?? 0


let intValue: Int = 1
print(intValue << 3 + 5)
print(1 * 3 + 5)



prefix operator **
prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
print(**minusFive)

prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

print(!"nadarm")
print(!"")

prefix func ** (value: String) -> String {
    return value + " " + value
}

print(**"nadarm")


postfix operator **
postfix func ** (value: Int) -> Int {
    return value + 10
}

print(5**)

print(**5**)






