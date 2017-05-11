//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//단순 구조체 정의, 선언, 메서드 사용

struct YourStructName {
    var someProperty: String
    
    mutating func someMethod(someParam: String) -> Void {
        someProperty = someParam
    }
    
}

//init 메서드가 자동으로 생성
var structInstance: YourStructName = YourStructName.init(someProperty: "Hey!")

//내부에서 var로 프로퍼트를 지정한다 해도 인스턴스가 let이면 변경불가
structInstance.someMethod(someParam: "Wow!")


dump(structInstance)



//클래스 정의

class ParentClass {
    var lastName: String = "홍"
}

class Person: ParentClass {
    var firstName: String = "길동"
    
    func changeMyLastName(to newLastName: String) -> Void {
        print("에잇 내가 성을 간다.")
        self.lastName = newLastName
    }
    
    init(withFullname fullName: String) { //init 재정의
        super.init()
        self.lastName = fullName.substring(to: fullName.index(after: fullName.startIndex))
        self.firstName = fullName.substring(from: fullName.index(after: fullName.startIndex))
    }
    
}

extension Person: CustomStringConvertible {
    var description: String {
        return "내 이름은 \(lastName)\(firstName)입니다."
    }
}


let gildong: Person = Person.init(withFullname: "홍길동")

print(gildong)

//클래스의 인스턴스는 레퍼런스 타입이므로, let으로 정의해도 프로퍼티 자체가 var이면 다른 값을 할당 가능.

gildong.changeMyLastName(to: "김")

print(gildong)

gildong.firstName = "동길"

print(gildong)



