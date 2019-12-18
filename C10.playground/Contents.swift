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






