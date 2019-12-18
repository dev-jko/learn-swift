import UIKit



struct BasicInformation {
    var name: String
    var age: Int
}

var nadarmInfo: BasicInformation = BasicInformation(name: "nadarm", age: 100)
nadarmInfo.age = 101
nadarmInfo.name = "NADARM"

let sebaInfo: BasicInformation = BasicInformation(name: "seba", age: 99)
//sebaInfo.age = 100 // error sebaInfo가 let이라 변경 불가



class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var nadarm: Person = Person()
nadarm.height = 100
nadarm.weight = 100

let jenny: Person = Person()
jenny.height = 100
jenny.weight = 100

var yagom: Person? = Person()
yagom = nil



var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

var friendInfo: BasicInformation = yagomInfo
print("yagom info age : \(yagomInfo.age)")
print("friend info age : \(friendInfo.age)")

friendInfo.age = 999
print("yagom info age : \(yagomInfo.age)")
print("friend info age : \(friendInfo.age)")

var friend: Person = nadarm
print("nadarm height : \(nadarm.height)")
print("friend height : \(friend.height)")

friend.height = 200
print("nadarm height : \(nadarm.height)")
print("friend height : \(friend.height)")

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

changeBasicInfo(yagomInfo)
print("yagom's age : \(yagomInfo.age)")

changePersonInfo(nadarm)
print("nadarm's height : \(nadarm.height)")


var yagom2: Person = Person()
let friend2: Person = yagom2
let anotherFriend: Person = Person()
print(yagom2 === friend2)
print(yagom2 === anotherFriend)
print(friend2 !== anotherFriend)

