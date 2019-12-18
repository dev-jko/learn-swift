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


