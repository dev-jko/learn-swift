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






















