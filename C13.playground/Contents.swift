let names: [String] = ["wizplan", "eric", "yagom", "jenny"]


func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교 중")
    return first > second
}
let reversed: [String] = names.sorted(by: backwards)
print(reversed)


let reversed2: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed2)


let reversed3: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}
print(reversed3)

let reversed4: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}
print(reversed4)


let reversed5: [String] = names.sorted { (first, second) in
    return first > second
}
print(reversed5)


let reversed6: [String] = names.sorted {
    return $0 > $1
}
print(reversed6)


let reversed7: [String] = names.sorted { $0 > $1 }
print(reversed7)


let reversed8: [String] = names.sorted(by: >)
print(reversed8)



func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal: Int = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

let incrementByTwo2: () -> Int = makeIncrementer(forIncrement: 2)
let incremeteByTen: () -> Int = makeIncrementer(forIncrement: 10)

let first2: Int = incrementByTwo2()
let second2: Int = incrementByTwo2()
let third2: Int = incrementByTwo2()

let ten: Int = incremeteByTen()
let twenty: Int = incremeteByTen()
let thirty: Int = incremeteByTen()



let sameWithIncrementByTwo: () -> Int = incrementByTwo

let first3: Int = sameWithIncrementByTwo()
let second3: Int = incrementByTwo()


var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    return shouldReturnFirstClosure ? first : second
}

let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
returnedClosure()

var closures: [VoidVoidClosure] = []

func appendClosure(closure: @escaping VoidVoidClosure) {
    closures.append(closure)
}



func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        functionWithEscapingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure2: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure2()
print(instance.x)



