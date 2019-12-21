open class OpenClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
    internal var internalProperty: Int = 0
    fileprivate var fileprivateProperty: Int = 0
    private var privateProperty: Int = 0
    
    open func openMethod() {}
    public func publicMethod() {}
    internal func internalMethod() {}
    fileprivate func fileprivateMethod() {}
    private func privateMethod() {}
}

public class PublicClass {}
public struct PublicStruct {}
public enum PublicEnum {}
public var publicVariable = 0
public let publicConstant = 0
public func publicFunction() {}

internal class InternalClass {}
//class InternalClass {} // internal 키워드 생략 가능
struct InternalStruct {}
enum InternalEnum {}
var internalVariable = 0
let internalConstant = 0
func internalFunction() {}

fileprivate class FilePrivateClass {}
fileprivate struct FilePrivateStruct {}
fileprivate enum FilePrivateEnum {}
fileprivate var filePrivateVariable = 0
fileprivate let filePrivateConstant = 0
fileprivate func filePrivateFunction() {}

private class PrivateClass {}
private struct PrivateStruct {}
private enum PrivateEnum {}
private var privateVariable = 0
private let privateConstant = 0
private func privateFunction() {}


private class AClass {
    // AClass가 private이므로 someMethod를 public으로 설정해도 privateㅇ으로 취급
    public func someMethod() {}
}

// error 파라미터 a의 타입 AClass가 private이라 someFunction은 public이 될 수 없음
//public func someFunction(a: AClass) -> AClass {
private func someFunction(a: AClass) -> AClass {
    return a
}


// error 튜플보다 튜플의 요소인 first, second의 접근 수준이 낮기 때문에 사용 불가
//public var publicTupble: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())
private var publicTupble: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())



private typealias PointValue = Int
//enum Point: PointValue {  // error 연관 타입이 private이기 때문에 internal 접근수준 키워드 사용 불가
private enum Point: PointValue {
    case x, y
}



public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    private func privateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    
    mutating func someMethod() {
        self.someInstance.publicMethod()
        
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod()
        
        // error private 접근 불가
//        self.someInstance.privateVariable = 100
//        self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()



public struct SomeType2 {
    private var count: Int = 0
    
    public var publicStoredProperty: Int = 0
    
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}

var some: SomeType2 = SomeType2()
print(some.publicStoredProperty)
some.publicStoredProperty = 100

print(some.publicGetOnlyStoredProperty)
//some.publicGetOnlyStoredProperty = 100  // error

print(some.internalComputedProperty)
some.internalComputedProperty = 100

print(some.internalGetOnlyComputedProperty)
//some.internalGetOnlyComputedProperty = 100  // error

print(some[])
some[] = 100

print(some[0])
some[0] = 100

