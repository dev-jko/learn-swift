extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(1.isOdd)
print(2.isEven)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)
