# 기본 데이터 타입
**모두 구조체**로 이루어져 있음. 구조체에 익스텐션, 제네릭 등을 사용할 수 있도록...내용 나중에 추가 필요.
([playground](BasicDataTypes.playground))

## Int와 UInt
- 각 환경에 따라 그 범위가 달라지는 정수 데이터타입. 
- Int의 양수 범위를 넘어서는 양수를 사용하지 않을 경우 Int 사용.
- UInt의 경우 마이너스값을 계산하면 바로 오류.

## Bool
- `true`와 `false`로 표현됨
- 0이나 1을 할당하는 것이 불가능. 키워드로만 가능함.

## Float과 Double
- 부동소수점 표현용 실수타입
- 기본적으로 타입추정은 `Double`이며, 어떤 게 좋은 지 판단이 안 설 때에도 기본적으로 `Double` 사용.

## String
- Objective-C의 `NSString`과 달리 자료형!
- 문자열을 다루기 위한 많은 메서드, 프로퍼티가 정의되어 있어 사용이 간편하다.
	
	```swift
	//Appending 연산자 "+"
	    let someString: String = "Hello, " + "World!"
	    let anotherString: String = "Hello, World!"
	    
	//비교연산자 사용 가능
	    if someString == anotherString {
	        print("이렇게 그냥 됩니다!")
	    }
	    
	//앞에 혹은 뒤에 어떤 문자열이 있는지 확인 가능!
	    if someString.hasPrefix("He") {
	        print("앞에 문자열이 있는지 확인")
	    }
	    if someString.hasSuffix("!") {
	        print("뒤에 문자열이 있는지 확인")
	    }
	    
	//대문자로, 소문자로 변경해서 반환하는 함수
	    let UPPERCASED = someString.uppercased()
	    let lowercased = UPPERCASED.lowercased()
	
	//원래 문자는 바뀌지 않고, 덤으로 문자열 보간법
	    print("원래 자료인 \(someString)는 바뀌지 않습니다.")
	
	```
	
## 특수문자
- `\n`: 줄바꿈
- `\\`: 백슬래시
- `\"`: 쌍따옴표
- `\t`: 탭
- `\0`: 문자열이 끝났음을 알림

## Any, AnyObject와 nil
- 아무거나 할당할 수 있는 타입.
- AnyObject에는 클래스의 인스턴스인 오브젝트만 할당 가능.
- nil은 '없음'

## Never
- 나중에 추가

