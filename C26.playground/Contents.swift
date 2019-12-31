let tuples: [(Int, Int)] = [(1, 2), (1, -1), (1, 0), (0, 2)]

for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y:
        print("x == y")
    case let (x, y) where x == -y:
        print("x == -y")
    case let (x, y) where x > y:
        print("x > y")
    case (1, _):
        print("x == 1")
    case (_, 2):
        print("y == 2")
    default:
        print("\(tuple.0), \(tuple.1)")
    }
}

var repeatCount: Int = 0

for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y && repeatCount > 2:
        print("x == y")
    case let (x, y) where repeatCount < 2:
        print("\(x), \(y)")
    default:
        print("Nothing")
    }
    
    repeatCount += 1
}

let firstValue: Int = 50
let secondValue: Int = 30

switch firstValue + secondValue {
case let total where total > 100:
    print("total > 100")
case let total where total < 0:
    print("wrong value")
case let total:
    print(total)
}



let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}



let anyValue: Any = "ABC"

switch anyValue {
case let value where value is Int:
    print("Int")
case let value where value is String:
    print("String")
case let value where value is Double:
    print("Double")
default:
    print("Unknown")
}

var things: [Any] = []
things.append(0)
things.append(0.0)
things.append(42)
things.append("Hello")
things.append((1.0, 3))
things.append({ (name: String) -> String in "Hello \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("int \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double \(someDouble)")
    case let someString as String:
        print("string \(someString)")
    default:
        print("something else")
    }
}

