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



/// enum
enum School1 {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

enum School2 {
    case primary, elementary, middle, high, college, university, graduate
}

var highestEducationLevel1: School1 = School1.university
var highestEducationLevel2: School1 = .university
highestEducationLevel1 = .graduate

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel: School = School.university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업 입니다.")


enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금"
}

let today: WeekDays = .fri
print("오늘은 \(today.rawValue)요일 입니다.")


enum School3: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle
    case high
}

let highest: School3 = .high
print("primary : \(School3.primary.rawValue), high : \(highest.rawValue)")

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")

let primary = School(rawValue: "유치원")
let graduate = School(rawValue: "석박사")
print(primary)
print(graduate)

let one = Numbers(rawValue: 1)
let three = Numbers(rawValue: 3)


enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice


enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin, original
}

enum MainDish2 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: String)
    case rice
}

var dinner2: MainDish2 = MainDish2.pasta(taste: PastaTaste.cream)
dinner2 = .pizza(dough: .cheeseCrust, topping: "불고기")


enum School4: CaseIterable {
    case primary
    case elementary
    case middle
    case high
}

let allCases: [School4] = School4.allCases
print(allCases)

enum School5: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle
}

let allCases2: [School5] = School5.allCases
print(allCases2)


enum School6: String, CaseIterable {
    case pri = "유치원"
    case ele = "초등"
    @available(iOS, obsoleted: 12.0)
    case mid = "중"
    
    static var allCases: [School6] {
        let all: [School6] = [
        .pri,
        .ele
        ]
        #if os(iOS)
        return all
        #else
        return all + [.mid]
        #endif
    }
}

let allCases3: [School6] = School6.allCases
print(allCases3)


enum Taste: CaseIterable {
    case cream, tomato
}
enum Dough: CaseIterable {
    case thin, original
}
enum Topping: CaseIterable {
    case cheese, bacon
}
enum Main: CaseIterable {
    case pasta(taste: Taste)
    case pizza(dough: Dough, topping: Topping)
    case chiken(withSauce: Bool)
    case rice
    
    static var allCases: [Main] {
        return Taste.allCases.map(Main.pasta)
            + Dough.allCases.reduce([]) { (result, dough) -> [Main] in
                result + Topping.allCases.map { (topping) -> Main in
                    Main.pizza(dough: dough, topping: topping)
                }
        }
            + [true, false].map(Main.chiken)
            + [Main.rice]
    }
}

print(Main.allCases.count)
print(Main.allCases)


enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addtion(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print(result)








