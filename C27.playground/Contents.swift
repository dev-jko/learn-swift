class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "yagom")
reference2 = reference1
reference3 = reference1

reference3 = nil
reference2 = nil
reference1 = nil



func foo() {
    let yagom: Person = Person(name: "yagom")
}

foo()

var globalReference: Person?

func foo2() {
    let yagom: Person = Person(name: "yagom")
    
    globalReference = yagom
}

foo2()


class Person2 {
    let name: String
    
    var room: Room?
    
    init(name: String) {
        self.name = name
        print("Person2 \(name) is being initialized")
    }
    
    deinit {
        print("Person2 \(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var host: Person2?
    
    deinit {
        print("Room \(self.number) is being deinitialized")
    }
}

var yagom: Person2? = Person2(name: "yagom")
var room: Room? = Room(number: "505")

room?.host = yagom
yagom?.room = room

yagom = nil
//room = nil

room?.host = nil
room = nil



class Person3 {
    let name: String
    
    var room: Room3?
    
    init(name: String) {
        self.name = name
        print("Person3 \(name) is being initialized")
    }
    
    deinit {
        print("Person3 \(name) is being deinitialized")
    }
}


class Room3 {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    weak var host: Person3?
    
    deinit {
        print("Room3 \(number) is being deinitialized")
    }
}

var yagom3: Person3? = Person3(name: "yagom3")
var room3: Room3? = Room3(number: "room3 505")

room3?.host = yagom3
yagom3?.room = room3

yagom3 = nil
print(room3?.host)

room3 = nil



class Person4 {
    let name: String
    
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Person4 \(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt
    
    unowned let owner: Person4
    
    init(number: UInt, owner: Person4) {
        self.number = number
        self.owner = owner
    }
    
    deinit {
        print("CreditCard \(number) is being deinitialized")
    }
}

var jisoo: Person4? = Person4(name: "Jisoo")

if let person: Person4 = jisoo {
    person.card = CreditCard(number: 1004, owner: person)
}

jisoo = nil



class Company {
    let name: String
    var ceo: CEO!
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO \(ceo.name)")
    }
}

class CEO {
    let name: String
    unowned let company: Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)은 \(company.name)의 CEO")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()
company.ceo.introduce()
