
func df(_ bool: Bool) throws {
    print(1)
    
    guard bool else {
        print(4)
        return
    }
    
//    if bool {
//        print(6)
//        return
//    }
    enum MyError: Error {
        case error
    }
    
    
    
    defer {
        print(2)
    }
    
    throw MyError.error
    
    guard false else {
        print(3)
        return
    }
    
    print(5)
    
}

try? df(true)


class A {
    var a: Int = 1
}

let a = A()
a.a = 2

var b = A()
b = a

extension A: Hashable {
    static func == (lhs: A, rhs: A) -> Bool {
        false
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    
    
}

enum En: A {
    case aa = a
    case bb = A(2)
}
