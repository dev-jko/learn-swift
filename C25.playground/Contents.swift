let string: String = "ABC"
switch string {
case _:
    print(string)
}

let optionalString: String? = "ABC"
switch optionalString {
case "ABC"?:
    print(optionalString)
case _?:
    print("Has value, but not ABC")
case nil:
    print("nil")
}

let yagom = ("yagom", 99, "Male")
switch yagom {
case ("yagom", _, _):
    print("hello yagom")
case (_, _, _):
    print("who cares~")
}

for _ in 0..<2 {
    print("Hello")
}



let someValue: Int = 42



switch yagom {
case let (name, age, gender):
    print("name: \(name), age: \(age), gender: \(gender)")
}

switch yagom {
case (let name, let age, let gender):
    print("name: \(name), age: \(age), gender: \(gender)")
}

switch yagom {
case let (name, _, gender):
    print("name: \(name), gender: \(gender)")
}



let (a): Int = 2
print(a)

let (x, y): (Int, Int) = (1, 2)
print(x)
print(y)

let name: String = "Jung"
let age: Int = 99
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _):
    print("Hello Jung")
case (_, _, "Male"?):
    print("who are you man?")
default:
    print("I don't know who you are")
}

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1)]

for (x, _) in points {
    print(x)
}



if case 0...100 = someValue {
    print("0 <= \(someValue) <= 100")
}

let anotherValue: String = "ABC"
if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []
var dinner: MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dish else {
        print("It's not a Pizza")
        return
    }
    
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}

dinner = .rice
dishes.append(dinner)

if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}

for dish in dishes {
    switch dish {
    case let .pasta(taste):
        print(taste)
    case let .pizza(dough, topping):
        print(dough, topping)
    case let .chicken(withSauce):
        print(withSauce)
    case let .rice:
        print("Just 쌀")
    }
}






























