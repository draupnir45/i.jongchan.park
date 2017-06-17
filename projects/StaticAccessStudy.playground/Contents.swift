//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class OriginalClass {
    static var classProperty = 2
    var someProperty = 1
    func someMethod() {
        print(self.someProperty)
        print(type(of: self).classProperty)
        print(OriginalClass.classProperty)
    }
}

class InheritedClass: OriginalClass {
    override init() {
        type(of: self).classProperty = 3
    }
}

var ins = InheritedClass.init()
ins.someMethod()

