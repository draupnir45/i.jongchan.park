# 기본적인 사항들

## 명명법
- lowerCamelCase : 함수, 메서드, 인스턴스
- UpperCamelCase : 클래스, 구조체, 익스텐션, 프로토콜, 열거형 등 타입의 이름

## 로그
- print() : 일반적인 로그
- dump() : 좀 더 자세한 정보 제공

## 문자열 보간(String Interpolation)
- 문자열 내에 '\(변수나 상수)' 를 추가하여 문자열로 만들고 싶을 때. NSString의 stringWithFormat: 를 훨씬 쉽게 대체해 놓은 것.
- 다만 변수나 상수의 타입이 'CustomStringConvertible' 프로토콜을 준수해야 가능.

## 변수와 상수
- `var` : 변수를 생성.
- `let` : 상수를 생성.
- 기본적으로 모든 것에 `let` 사용, 필요시 Xcode가 불평할 것.
- 타입 추론 : 컴파일러가 값에 따라 추론. 불확실성이 생기므로 왠만하면 명시할 것.

