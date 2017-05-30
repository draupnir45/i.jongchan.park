# 메서드

## 단어 강박
- 메서드는 **클래스**, **구조체**, **열거형**에 관련된 함수.

> Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structures, and enumerations can also define type methods, which are associated with the type itself. Type methods are similar to class methods in Objective-C.
> 
> The fact that **structures** and **enumerations** can define methods in Swift is a major difference from C and Objective-C. In Objective-C, classes are the only types that can define methods. In Swift, you can choose whether to define a class, structure, or enumeration, and still have the flexibility to define methods on the type you create.
> 
> [**The Swift Programming Language - Methods (Swift 3.1)**](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Methods.html#//apple_ref/doc/uid/TP40014097-CH15-ID234)

- 번역해보았습니다.

> 메서드는 특정 타입과 연관된 함수들입니다. 클래스, 구조체, 그리고 열거형은 모두 인스턴스 메서드를 정의할 수 있습니다. 인스턴스 메서드는 특정 작업과 기능을 캡슐화하여 각 주어진 타입의 인스턴스와 함께 작동합니다. 클래스, 구조체, 그리고 열거형은 각 타입 그 자체와 연관되는 타입 메서드 역시 정의할 수 있습니다. 타입 메서드는 오브젝티브 C에서의 클래스 메서드와 유사합니다.
> 
>  Swift에서 구조체와 열거형에 메서드를 정의할 수 있다는 사실은 C와 Objective-C 와의 큰 차이입니다. Objective-C에서는 클래스만이 메서드를 정의할 수 있는 타입이었습니다. Swift에서는 메서드를 정의할 수 있는 유연성을 유지한 채로도 클래스, 구조체, 열거형 중에서 선택할 수 있는 가능성이 열려 있습니다.
> 
> **The Swift Programming Language - Methods (Swift 3.1)**

## 인스턴스 메서드
- 인스턴스가 존재할 때만 사용 가능.
- 구조체의 내부 변수값을 바꾸는 메서드의 경우 `mutating` 키워드를 붙여주어야 한다.

```swift
struct StructForTest {
    var myVariable: Int = 20
    
    mutating func signChange() {
        myVariable = -myVariable
    }
    
}
```

## 타입 메서드
- 타입 그 자체에 쓸 수 있는 메서드.
- `static`으로 정의함. 클래스의 경우 `class`가 가능.
- 상속 후 재정의 가능성 때문에 클래스만 `class`키워드를 따로 지정. `static`으로 쓰면 재정의 불가능... 짜봐야 알듯.

	```swift
	class TestingClass {
	    
	    class func classFuction() {
	        print("클래스 메서드입니다.")
	    }
	    
	    static func staticFuction() {
	        print("스태틱 메서드입니다.")
	    }
	    
	}
	
	class subclassOfTestingClass: TestingClass {
	    class func classFunction() {
	        print("재정의가 가능!")
	    }
	    
	//    override static func staticFuction() { //cannot override static method
	//        print("스의틱 메서드 재정의입니다.")
	//    }
	
	}
	```