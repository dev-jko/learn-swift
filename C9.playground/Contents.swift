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

