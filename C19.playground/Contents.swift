var value: Double = 1.3
var convertedValue: Int = Int(value)
//convertedValue = 5.5  // error


var stringValue: String = "123"
var integerValue: Int? = Int(stringValue)
print(integerValue)
stringValue = "A123"
integerValue = Int(stringValue)
print(integerValue)



class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)

print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Latte)

print(myCoffee is Coffee)
print(myCoffee is Americano)
print(myCoffee is Latte)

print(yourCoffee is Coffee)
print(yourCoffee is Americano)
print(yourCoffee is Latte)



protocol SomeProtocol {}
class SomeClass: SomeProtocol {}

let intType: Int.Type =  Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)
someType = stringType
print(someType)
someType = classType
print(someType)
someType = protocolProtocol
print(someType)


print(type(of: coffee) == Coffee.self)
print(type(of: coffee) == Americano.self)
print(type(of: coffee) == Latte.self)

print(type(of: myCoffee) == Coffee.self)
print(type(of: myCoffee) == Americano.self)
print(type(of: myCoffee) == Latte.self)

print(type(of: yourCoffee) == Coffee.self)
print(type(of: yourCoffee) == Americano.self)
print(type(of: yourCoffee) == Latte.self)


let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)

if let actingOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}

if let actingOne: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}

if let actingOne: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}


if let actingOne: Americano = myCoffee as? Americano {
    print("This is Americano")
} else {
    print(myCoffee.description)
}

if let actingOne: Latte = myCoffee as? Latte {
    print("This is Latte")
} else {
    print(myCoffee.description)
}

if let actingOne: Coffee = myCoffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(myCoffee.description)
}


let castedCoffee: Coffee = yourCoffee as! Coffee
//let castedAmericano: Americano = coffee as! Americano  // error

let castedCoffee2: Coffee = yourCoffee as Coffee




















