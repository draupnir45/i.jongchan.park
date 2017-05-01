# About Swift
명령형과 객체지향 패러다임을 기반으로 한 함수 / 프로토콜 지향 패러다임.


## 객체지향(Object-Oriented)
- [객체지향 프로그래밍 기초](Object-Oriented%20Programming.md)
- 강한 응집력(Strong Cohesion)과 약한 결합력(Weak Coupling)
- Class : 강한 응집력을 바탕으로 설계되어야 하는 커스텀 데이터타입.
- Object : Class의 인스턴스.
- Method or Message : 행위를 수행하는 함수.
- 명령형과의 관계 : 클래스를 통해 만들어진 객체에게 명령(Send Message)하여 메모리상에서 상태값을 변화시키기 때문에 필수적으로 명령형 패러다임과 함께 사용됨. (Objective-C는 C(명령형, 절차지향)으로부터 객체지향으로 발전시킨 것)

## 함수형(Functional)
- 수학적 함수? 명령형 함수?
- 아무튼 수학적 함수만 사용하기에 '상태 변화'가 일어나지 않는다고 한다.
- 함수가 First-class Citizen, 일등 시민으로. 무슨 말인고 하니
	- 전달인자로 전달 가능.
	- 동적 할당 가능.
	- 변수나 데이터 구조(Struct)에 담을 수 있음.
	- 반환값으로 사용 가능.
	- 할당시 고유한 객체로 구별 가능.
- 아무튼 그래서, 막 전달해서 막 생략하고 막 못 읽게 막 만든다. 진입장벽 재 강화...?

```swift
//아래 names 어레이를 역순으로 정렬하는 코드들.
let names:[String] = ["wizplan", "eric", "yagom", "jenny"]

//풀버전. first와 second를 가지고 어느 게 first가 클 때 true를 반환하는 클로저를 전달.
let reversedFull: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})

//후행 클로저로 변환. sorted 함수가 받는 인자 이름 'by'와 함께 소괄호 생략, 각 인자 타입도 생략. 자동완성 기능이 추천하는 클로저 형태 (2017년 5월).
let reversedAuto: [String] = names.sorted { (first, second) -> Bool in
    return first > second
}

//어차피 sorted가 받는 형태도 정해져 있고, 전달할 때도 Bool 전달하니까, 반환값 명시와 구분을 위한 괄호 생략
let reversed: [String] = names.sorted { first, second in
    return first > second
}

//어차피 의미도 없는 first와 second 생략. 그냥 $0이랑 $1으로 대체하고 그냥 리턴
let rvsd: [String] = names.sorted {
    return $0 > $1
}

//어차피 리턴할 건데 그냥 리턴도 생략..ㅋㅋㅋㅋㅋㅋㅋㅋ..ㅋ....ㅋㅋㅋ
let rv: [String] = names.sorted {
    $0 > $1
}

// '>' 연산자도 함수고 어차피 Bool 리턴하는 거 똑같으니까 그냥 >이것만 전달. 전달할 함수만 준비되어 있다면 자동완성으로 가능. (2017년 5월)
let r: [String] = names.sorted(by: >)
```
