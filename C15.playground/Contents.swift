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



var sum: Int = numbers.reduce(0) {
    print("\($0) + \($1)")
    return $0 + $1
}
print(sum)

let subtract: Int = numbers.reduce(0) {
    print("\($0) - \($1)")
    return $0 - $1
}
print(subtract)

let sumFromThree: Int = numbers.reduce(3) { $0 + $1 }
print(sumFromThree)

var subtractFromThree: Int = numbers.reduce(3) { $0 - $1 }
print(subtractFromThree)

let names: [String] = ["Chope", "Jay", "Joker", "Nova"]
let reducedName: String = names.reduce("yagom's friend : ") { $0 + ", " + $1 }
print(reducedName)

sum = numbers.reduce(into: 0) { $0 += $1 }
print(sum)

subtractFromThree = numbers.reduce(into: 3) { $0 -= $1 }
print(subtractFromThree)


var doubledNumbers2: [Int] = [1, 2, 3].reduce(into: [1, 2]) { (result: inout [Int], next: Int) in
    guard next.isMultiple(of: 2) else {
        return
    }
    
    result.append(next * 2)
}
print(doubledNumbers2)

doubledNumbers2 = [1, 2] + [1, 2, 3].filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
print(doubledNumbers2)

var upperCasedNames: [String] = names.reduce(into: []) { $0.append($1.uppercased()) }
print(upperCasedNames)

upperCasedNames = names.map { $0.uppercased() }
print(upperCasedNames)


print(numbers)
var result: Int = numbers.filter { $0.isMultiple(of: 2) }.map { $0 * 3 }.reduce(0) { $0 + $1 }
print(result)

result = 0
for number in numbers {
    guard number.isMultiple(of: 2) else {
        continue
    }
    
    result += number * 3
}
print(result)




