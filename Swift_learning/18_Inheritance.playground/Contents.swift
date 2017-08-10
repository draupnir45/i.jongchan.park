//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class SuperClass {
    
    var superProp: String
    
    init(superProp: String) {
        self.superProp = superProp
    }
}

class TestClass: SuperClass {
    
    var testProp: String
    
    init() { //convenience가 붙지 않은 init은 전부 지정 이니셜라이저.
        self.testProp = "지정으로부터"
        super.init(superProp: "테스트-지정으로부터")
    }
    
    convenience init(convenienceString: String) {
        self.init()
        self.testProp = convenienceString
    }
    
    required init(requiredString: String) {
        self.testProp = requiredString
        super.init(superProp: "테스트-지정으로부터")
    }
}

class ChildClass: TestClass {
    var childProp: String
    
    override init() {
        childProp = "차일드-지정으로부터"
        super.init()
    }
    required init(requiredString: String) {
        childProp = "차일드-요구-지정으로부터"
        super.init()
    }
}
