let numbers: [Int] = [0, 1, 2, 3, 4, 5]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)

doubledNumbers = numbers.map { $0 * 2 }
strings = numbers.map { "\($0)" }
print(doubledNumbers)
print(strings)


let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [1, 3, 5, 7, 9]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumber: [Int] = evenNumbers.map(multiplyTwo)
print(doubledNumbers)

let doubledOddNumber: [Int] = oddNumbers.map(multiplyTwo)
print(doubledOddNumber)


let dictionary: [String: String] = ["a": "A", "b": "B"]

var keys: [String] = dictionary.map { $0.0 }
let values: [String] = dictionary.map { $0.1 }
print(keys)
print(values)


var numberSet: Set<Int> = [1, 2, 3, 4, 5, 6]
let resultSet = numberSet.map { $0 * 2 }
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map { $0 * 2 }
print(resultInt)


let range: CountableClosedRange = 0...3
let resultRange: [Int] = range.map { $0 * 2 }
print(resultRange)



let evenNumbers2: [Int] = numbers.filter { $0 % 2 == 0 }
let oddNumbers2: [Int] = numbers.filter { $0 % 2 == 1 }
print(evenNumbers2)
print(oddNumbers2)

let mappedNumbers: [Int] = numbers.map { $0 + 3 }
let evenNumbers3: [Int] = mappedNumbers.filter { $0 % 2 == 0 }
let evenNumbers4: [Int] = numbers.map { $0 + 3 }.filter { $0 % 2 == 0 }
print(evenNumbers3)
print(evenNumbers4)
