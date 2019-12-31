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



var point: (Int, Int) = (1, 2)

switch point {
case (0, 0):
    print("원점")
case (-2...2, -2...2) where point.0 != 1:
    print("원점과 가깝습니다")
default:
    print(point.0, point.1)
}



protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable { }

extension Int: SelfPrintable { }
extension UInt: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger와 SignedInteger를 준수하면서 SelfPrintable을 준수하는 타입 : \(type(of: self))")
    }
}

extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertible, SelfPrintable -> \(type(of: self))")
    }
}

extension SelfPrintable {
    func printSelf() {
        print("그 외 SelfPrintable -> \(type(of: self))")
    }
}

Int(-8).printSelf()
UInt(8).printSelf()
String("yagom").printSelf()
Double(0.8).printSelf()
Person().printSelf()



func doubled<T>(integerValue: T) -> T where T: BinaryInteger {
    return integerValue * 2
}

func doubled2<T: BinaryInteger>(integerValue: T) -> T {
    return integerValue * 2
}

func prints<T, U>(first: T, second: U) where T: CustomStringConvertible, U: CustomStringConvertible {
    print(first)
    print(second)
}

func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence, S1.Element: Equatable, S2: Sequence, S2.Element: Equatable {
    
}

func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence, S1.Element: Equatable, S2: Sequence, S1.Element == S2.Element {
    
}

func compareTwoSequences2<S1: Sequence, S2: Sequence>(a: S1, b: S2) where S1.Element: Equatable, S1.Element == S2.Element {
    
}


protocol Container {
    associatedtype ItemType where ItemType: BinaryInteger
    
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

protocol Container2 where ItemType: BinaryInteger {
    associatedtype ItemType
    
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}



protocol Talkable { }
protocol CallToAll {
    func callToAll()
}

struct Person2: Talkable { }
struct Animal { }

extension Array: CallToAll where Element: Talkable {
    func callToAll() { }
}

let people: [Person2] = []
let cats: [Animal] = []

people.callToAll()
//cats.callToAll()  // error
