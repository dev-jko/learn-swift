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


















