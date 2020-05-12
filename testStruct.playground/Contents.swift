import Cocoa


struct St: CustomStringConvertible {
    var a: Int
    
    init(_ a: Int) {
        self.a = a
    }
    
    var description: String {
        return "\(self.a)"
    }
}

class Cl: CustomStringConvertible {
    let a: Int
    
    init(_ a: Int) {
        self.a = a
    }
    
    var description: String {
        return "\(self.a)"
    }
}

func returnTest(_ st: St, _ cl: Cl, _ n: Int) -> (St, Cl) {
    let newSt = St(st.a + n)
    let newCl = Cl(cl.a + n)
    return (newSt, newCl)
}

func returnTest2(_ st: St, _ cl: Cl) -> (Int) -> (St, Cl) {
    let newSt = St(st.a + 1)
    let newCl = Cl(cl.a + 1)
    return { n in
        return returnTest(newSt, newCl, n)
    }
}

let st = St(1)
let cl = Cl(1)
print(st, cl)

let (st2, cl2) = returnTest(st, cl, 1)
print(st2, cl2)

let rt2 = returnTest2(st2, cl2)
var (st3, cl3) = rt2(1)
print(st3, cl3)
(st3, cl3) = rt2(2)
print(st3, cl3)


func f() -> () -> () {
    let st = St(1)
    return {
        print(st)
    }
}

f()()


func f2() -> () -> (St) {
    let st = St(1)
    return {
        return st
    }
}

let new_st = f2()()
print(new_st) // 1


var s = St(1)
s.a = 2
print(s)
