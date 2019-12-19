import UIKit



struct CoordinatePoint {
    var x: Int
    var y: Int
}

let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    var point: CoordinatePoint
    let name: String
    
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let yagomPosition: Position = Position(name: "yagom", currentPoint: yagomPoint)



struct CoordinatePoint2 {
    var x: Int = 0
    var y: Int = 0
}

let yagomPoint2: CoordinatePoint2 = CoordinatePoint2()
let wizplanPoint: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 2)

class Position2 {
    var point: CoordinatePoint2 = CoordinatePoint2()
    var name: String = "Unknown"
}

let yagomPosition2: Position2 = Position2()
yagomPosition2.point = yagomPoint2
yagomPosition2.name = "yagom"


class Position3 {
    var point: CoordinatePoint?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let nadarmPosition: Position3 = Position3(name: "nadarm")
nadarmPosition.point = CoordinatePoint(x: 3, y: 2)


class Position4 {
    lazy var point: CoordinatePoint2 = CoordinatePoint2()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let nadarmPosition2: Position4 = Position4(name: "nadarm")
print(nadarmPosition2.point)



struct Coordinate {
    var x: Int
    var y: Int
    
    func oppositePoint() -> Self {
        return Coordinate(x: -x, y: -y)
    }
    
    mutating func setOppositePoint(_ opposite: Coordinate) {
        x = -opposite.x
        y = -opposite.y
    }
}

var nadamPosition: Coordinate = Coordinate(x: 10, y: 20)
print(nadamPosition)
print(nadamPosition.oppositePoint())
nadamPosition.setOppositePoint(Coordinate(x: 15, y: 10))
print(nadamPosition)

struct Coordinate2 {
    var x: Int
    var y: Int
    
    var oppositePoint: Coordinate2 {
        get {
            return Coordinate2(x: -x, y: -y)
        }
        
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var nadamPosition2: Coordinate2 = Coordinate2(x: 10, y: 20)
print(nadamPosition2)
print(nadamPosition2.oppositePoint)
nadamPosition2.oppositePoint = Coordinate2(x: 1, y: 2)
print(nadamPosition2)



class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double {
        get {
            Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

let myAccount: Account = Account()
myAccount.credit = 1000


class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러으로 변경되었습니다.")
        }
    }
}

let yourAccount: ForeignAccount = ForeignAccount()
yourAccount.credit = 1000
yourAccount.dollarValue = 2



var wonInPocket: Int = 2000 {
    willSet {
        print("pocket money will set \(wonInPocket) -> \(newValue)")
    }
    
    didSet {
        print("pocket money did set \(oldValue) -> \(wonInPocket)")
    }
}

var dollarInPocket: Double {
    get {
        Double(wonInPocket) / 1000.0
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("change \(newValue)dollar")
    }
}

dollarInPocket = 3.5



class AClass {
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0 {
        didSet {
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    static var typeComputedProperty: Int {
        get {
            typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
let classInstance: AClass = AClass()
classInstance.instanceProperty = 100
print(AClass.typeProperty)
print(AClass.typeComputedProperty)


class Account2 {
    static let dollarExchangeRate: Double = 1000.0
    
    var credit: Int = 0
    
    var dollar: Double {
        get {
            Double(credit) / Self.dollarExchangeRate
        }
        
        set {
            credit = Int(newValue * Account2.dollarExchangeRate)
            print("credit change -> \(newValue)")
        }
    }
}


class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))
print(type(of: \Stuff.name))

let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)

let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerKeyPath = \Stuff.owner
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerNameKeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
print(iMac[keyPath: stuffNameKeyPath])



class LevelClass {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
    
    func reset() {
        print("Reset!")
//        self = LevelClass()  // error
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 4)

struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
//        level = 0
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 3)

enum OnOffSwitch {
    case on, off
    
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = .off
toggle.nextState()
print(toggle)



class AClass2 {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass2 {
    /*  error static type method can't override
    override static func staticTypeMethod() {
    }
    */
    
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass2.staticTypeMethod()
AClass2.classTypeMethod()
BClass.staticTypeMethod()
BClass.classTypeMethod()


struct SystemVolume {
    static var volume: Int = 5
    
    static func mute() {
        self.volume = 0  // static func에서 self == Self == SystemVolume
//        Self.volume = 0  // 같은 표현
//        SystemVolume.volume = 0 // 같은 표현
    }
}


class Navigation {
    var volume: Int = 5
    
    func guideWay() {
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10
let myNavi: Navigation = Navigation()
myNavi.guideWay()
print(SystemVolume.volume)
myNavi.finishGuideWay()
print(SystemVolume.volume)

