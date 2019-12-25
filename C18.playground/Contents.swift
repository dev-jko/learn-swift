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
