import UIKit

func escapingClosure2(_ closure: () -> Void) {
    print("escaping closure2 - 1")
    closure()
    print("escaping closure2 - 2")
}

func escapingClosure(_ closure: @escaping () -> Void) {
    let c: () -> Void = closure
    print("escaping closure - 1")
    closure()
    print("escaping closure - 2")
    escapingClosure2(closure)
    print("escaping closure - 3")
    let c2 = { () in closure() }
    print("escaping closure - 4")
    c()
    c2()
}

func nonEscapingClosure(_ closure: () -> Void) {
    print("1")
    closure()
    print("2")
    escapingClosure2(closure)
    // let c2 = { () in closure() }
    // c2()
}


func myFunc() {
    print("myFunc")
}

print("escaping")
escapingClosure(myFunc)

print("\n\n")

print("non escaping")
nonEscapingClosure(myFunc)


for i in 0...100 {
    let str: String = String.init(repeating: "=", count: i / 5) + ">" + String.init(repeating: " ", count: 20 - i / 5)
    sleep(1)
    print("[\(str)]\r", terminator: "")
    fflush(__stdoutp)
}
print()
print("a\nb\rc")
