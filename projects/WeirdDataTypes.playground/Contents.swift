//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: -------------------------------------------------
//:typealias
//: -------------------------------------------------

//이름을 지정할 수 있다. 지정 후에도 기존 이름을 사용할 수도 있다.
typealias JCInt = Int64
typealias JCUInt = UInt64

let a: JCInt = 100
let b: Int64 = 100

//: -------------------------------------------------
//: Tuple
//: -------------------------------------------------

//따로 타입 이름이나 데이터 이름을 지정하지 않고 쓰는 경우. 변수명에 점을 찍고 인덱스를 적는 것으로 받아오고 할당할 수 있다. (할당은 var일 때만)
var chani: (String, Int, Double) = ("jongchan", 31, 174.5)

chani.1 = 32

dump(chani)

//요소와 튜플 형태 자체에 이름을 지정

typealias Person = (name: String, age: Int, height: Double)

let jongchan: Person = ("Jongchan", 32, 174.5)

//데이터기 때문에 할당할 때 값만 복사해온다.
var clone: Person = ("Jongchan", 31, 174.5)

dump(jongchan)


//연산자로 비교도 가능. 값타입이기 때문에 같으면 그냥 같다.
if clone == jongchan {
    dump("same!")
} else {
    dump("nope!")
}

clone.age = 32

if clone == jongchan {
    dump("same!")
} else {
    dump("nope!")
}

// 아래 둘 다 불가. 그냥 상수값.
// jongchan.age = 32
// jongchan = clone 

//: -------------------------------------------------
//: Array
//: -------------------------------------------------

//선언
var names: [String] = []
names.isEmpty

//붙이기
names.append("jongchan")
names.append("byeongjun")
names.append("junmin")
names.append("youngjin")

//선언 안해도 한방에 만들면 괜춘. but 왠만하면 쓰지 말자
let ages = [31, 31, 33, 31]
type(of: ages)

//삽입하기. 빈 어레이에다가는 0만 가능.
var heights: [Double] = [174.5, 170, 178.0]
heights.insert(174.5, at: 0)

//튜플을 넣어 봅시다.
var personArray: [Person] = []
for i in 0...3 {
    let person: Person = (name: names[i], age: ages[i], height: heights[i])
    personArray.append(person)
}
dump(personArray)

personArray[0].name
personArray.count

//: -------------------------------------------------
//: Dictionary
//: -------------------------------------------------

//선언
var dict: [String: Person] = [:]
//[String: Any]//요렇게 하면 아무거나 넣을 수 있다. 하지만 가져올 때 캐스팅해줘야 할수도. 좋은 방법을 고민해보자.

//추가. 그냥 리터럴에 할당하면 생성됨
for i in 0...3 {
    dict[personArray[i].name] = personArray[i]
}

dump(type(of: dict["jongchan"])) //[String: Any]로 생성된 경우에는 Any 로 나온다.


