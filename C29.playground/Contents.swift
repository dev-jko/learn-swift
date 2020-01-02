var one: Int = 1
print(one)

func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber)


print(Unmanaged<AnyObject>.fromOpaque(&myNumber).toOpaque())
class SomeClass { }
var object = SomeClass()
print(Unmanaged<AnyObject>.passUnretained(object).toOpaque())



var step: Int = 1
func increment(_ number: inout Int) {
    number += step
}
//increment(&step) // error


var copyOfStep: Int = step
func increment2(_ number: inout Int) {
    number += copyOfStep
}
increment2(&step)
print(step)


func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)
//balance(&playerOneScore, &playerOneScore)  // error


struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    mutating func restoreHealth() {
        self.health = Self.maxHealth
    }
    
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}

var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)
//oscar.shareHealth(with: &&oscar)  // error


//balance(&oscar.health, &oscar.energy)  // error


func someFunction() {
    var oscar = GamePlayer(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}

someFunction()
