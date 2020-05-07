func addTwo(a: Int, b: Int) -> Int {
    return a + b
}

let add5: (Int) -> Int = curry(f: addTwo, a: 5)

func add(_ x: Int) -> (Int) -> Int {
    return curry(f: addTwo, a: x)
}


func curry<T, U>(f: @escaping (T, U) -> T, a: T) -> (U) -> T {
    return { x in f(a, x) }
}

func go<T>(start: T, _ fs: ((T) -> T)...) -> Any {
    return go(start: start, fs)
}

func go<T>(start: T, _ fs: [(T) -> T]) -> Any {
    return fs.reduce(start, { a, f in f(a) })
}

func map<T>(_ seq: [T], f: (T) -> T) -> [T] {
    return seq.map(f)
}

func log<T>(_ x: T) {
    print(x)
}


import Foundation

typealias Position = (x: Float, y: Float)
typealias Distance = Float
typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return { point in
        sqrt(point.x * point.x + point.y * point.y) <= radius
    }
}

func circle2(radius: Distance, center: Position) -> Region {
    return { point in
        let shiftedPoint = Position(x: point.x + center.x, y: point.y + center.y)
        return sqrt(shiftedPoint.x * shiftedPoint.x + shiftedPoint.y * shiftedPoint.y) <= radius
    }
}

func shift(offset: Position, region: @escaping Region) -> Region {
    return { point in
        let shiftedPosition = Position(x: point.x - offset.x, y: point.y - offset.y)
        return region(shiftedPosition)
    }
}

shift(offset: Position(2, 2), region: circle(radius: 10))(Position(5, 5))
let checkFn = shift(offset: Position(2, 2), region: circle(radius: 10))
checkFn(Position(5, 5))

func invert(region: @escaping Region) -> Region {
    return { point in
        !region(point)
    }
}

func intersection(region1: @escaping Region, region2: @escaping Region) -> Region {
    return { point in
        region1(point) && region2(point)
    }
}

func union(region1: @escaping Region, region2: @escaping Region) -> Region {
    return { point in
        region1(point) || region2(point)
    }
}

func difference(region: @escaping Region, minusRegion: @escaping Region) -> Region {
    return intersection(region1: region, region2: invert(region: minusRegion))
}

let minimumDistance: Distance = 2.0
func inRange(ownPosition: Position, target: Position, friendly: Position, range: Distance) -> Bool {
    let rangeRegion = difference(region: circle(radius: range), minusRegion: circle(radius: minimumDistance))
    let targetRegion = shift(offset: ownPosition, region: rangeRegion)
    let friendlyRegion = shift(offset: friendly, region: circle(radius: minimumDistance))
    let resultRegion = difference(region: targetRegion, minusRegion: friendlyRegion)
    
    return resultRegion(target)
}


func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in { b in f(a, b) } }
}

func map2<T>(f: @escaping (T) -> T, seq: [T]) -> [T] {
    return seq.map(f)
}

func map<T>(_ f: @escaping (T) -> T) -> ([T]) -> [T] {
    return curry(map2)(f)
}

let mapadd5 = map(add5)
mapadd5([1,2,3])

let t = go(start: [1, 2, 3],
   map{ $0 + 3 }
)
print("before")
print(t)

func add3(_ x: Int) -> (_ y: Int) -> Int {
    return { y in x + y }
}

add3(2)(4)

func sendMsg(_ from: String) -> (_ to: String) -> Void {
    return { to in print("from \(from) to \(to)") }
}

let jkoMsg = sendMsg("jko")
jkoMsg("phone")

func curry<A, B, C, D>(f: @escaping (A, B, C) -> D) -> (_ a: A) -> (_ b: B) -> (_ c: C) -> D {
    return { a in { b in { c in f(a, b, c) } } }
}

let testFn = curry{ (a: Int, b: Int, c: Int) in a + b + c }
testFn(1)(2)(3)
