# 메서드
특정 타입 내부에 속한 함수.
함수와 문법이 같지만, 정의된 타입의 인스턴스가 존재해야만 사용 가능.

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