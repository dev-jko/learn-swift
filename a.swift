import Foundation

for i in 0...100 {
    let str: String = String.init(repeating: "=", count: i / 5) + ">" + String.init(repeating: " ", count: 20 - i / 5)
    if i % 5 == 0 {
		sleep(1)
	}
    print("\r[\(str)]", terminator: "")
	fflush(__stdoutp)
}
print()
print("a\nb\n\nc")
print("a\nb\n\nf\u{8}gg\u{8}c")
//print("\u{001B}[2J")
print("\u{001B}")
