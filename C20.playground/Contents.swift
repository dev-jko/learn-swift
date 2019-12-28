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

















