protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherTypeProperty: Int { get }
}


protocol Sendable {
    var from: String { get }
    var to: String { get }
}

class Message: Sendable {
    var sender: String
    var from: String {
        return self.sender
    }
    
    var to: String
    
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {
    var from: String
    var to: String
    
    init(sender: String, receiver: String) {
        self.from = sender
        self.to = receiver
    }
}


protocol Receiveable2 {
    func received(data: Any, from: Sendable2)
}

protocol Sendable2 {
    var from: Sendable2 { get }
    var to: Receiveable2? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message2: Sendable2, Receiveable2 {
    var from: Sendable2 {
        return self
    }
    
    var to: Receiveable2?
    
    func send(data: Any) {
        guard let receiver: Receiveable2 = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable2) {
        print("Message received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable2 = instance as? Sendable2 {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail2: Sendable2, Receiveable2 {
    var from: Sendable2 {
        return self
    }
    
    var to: Receiveable2?
    
    func send(data: Any) {
        guard let receiver: Receiveable2 = self.to else {
            print("Mail has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable2) {
        print("Mail received \(data) from \(from)")
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable2 = instance as? Sendable2 {
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMessage: Message2 = Message2()
let yourPhoneMessage: Message2 = Message2()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail2 = Mail2()
let yourMail: Mail2 = Mail2()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "bye")

Message2.isSendableInstance("Hello")

Message2.isSendableInstance(myPhoneMessage)

Message2.isSendableInstance(yourPhoneMessage)
Mail2.isSendableInstance(myPhoneMessage)
Mail2.isSendableInstance(myMail)



protocol Resettable {
    mutating func reset()
}

class Person: Resettable {
    var name: String?
    var age: Int?
    
    func reset() {
        self.name = nil
        self.age = nil
    }
}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, south, north, unknown
    
    mutating func reset() {
        self = .unknown
    }
}



protocol Named {
    var name: String { get }
    
    init(name: String)
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person2: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

final class Person3: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class School {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class MiddleSchool: School, Named {
    required override init(name: String) {
        super.init(name: name)
    }
}


protocol Named2 {
    var name: String { get }
    
    init?(name: String)
}

struct Animal: Named2 {
    var name: String
    
    init!(name: String) {
        self.name = name
    }
}

struct Pet2: Named2 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person4: Named2 {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School2: Named2 {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}



protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SomeClass: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}


protocol ClassOnlyProtocol: class, Readable, Writeable {
    
}

class SomeClass2: ClassOnlyProtocol {
    func read() {}
    func write() {}
}

//struct SomeStruct: ClassOnlyProtocol {} // error



protocol Named5 {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person5: Named5, Aged {
    var name: String
    var age: Int
}

class Car: Named5 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Truck: Car, Aged {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named5 & Aged) {
    print("Happy birthday \(celebrator.name)! Now you are \(celebrator.age)")
}

let yagom: Person5 = Person5(name: "yagom", age: 99)
celebrateBirthday(to: yagom)

let myCar: Car = Car(name: "BoongBoong")
//celebrateBirthday(to: myCar)  // error

//var someVariable: Car & Truck & Aged  // error
var someVariable: Car & Aged
someVariable = Truck(name: "Truck", age: 5)
//someVariable = myCar  // error


print(yagom is Named5)
print(yagom is Aged)

print(myCar is Named5)
print(myCar is Aged)

if let castedInstance: Named5 = yagom as? Named5 {
    print("\(castedInstance) is Named")
}

if let castedInstance: Aged = yagom as? Aged {
    print("\(castedInstance) is Aged")
}

if let castedInstance: Named5 = myCar as? Named5 {
    print("\(castedInstance) is Named")
}

if let castedInstance: Aged = myCar as? Aged {
    print("\(castedInstance) is Aged")
}













