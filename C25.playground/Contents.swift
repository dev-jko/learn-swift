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

