//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let a: UInt = UInt.max

let b: UInt = a &- a &- a

//후위연산자
postfix operator **

postfix func ** (value: Int) -> Int {
    return value * value
}

let c: Int = -5

//전위연산자
prefix operator ***

prefix func *** (value: Int) -> Int {
    return value * 10
}

***c**

//중위 연산자
class Car {
    var modelYear: Date?
    var modelName: String?
    var registerNumber: Int?
}

struct SmartPhone {
    var modelName: String?
    var phoneNumber: Int?
}

infix operator **


//클래스나 구조체나 상관 없이 프로퍼티 중 비교할 것만 비교해서 반환이 가능.
func ** (_ left:Car,_ right:Car) -> Bool {
    return left.registerNumber == right.registerNumber
}

var oneCar: Car = Car()
oneCar.registerNumber = 3298
var otherCar: Car = Car()
otherCar.registerNumber = 3298

if oneCar ** otherCar {
    print(oneCar.registerNumber)
}

if oneCar === oneCar {
    print("dma?")
}
