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
print(names.firstIndex(of: "yagom"))
print(names.firstIndex(of: "christal"))
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




/// Dictionary
typealias StringIntDictionary = [String: Int]
var numberForName1: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2: [String: Int] = [String: Int]()
var numberForName3: StringIntDictionary = StringIntDictionary()
var numberForName4: [String: Int] = [:]
var numberForName: [String: Int] = ["nadarm": 100, "chulsoo": 5, "jenny": 300]

print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName["nadarm"])
print(numberForName["chulsoo"])

numberForName["nadarm"] = 150
print(numberForName["nadarm"])

numberForName["max"] = 999
print(numberForName["max"])

print(numberForName.removeValue(forKey: "nadarm"))
print(numberForName.removeValue(forKey: "nadarm"))
print(numberForName["nadarm", default: 0])
print(numberForName["nadarm"])




/// Set
var nameSet1: Set<String> = Set<String>()
var nameSet2: Set<String> = []
var nameSet: Set<String> = ["nadarm", "chulsoo", "younghee", "yagom", "yagom"]

var numbers = [100, 200, 300]
print(type(of:numbers))

print(nameSet.isEmpty)
print(nameSet.count)

nameSet.insert("jenny")
print(nameSet.count)

print(nameSet.remove("chulsoo"))
print(nameSet.remove("john"))

let englishClass: Set<String> = ["john", "chulsoo", "yagom"]
let koreanClass: Set<String> = ["john", "yagom", "nadarm"]

let intersectSet: Set<String> = englishClass.intersection(koreanClass)
print(intersectSet)

let symmetricDiffSet: Set<String> = englishClass.symmetricDifference(koreanClass)
print(symmetricDiffSet)

let unionSet: Set<String> = englishClass.union(koreanClass)
print(unionSet)

let subtractSet: Set<String> = englishClass.subtracting(koreanClass)
print(subtractSet)

print(unionSet.sorted())

print(englishClass.isDisjoint(with: koreanClass))
print(englishClass.isSubset(of: unionSet))
print(unionSet.isSuperset(of: englishClass))
print(unionSet.isSuperset(of: koreanClass))


/// Collection random
var array: [Int] = [0, 1, 2, 3, 4]
var set: Set<Int> = [0, 1, 2, 3, 4]
var dictionary: [String: Int] = ["a": 1, "b": 2, "c": 3]
var string: String = "String"

print(array.randomElement())
print(array.shuffled())
print(array)
array.shuffle()
print(array)

print(set.shuffled())
print(dictionary.shuffled())
print(string.shuffled())
