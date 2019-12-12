import UIKit
import Swift


/// 타입 추론
var name = "kjd"
// name = 100 // error



/// type alias
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100
var year: YourInt = 2080

year = age

let month: Int = 7
let percentage: MyDouble = 99.9




/// tuple
var person: (String, Int, Double) = ("nadarm", 100, 182.5)
print("이름 : \(person.0), 나이 : \(person.1), 신장 : \(person.2)")

person.1 = 99
person.2 = 200.5
print("이름 : \(person.0), 나이 : \(person.1), 신장 : \(person.2)")

var person2: (name: String, age: Int, height: Double) = ("nadarm", 100, 182.5)
print("이름 : \(person2.name), 나이 : \(person2.age), 신장 : \(person2.height)")

typealias PersonTuple = (name: String, age: Int, height: Double)
let nadarm: PersonTuple = ("nadarm", 100, 199)
let eric: PersonTuple = ("eric", 101, 200)




/// Collection
/// Array
var names: Array<String> = ["nadarm", "chulsoo", "younghee", "yagom", "nadarm"]
var names2: [String] = ["nadarm", "chulsoo", "younghee", "yagom", "nadarm"]

var emptyArray: [Any] = [Any]()
var emptyArray2: [Any] = Array<Any>()

var emptyArray3: [Any] = []
print(emptyArray.isEmpty)
print(names.count)

print(names[2])
names[2] = "jenny"
print(names[2])
// print(names[5])  // error
// names[5] = "elsa" // error

names.append("elsa")
names.append(contentsOf: ["john", "max"])
names.insert("happy", at: 2)
names.insert(contentsOf: ["jinhee", "minsoo"], at: 5)

print(names[5])
print(names.index(of: "yagom"))
print(names.index(of: "christal"))
print(names.first)
print(names.last)

let firstItem: String = names.removeFirst()
let lastItem: String = names.removeLast()
let indexZeroItem: String = names.remove(at: 0)

print(firstItem)
print(lastItem)
print(indexZeroItem)
print(names[1...3])

names[1...3] = ["A", "B", "C"]
print(names)
