extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(1.isOdd)
print(2.isEven)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)


extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
    
    mutating func multiplySelf(by n: Int) {
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

print(3.multiply(by: 2))
print(4.multiply(by: 2))

number = 3
number.multiplySelf(by: 2)
print(number)
number.multiplySelf(by: 3)
print(number)

Int.isIntTypeInstance(number)
Int.isIntTypeInstance(3)
Int.isIntTypeInstance(3.0)

prefix operator ++

struct Position {
    var x: Int
    var y: Int
}

extension Position {
    static func + (left: Position, right: Position) -> Position {
        return Position(x: left.x + right.x, y: left.y + right.y)
    }
    
    static prefix func - (vector: Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }
    
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
}

extension Position {
    static func == (left: Position, right: Position) -> Bool {
        return (left.x == right.x) && left.y == right.y
    }
    
    static func != (left: Position, right: Position) -> Bool {
        return !(left == right)
    }
}

extension Position {
    static prefix func ++ (position: inout Position) -> Position {
        position.x += 1
        position.y += 1
        return position
    }
}

var myPosition: Position = Position(x: 10, y: 10)
var yourPosition: Position = Position(x: -5, y: -5)

print(myPosition + yourPosition)
print(-myPosition)

myPosition += yourPosition
print(myPosition)

print(myPosition == yourPosition)
print(myPosition != yourPosition)

print(++myPosition)



























