//: Playground - noun: a place where people can play

import UIKit

var str = "메서드"



struct StructForTest {
    var myVariable: Int = 20
    
    mutating func signChange() {
        myVariable = -myVariable
    }
    
    static func structStaticFunction() {
        print("HI")
    }
    
}


class TestingClass {
    
    class func classFuction() {
        print("클래스 메서드입니다.")
    }
    
    static func staticFuction() {
        print("스태틱 메서드입니다.")
    }
    
}

class subclassOfTestingClass: TestingClass {
    class func classFunction() {
        print("재정의가 가능!")
    }
    
//    override static func staticFuction() { //cannot override static method
//        print("스의틱 메서드 재정의입니다.")
//    }

}