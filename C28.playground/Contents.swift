enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coninsNeeded: Int)
    case outOfStock
}


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory: [String: Item] = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coninsNeeded: item.price - coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}

let favoriteSnacks = [
    "yagom": "Chips",
    "jinsung": "Biscuit",
    "heejin": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName: String = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchasedSnack: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine)
print(purchasedSnack)

print(favoriteSnacks)
//for (person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}



func buyFavoriteSnack2(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("잘못된 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 넣으세요")
    } catch {
        print("그 외 오류 발생 : ", error)
    }
}

struct PurchasedSnack2 {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

machine.coinsDeposited = 20
var purchase: PurchasedSnack2 = PurchasedSnack2(name: "Biscuit", vendingMachine: machine)
print(purchase)
purchase = PurchasedSnack2(name: "Ice Cream", vendingMachine: machine)
print(purchase.name)

for (person, snack) in favoriteSnacks {
    print(person, snack)
    tryingVend(itemNamed: snack, vendingMachine: machine)
}


func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x)
let y = try? someThrowingFunction(shouldThrowError: false)
print(y)


func fetchData() -> String? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    
    if let data = try? fetchDataFromServer() {
        return data
    }
    
    return nil
}

func fetchDataFromDisk() throws -> String {
    return "my string data from disk"
}

func fetchDataFromServer() throws -> String {
    return "my string data from server"
}



let y2: Int = try! someThrowingFunction(shouldThrowError: false)
print(y2)
//let x2: Int = try! someThrowingFunction(shouldThrowError: true)  // error



func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

func someFunction(callback: () throws -> Void) rethrows {
    try callback()
}

do {
    try someFunction(callback: someThrowingFunction)
} catch {
    print(error)
}


func someFunction2(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    
    do {
        try someThrowingFunction()
    } catch {
//        throw AnotherError.justAnotherError // error
    }
    
//    throw AnotherError.justAnotherError  // error
}



protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws { }
    func someFunction(callback: () throws -> Void) rethrows { }
    
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows { }
    
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws { }  // error
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows { }
}

class SomeChildClass: SomeClass {
    override func someThrowingFunction(callback: () throws -> Void) rethrows { }
    
//    override func someFunction(callback: () throws -> Void) throws { }  // error
    override func someFunction(callback: () throws -> Void) rethrows { }
}



for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
}


func someThrowingFunction3(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    defer {
        print("Second")
    }
    
    defer {
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction3(shouldThrowError: true)
try? someThrowingFunction3(shouldThrowError: false)


func someFunction3() {
    print(1)
    
    defer {
        print(2)
    }
    
    do {
        defer {
            print(3)
        }
        
        print(4)
    }
    
    defer {
        print(5)
    }
    
    print(6)
}

someFunction3()
