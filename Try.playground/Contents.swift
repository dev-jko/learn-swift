
enum TestError: Error {
    case just
}

func f() throws {
    throw TestError.just
}

if let _ = try? f() {
    print("a")
} else {
    print("b")
}

do {
    try f()
} catch {
    print("catch")
}

//try! f()
