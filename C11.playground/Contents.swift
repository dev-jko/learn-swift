class SomeClass {
    init() {
    }
}

struct SomeStruct {
    init() {
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        self = .someCase
    }
}


//struct Area {
//    var squareMeter: Double = 0.0
//}

struct Area {
    var squareMeter: Double
    
//    init() {
//        squareMeter = 0.0
//    }
    
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

//let room: Area = Area()
//print(room.squareMeter)

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
print(roomThree.squareMeter)

let roomFour: Area = Area(55.0)
print(roomFour.squareMeter)

//Area() // error


class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.name)
print(yagom.age)

yagom.age = 99
print(yagom.age)
yagom.name = "Eric"
print(yagom.name)

class Person2 {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}


struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 1, y: 0)
let size: Size = Size(width: 50, height: 50)
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)


enum Student {
    case elementary, middle, high
    case none
    
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)
younger = Student(bornAt: 1998, currentYear: 2019)
print(younger)



class Person3 {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let yagom2: Person3? = Person3(name: "yagom", age: 99)
if let person: Person3 = yagom2 {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: Person3? = Person3(name: "chope", age: -10)
if let person: Person3 = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}


enum Student2: String {
    case elementary = "초등학생", middle = "중학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        default:
            return nil
        }
    }
}

var younger2: Student2? = Student2(koreanAge: 20)
print(younger2)
younger2 = Student2(rawValue: "대학생")
print(younger2)


class AClass {
    let someProperty: SomeClass = {
        return SomeClass()
    }()
}

struct Student3 {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student3] = {
        var arr: [Student3] = []
        
        for num in 1...15 {
            var student: Student3 = Student3(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)



class SomeClass2 {
    deinit {
        print("Instance will be dealicated immediately")
    }
}

var instance: SomeClass2? = SomeClass2()
instance = nil

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("open file \(self.fileName)")
    }
    
    func modifyFile() {
        print("modify file \(self.fileName)")
    }
    
    func writeFile() {
        print("write file \(self.fileName)")
    }
    
    func closeFile() {
        print("close file \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")
if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
