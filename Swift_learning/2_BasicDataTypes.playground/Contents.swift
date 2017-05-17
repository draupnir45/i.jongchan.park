//: Playground - noun: a place where people can play

import UIKit
//: -------------------------------------------------
//:Int / UInt
//: -------------------------------------------------
    Int.max
    UInt.max
    Int.min
    UInt.min

    let a: Int = 0
    let b: Int = 11



    let c: Int = a - b
//: -------------------------------------------------
//: Bool
//: -------------------------------------------------
    let testBool: Bool = true

    if a != 0 {
        print("정수도 불로 검사? No! 연산자 이용하세욥")
    }
//: -------------------------------------------------
//: Float / Double
//: -------------------------------------------------
    let longNumbFloat: Float = 1234567890.1
    let longNumbDouble: Double = 1234567890.1
    print(longNumbFloat, longNumbDouble)

//: -------------------------------------------------
//: Character
//: -------------------------------------------------
    let 한글_변수_이름: Character = "A"

    let sampleString: String = "샘플입니다. 한글로 써 봤습니다."
    sampleString.characters.count

    let unicodeScalaValue: Character = "\u{2665}"

//: -------------------------------------------------
//: String
//: -------------------------------------------------
//: Appending 연산자 "+"
    let someString: String = "Hello, " + "World!"

    let anotherString: String = "Hello, World!"

//: 비교연산자 사용 가능
    if someString == anotherString {
        print("이렇게 그냥 됩니다!")
    }

//: 앞에 혹은 뒤에 어떤 문자열이 있는지 확인 가능!
    if someString.hasPrefix("He") {
        print("앞에 문자열이 있는지 확인")
    }

    if someString.hasSuffix("!") {
        print("뒤에 문자열이 있는지 확인")
    }

//: 대문자로, 소문자로 변경해서 반환하는 함수
    let UPPERCASED = someString.uppercased()
    let lowercased = UPPERCASED.lowercased()

//: 원래 문자는 바뀌지 않고, 덤으로 문자열 보간법
    print("원래 자료인 \(someString)는 바뀌지 않습니다.")

    print()







