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



























