abs(-100)
abs(100)

let int8: Int8 = 5
let int64: Int64 = numericCast(int8)

let zeros = repeatElement(0, count: 5)
for x in zeros {
    print(x)
}

var valueA: Int = 10
var valueB: Int = 10

assert(valueA == valueB, "valueA != valueB")
debugPrint(valueA, valueB, separator: ", ", terminator: "")
debugPrint(valueA, valueB)

dump(valueA)

max(1, 3)
max(1, 2, 3, 4, 5)
min(1, 3)
min(1, 2, 3, 4, 5)

precondition(valueA == valueB, "valueA != valueB")

print(valueA, valueB)

valueA = 100
valueB = 200

swap(&valueA, &valueB)
print(valueA, valueB)

let words = ["1", "2", "3", "4"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word), \(number)")
}

let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))

print(zipped)
