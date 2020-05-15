func has7(_ n: Int) -> Bool {
    if n % 7 == 0 { return true }
    if n % 10 == 7 { return true }
    if n >= 10 { return has7(n / 10) }
    return false
}

func pingpong(_ n: Int) -> Int {
    func _pingpong(_ count: Int, _ num: Int, _ dx: Int) -> Int {
        if count == n { return num }
        if has7(count) {
            return _pingpong(count + 1, num - dx, -dx)
        }
        return _pingpong(count + 1, num + dx, dx)
    }
    return _pingpong(1, 1, 1)
}

(1...30).map(pingpong).forEach { print($0, terminator: ", ") }
print()
print(pingpong(8)) // 6
print(pingpong(22)) // 0
print(pingpong(68)) // 2
print(pingpong(100)) // 2
