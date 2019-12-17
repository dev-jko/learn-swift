import UIKit



var myName: String = "nadarm"
//myName = nil  // error

var myName2: String? = "nadarm"
// var myName2: Optional<String> = "nadarm"
print(myName2)
myName2 = nil
print(myName2)


func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("this is nil")
    case .some(let value):
        print("this is \(value)")
    }
}

checkOptionalValue(value: myName2)
myName2 = "nadarm"
checkOptionalValue(value: myName2)


let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("negative value \(value)")
    case .some(let value) where value > 10:
        print("large value \(value)")
    case .some(let value):
        print(value)
    case .none:
        print("nil!!!")
    }
}

var nadarm: String = myName2!
myName2 = nil
//nadarm = myName2!  // error

if myName2 != nil {
    print(myName2)
} else {
    print("my name2 == nil")
}


myName2 = "nadarm"
if let name = myName2 {
    print("my name is \(name)")
} else {
    print("my name == nil")
}

if var name = myName2 {
    name = "yagom"
    print(name)
} else {
    print("my name == nil")
}


var name1: String? = "nadarm"
var name2: String? = nil

if let name = name1, let friend = name2 {
    print("\(name) and \(friend)")
}
name2 = "eric"
if let name = name1, let friend = name2 {
    print("\(name) and \(friend)")
}



var myName3: String! = "nadarm"
print(myName3)
myName3 = nil

if let name = myName3 {
    print("my name3 is \(name)")
} else {
    print("myName3 == nil")
}
//myName3.isEmpty  // error

