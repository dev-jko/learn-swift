class Person {
    var name: String = ""
    var age: Int = 0
    
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
