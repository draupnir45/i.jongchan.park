# 이니셜라이저

- 클래스, 구조체, 열거형의 인스턴스를 생성하는 것.
- 반환값이 없음. 왜 굳이.
- `func`도 사용하지 않음
- 구현부 혹은 익스텐션에 위치 (클래스의 지정 이니셜라이저의 경우 불가)

###`enum`의 이니셜라이저

- 반드시 케이스 중 하나로 이니셜라이즈 해야 함. 
- `init`에서 `self`가 사용 가능.

	```swift
	enum testCase {
	    case firstCase
	    case secondCase
	    case defaultCase
	    
	    init() {
	        self = .defaultCase
	    }
	    
	}
	```

## 프로퍼티의 기본값

- **기본값(default value)** : initial value가 아니다. 외부에서 따로 초깃값을 지정해주지 않을 때 초깃값이 되는 것이 기본값이다. 혼란을 방지하기 위해 기본 초깃값(default initail value)으로 쓰는 게 좋겠다.
- 아무튼 중요한 것은, **프로퍼티는 옵셔널이 아닌 한 비어있을 수 없다.** 이것이 확정적이며 불가역적인 명제이다. = 늘 만족시킬 수 있는 코딩이 필요. = 만족하지 않으면 아예 안 돌아간다.
- 기본값은 기본 `init()`이나 선언시 할당이 가능. 만약 `init`을 여러 종류 쓰면서 할 경우가 아니라면 선언시 하는 것이 더 깔끔.

	```swift
	//두 가지 방법
	struct TestStruct {
	    var property1: Int = 0
	    var property2: Int
	    
	    init() {
	        self.property2 = 1
	    }
	}
	
	var myStruct:TestStruct = TestStruct.init() //자동 init(_:, _:)이 없어짐.
	```
	
## 추가사항

- 당연히 매개변수 추가가 가능.
- 옵셔널 프로퍼티의 경우는 초기화때 값 지정이 힘든 경우 사용, 자동으로 `nil`할당
- `let` 의 경우 초깃값 할당 이후 변경 불가능.
- 커스텀 이니셜라이저를 사용하면 기본 이니셜라이저나 멤버와이즈 이니셜라이저를 무효화시킴.

## 멤버와이즈 이니셜라이저

- [구조체 설명 참고](8_ObjectOrientedProgramming.md)
- 구조체에서 기본 제공되는 이니셜라이저

## 초기화 위임(init 안에서 init 부르기)

- 커스텀 이니셜라이저 안에서 다른 이니셜라이저를 부르는 것. = 커스텀 이니셜라이저를 지정하는 순간 기본과 멤버와이즈 이니셜라이저가 없어지므로, 기본 이니셜라이저를 사용하려면 사용자가 직접 커스텀처럼 작성해주어야 한다.
- `enum`에서 신나게 불러보자

	```swift
	enum RecipeCost {
	    
	    case under10
	    case over10Under20
	    case over20Under30
	    case over30
	    
	    init(with cost:Double){
	        if cost <= 10.0 {
	            self = .under10
	        } else if cost > 10.0 && cost <= 20.0 {
	            self = .over10Under20
	        } else if cost > 20.0 && cost <= 30.0 {
	            self = .over20Under30
	        } else {
	            self = .over30
	        }
	    }
	    
	    init(withKRW koreanWonCost: Int) {
	        let dollarCost: Double = Double(koreanWonCost) / 1123.4
	        self.init(with: dollarCost)
	    }
	}
	
	
	let cost:RecipeCost = RecipeCost.init(withKRW: 24000)
	```

## 실패가능한 이니셜라이저

- 들어온 값으로 초기화가 불가능할 경우 `nil`을 돌려주는 이니셜라이저
- 리턴값 명시도 없는 주제에 `return nil` 사용.
- 백문일 불여일RUN

	```swift
	enum RecipeCost {
	    
	    case under10
	    case over10Under20
	    case over20Under30
	    case over30
	    
	    init?(with cost:Double){
	        if cost <= 10.0 {
	            self = .under10
	        } else if cost > 10.0 && cost <= 20.0 {
	            self = .over10Under20
	        } else if cost > 20.0 && cost <= 30.0 {
	            self = .over20Under30
	        } else if cost > 30.0 {
	            self = .over30
	        } else {
	            return nil
	        }
	    }
	    
	    init?(withKRW koreanWonCost: Int) {
	        let dollarCost: Double = Double(koreanWonCost) / 1123.4
	        self.init(with: dollarCost)
	    }
	}
	
	
	let cost:RecipeCost? = RecipeCost.init(withKRW: 24000)
	```
	
	
## 클로저를 통한 기본값 세팅

- 반환값이 있는 함수를 넘기면서 세팅도 가능하다.

	```swift
	//프로퍼티 기본초깃값을 세팅하는 3가지 방법!
	struct TestStruct {
	    let property1: Int = 0
	    let property2: Int
	    let property3: TestCase = {
	       return TestCase.firstCase
	    }()
	    
	    init() {
	        self.property2 = 1
	    }
	}
	```
	
## 디이닛

- 응 디이닛.
- 클래스에만 됨.