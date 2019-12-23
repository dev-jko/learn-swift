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


// error
//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//    return array.lazy.filter { predicate($0) }.isEmpty == false
//}

let numbers: [Int] = [2, 4, 6, 8]
let evenNumberPredicate: (Int) -> Bool = { $0 % 2 == 0 }
let oddNumberPredicate: (Int) -> Bool = { $0 % 2 == 1 }

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do:  { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber: Bool = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber: Bool = hasElements(in: numbers, match: oddNumberPredicate)
print(hasEvenNumber)
print(hasOddNumber)



var customersInLine: [String] = ["YoangWha", "SangYong", "sungHun", "HaMi"]
print(customersInLine.count)

let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)


customersInLine = ["YoangWha", "SangYong", "sungHun", "HaMi"]

func serveCustomer(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer( {customersInLine.removeFirst() } )

func serveCustomer2(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer2(customersInLine.removeFirst())


func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> () -> String {
    return customerProvider
}

let customerProvider2: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider2())!")


