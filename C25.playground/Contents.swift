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
