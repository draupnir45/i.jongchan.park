# 함수
([playground](6_Functions.playground))

## 특징
- 소괄호의 생략이 불가능 - 즉 소괄호와 func로 함수를 알아볼 수 있음.
- 타입에 민감한 스위프트답게, 매개변수의 타입이 다른 경우 서로 다른 함수로 인식, 매개변수가 다른 동일한 이름의 여러 함수를 정의하는 것이 가능.

## 정의하기
 - 기본 형태

 ```swift
 	func 함수이름(매개변수이름 전달인자레이블: 매개변수타입, 매개변수이름 전달인자레이블: 매개변수타입 = 기본값) -> 반환값타입 {
 		실행구문
 		return 반환값
 	}
 	
 	func functionName(parameterName argumentLabel1: ParameterType, parameterName argumentLabel2: ParameterType = defaultValue) -> ReturnType {
 		implementation
 		return value
 	}
 	
 ```

- 이름

 ```swift
 	//정의
 	func cellForRow(at indexPath: IndexPath) -> UITableViewCell?
 ```
 위와 같이 정의된 함수의 이름은 `cellForRow(at:)` 이다. 따라서 매개변수의 이름을 변경하면 서로 다른 함수가 됨.
 
## 기본값
함수 이름에 매개변수의 기본값을 할당할 수 있으며, 따로 인자가 넘어오지 않으면 기본값으로 사용. 사용시 기본값이 있는 매개변수는 아예 안 넘겨도 괜찮음. **테스트 필요!**

## 가변 매개변수
- 한 가지 타입의, 0을 포함 n개의 변수를 받을 수 있는 방식.
- 한 함수에 하나만 존재할 수 있으며, 내부에서는 배열로 쓸 수 있다.

## 입출력 매개변수
- 참조타입을 전달할 수 있습니다.
- 사용 지양.
- inout을 적을 수 있다.

## 함수도 데이터 타입
- 형태에 이름을 붙이는 것이 가능. 블록처럼.

 	```swift
	typealias 함수타입이름 = (매개변수타입, 매개변수타입) -> 반환타입
	typealias FunctionTypeName = (ParameterType, ParameterType) -> ReturnType
 	```

- 중첩해서 함수를 반환하는 것도 가능.

## 종료되지 않는 함수
- 문제가 생겼을 때 종료되지 않도록 만든 것. Never 타입을 반환한다.