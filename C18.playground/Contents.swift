class Person {
    var name: String = ""
    
    var age: Int = 0 {
        didSet {
            print("Person age: \(self.age)")
        }
    }
    
    var koreanAge: Int {
        return self.age + 1
    }
    
    var fullName: String {
        get {
            return self.name
        }
        
        set {
            self.name = newValue
        }
    }
    
    var introduction: String {
        return "name : \(name), age : \(age)"
    }
    
    func speak() {
        print("abcdefg")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 99
print(yagom.introduction)
yagom.speak()


class Student: Person {
    var grade: String = "F"
    
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
        
//        didSet {}  // error
    }
    
    override var fullName: String {
        didSet {
            print("Full name : \(self.fullName)")
        }
    }
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    func study() {
        print("study hard...")
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }
}

let jay: Student = Student()
jay.name = "jay"
jay.age = 10
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()


class UniversityStudent: Student {
    var major: String = ""
    
    class func introduceClass() {
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+입니다."
    }
    
    override func study() {
        super.speak()
        print("대학생이죠.")
    }
}

let jenny: UniversityStudent = UniversityStudent()
jenny.major = "Art"
jenny.speak()
jenny.study()


print(Person.introduceClass())
print(Student.introduceClass())
print(UniversityStudent.introduceClass() as String)
UniversityStudent.introduceClass() as Void


//yagom.koreanAge = 56  // error
print(yagom.introduction)
print(yagom.koreanAge)

jay.age = 14
jay.koreanAge = 15
print(jay.introduction)
print(jay.koreanAge)



yagom.fullName = "Jo yagom"
yagom.age = 55

jay.age = 14
jay.fullName = "Kim jay"



class School {
    var students: [Student] = []
    
    subscript(index: Int) -> Student {
        print("School subscript")
        return students[index]
    }
}

class MiddleSchool: School {
    var middleStudents: [Student] = []
    
    override subscript(index: Int) -> Student {
        print("middle school subscript")
        return middleStudents[index]
    }
}

let university: School = School()
university.students.append(Student())
university.students.append(Student())
university[0]

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0]


class Person2 {
    final var name: String = ""
    final func speak() {
        print("abc")
    }
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "nadarm")
    }
}

final class Student2: Person2 {
//    override var name: String  // error
}

//class UniversityStudent: Student2 {}  // error



class Person3 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Student3: Person3 {
    var major: String
    
    override init(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7)
    }
}


class Person4 {
    var name: String
    var age: Int
    
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.age = age
    }
    
    init?(age: Int) {
        if age < 0 {
            return nil
        }
        
        self.name = "Unknown"
        self.age = age
    }
}

class Student4: Person4 {
    var major: String
    
    override init?(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    override init(age: Int) {
        self.major = "Swift"
        super.init()
    }
}



class Person5 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Student5: Person5 {
    var major: String = "Swift"
}

let yagom2: Person5 = Person5(name: "yagom")
let jinSung: Student5 = Student5(name: "haha")
print(yagom2.name)
print(jinSung.name)

let wizplan: Person5 = Person5()
let haha: Student5 = Student5()
print(wizplan.name)
print(haha.name)


class Student55: Person5 {
    var major: String
    
    override init(name: String) {
        self.major = "Unknown"
        super.init(name: name)
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

let wiz: Person5 = Person5()
let jin: Student55 = Student55()
print(wiz.name)
print(jin.name)
print(jin.major)


class Student555: Person5 {
    var major: String
    
    convenience init(major: String) {
        self.init()
        self.major = major
    }
    
    override convenience init(name: String) {
        self.init(name: name, major: "Unknown")
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

let jin2: Student555 = Student555(major: "Swift")
print(jin2.name)
print(jin2.major)



class UniversityStudent555: Student555 {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    
    convenience init(name: String, major: String, grade: String) {
        self.init(name: name, major: major)
        self.grade = grade
    }
}

let nova: UniversityStudent555 = UniversityStudent555()
print(nova.description)

let raon: UniversityStudent555 = UniversityStudent555(name: "raon")
print(raon.description)

let joker: UniversityStudent555 = UniversityStudent555(name: "joker", major: "Programming")
print(joker.description)

let chope: UniversityStudent555 = UniversityStudent555(name: "chope", major: "Computer", grade: "C")
print(chope.description)
