protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendable(_ instance: Any) -> Bool
}

extension Sendable {
    var from: Sendable {
        return self
    }
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendable(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = self as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Message: Sendable, Receiveable {
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "bye")

extension Mail {
    func send(data: Any) {
        print("Mail의 send 메서드는 재정의되었습니다.")
    }
}

let mailInstance: Mail = Mail()
mailInstance.send(data: "Hello")



protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    var count: Int {
        return items.count
    }
    
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Eelement>: Popable {
    var items: [Eelement] = []
}

struct Queue<Element>: Insertable {
    var items: [Element] = []
}

var intStack: Stack<Int> = Stack()
var stringStack: Stack<String> = Stack()
var intQueue: Queue<Int> = Queue()
var stringQueue: Queue<String> = Queue()

intStack.push(3)
intStack.printSelf()
intStack.push(2)
intStack.printSelf()
intStack.pop()
intStack.printSelf()

stringStack.push("A")
stringStack.printSelf()
stringStack.pop()
stringStack.printSelf()

intQueue.insert(1)
intQueue.printSelf()
intQueue.insert(2)
intQueue.printSelf()
intQueue.delete()
intQueue.printSelf()























