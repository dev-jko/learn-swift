//import UIKit
import Foundation

func add(_ a: Int?) -> (_ b: Int?) -> Int? {
    return { b in
        guard a != nil && b != nil else {
            print("add integer err")
            return nil
        }
        return a! + b!
    }
}

func sub(_ a: Int?) -> (_ b: Int?) -> Int? {
    return { b in
        guard a != nil && b != nil else {
            print("sub integer err")
            return nil
        }
        return a! - b!
    }
}

func mul(_ a: Int?) -> (_ b: Int?) -> Int? {
    return { b in
        guard a != nil && b != nil else {
            print("mul integer err")
            return nil
        }
        return a! * b!
    }
}

func div(_ a: Int?) -> (_ b: Int?) -> Int? {
    return { b in
        guard a != nil && b != nil else {
            print("div integer err")
            return nil
        }
        guard b != 0 else {
            print("div 0 err")
            return nil
        }
        return a! / b!
    }
}

func setOperator(_ c: String?) -> (Int?) -> (Int?) -> Int? {
    switch c {
    case "+":
        return add(_:)
    case "-":
        return sub(_:)
    case "*":
        return mul(_:)
    case "/":
        return div(_:)
    default:
        print("operator err")
        return { a in { b in nil } }
    }
}

func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (_ a: A) -> (_ b: B) -> C {
    return { a in { b in f(a, b) } }
}

func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (_ a: A) -> (_ b: B) -> (_ c: C) -> D {
    return { a in { b in { c in f(a, b, c) } } }
}

func convert(_ str: String?) -> Int? {
    guard str != nil else {
        print("str to int err")
        return nil
    }
    return Int(str!)
}

func calculate(_ oper: String?, _ num1: String?, _ num2: String?) -> Int? {
    return setOperator(oper)(convert(num1))(convert(num2))
}

func input(_ strs: [String]?) -> Int? {
    guard strs != nil && strs!.count >= 3 else {
        print("input err")
        return nil
    }
    return calculate(strs![0], strs![1], strs![2])
}

extension Array where Element == String {
    func calculate() -> Int? {
        return input(self)
    }
}

print(curry(calculate)("+")("1")("2"))

print(input("+ 1 2".components(separatedBy: " ")))
print("+ 1 2".components(separatedBy: " ").calculate())


print(input(readLine()?.components(separatedBy: " ")))
