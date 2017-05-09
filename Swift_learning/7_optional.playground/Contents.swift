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

//print(noName)



//강제추출. 위험.

var shouldHaveValue = str!

if noName != nil { //if로 안전하게.
    shouldHaveValue = noName!
} else {
    print("없어!")
}


//옵셔널 바인딩

var optString: String? = "옵셔널 스트링"

if let variableToBind = optString {
    print("\(variableToBind)에 값이 있다!")
} else {
    print("닐이다!")
}

if var variableToBind = optString {
    variableToBind = variableToBind + "에 값이 있으니 변경도 가능하다!"
    print(variableToBind)
} else {
    print("닐이다!")
}

if let variable1 = optString, let variable2 = str {
    print("둘다 있다!")
} else {
    print("둘 중에 하나가 없거나 둘다 없다!")
}

//암시적 추출 옵셔널 : nil 할당이 가능하지만 할당시 접근하면 오류. 일반 옵셔널은 오류는 아니고 경고만 발생. 옵셔널 바인딩도 사용 가능. 지양.
var implicitVar: String! = nil