//: Playground - noun: a place where people can play

import UIKit


//일반적인 옵셔널 할당
var str: String? = "Hello, playground"


//열거형으로 하는 경우
enum School: String {
    
    case iOS = "iOS"
    case android = "android"
    
}

let mySchool = School(rawValue: "macOS") //rawValue가 잘못 들어가면 바로 nil!


//옵셔널 밸류 체크하기. 없을 때 적절한 반응이 가능.
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case Optional.none:
        print("닐이다~닐이다~")
    case Optional.some(let value):
        print("값이 \(value)이다")
    }
}

var myName: String = "yap"

checkOptionalValue(value: myName) //옵셔널이 아닌 값도 들어감.

var noName: String? = nil

checkOptionalValue(value: noName)



//강제추출

var shouldHaveValue = str!

