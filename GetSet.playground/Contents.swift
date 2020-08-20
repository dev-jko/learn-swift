class MyClass {
    private var _a: String?
    var a: String! {
        if _a == nil {
            _a = "string"
        }
        return _a
    }
    var b: String! {
        get {
            if _a == nil {
                _a = "string"
            }
            return _a
        }
        set {
            _a = newValue
        }
    }
}

let c = MyClass()

c.a

c.b
c.b = nil
c.b
