import UIKit


let first: Int = 5
var second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}

second = 5

if first > second {
    print(first)
} else if first == second {
    print(first)
} else if first < second {
    print(second)
} else if first == 5 {
    print(100)
}

if (first > second) {
    print(first)
} else if (first == second) {
    print(first)
} else if (first < second) {
    print(second)
}

