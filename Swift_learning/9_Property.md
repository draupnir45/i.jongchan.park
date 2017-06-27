# 프로퍼티

## 단어 강박
- 프로퍼티는 **클래스**, **구조체**, **열거형**의 관련값

> Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.
> 
> Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.
> 
> In addition, you can define property observers to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.
> 
> [**The Swift Programming Language - Properties (Swift 3.1)**](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html)

- 번역해보았습니다.

> 프로퍼티는 특정 클래스나 구조체, 열거형에 관련된 값(value)들을 말합니다. 저장 프로퍼티는 상수나 변수를 인스턴스의 일부로 저장하고, 연산 프로퍼티는 값을 (저장하기보다는) 연산합니다. 연산 프로퍼티는 클래스나 구조체, 열거형에서 제공됩니다. 저장 프로퍼티는 클래스와 구조체에서만 제공됩니다.
> 
> 저장 프로퍼티와 연산 프로퍼티는 보통 특정 타입의 **인스턴스**와 연관됩니다. 그러나 프로퍼티는 타입 그 자체와 연관될 수도 있습니다. 그러한 프로퍼티는 타입 프로퍼티라고 부릅니다.
> 
> 추가적으로, 사용자 정의 액션에 응답할 수 있도록 프로퍼티의 값 변화(changes in a property’s value)를 감시하는 프로퍼티 옵저버를 정의할 수도 있습니다. 프로퍼티 옵저버는 당신이 직접 정의한 저장 프로퍼티에 추가할 수도 있고, 부모클래스(superclass)에서 상속받은 프로퍼티에 추가할 수도 있습니다.
> 
> **The Swift Programming Language - Properties (Swift 3.1)**

## 저장 프로퍼티 (Stored Property)
- 클래스 또는 구조체 인스턴스에 연관된 값을 저장합니다.
- 열거형에서는 제공되지 않습니다.
- 기본값(정의할 때)과 초깃값(초기화할 때)을 지원


	### 구조체의 경우
	```swift
	struct PowerPoint {
	    var x: Int
	    var y: Int
	}
	
	let badPoint: PowerPoint = PowerPoint(x: 0, y: 0) //이니셜라이저의 자동 생성
	```
	
	### 상수 구조체 인스턴스의 저장 프로퍼티
	- 구조체 인스턴스가 상수로 생성되어 있다면, 내부에 있는 저장 프로퍼티가 변수로 생성되었다고 한들 상관없이 변경이 불가.

	> This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.
	> 
	> 이 행동은 구조체가 값 타입이기 때문입니다. 값 타입의 인스턴스가 상수로 표현된다면, 그 인스턴스의 모든 프로퍼티 역시 동일하게 상수가 됩니다.

	
	### 클래스의 경우
	```swift
	class PowerPC {
	    var operatingSys: String
	    var centralProcessingUnit: String
	    lazy var mainCase: String = "Apple Case" //지연 저장 프로퍼티 : 필수는 아니지만 쓰면 좋은, 그러나 여러 스레드에서 동시 접근하면 다중 초기화될 수도 있음.
	    //기본값을 지정하거나 옵셔널로 정의한 것은 커스텀 이니셜라이저를 사용하지 않아도 됨.
	    var applications: Array<String>?
	    
	    init(withOS os:String, CPU cpu: String) {
	        self.operatingSys = os
	        self.centralProcessingUnit = cpu
	    }
	}
	
	//커스텀 이니셜라이저를 '호출해야만' 합니다.
	let myComputer: PowerPC = PowerPC.init(withOS: "10.4", CPU: "PotatoChip")
	```
	
	### 지연 저장 프로퍼티
	- `lazy`키워드를 붙이면, 호출될 때까지 기다렸다가 할당된다.
	- 변수만 가능!
	
	> You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
	> 
	> 지연 저장 프로퍼티는 언제나 변수로 선언(`var`키워드를 통해)해야 합니다. 왜냐면 지연 저장 프로퍼티의 초깃값은 인스턴스의 초기화가 완료될 때까지 검색되지(retrieve) 않을 수 있기 때문입니다. 상수 프로퍼티는 **언제나 꼭(must always)** 초기화 완료 전까지 값을 가져야만 하고, 따라서 `lazy`로 선언될 수 없습니다.
	
	### 저장 프로퍼티와 인스턴스 변수
	- 오브젝티브 C에 있는 인스턴스 변수는 Swift에서는 존재하지 않음!
	- 통합하였다고 함.
	
	> Swift unifies these concepts into a single property declaration... All information about the property—including its name, type, and memory management characteristics—is defined in a single location as part of the type’s definition.
	>
	> Swift는 이 두 가지 컨셉을 하나의 프로퍼티 선언으로 통합합니다. (중략) 프로퍼티에 포함된 모든 정보—이름, 타입 그리고 메모리 관리 특징 등—은 타입 정의 속 한 장소에 모여 있게 됩니다.




## 연산 프로퍼티
- 클래스와 구조체, 열거형에 적용 가능.
- 실제 값을 저장하는 것이 아니라, 다른 프로퍼티의 값을 기준으로 `getter` 역할만 하거나 `setter`역할까지 할 수도 있다.
- `setter`만 할 수는 없다. (read-only만 가능, getter만 있는 경우 키워드 생략 가능.)
- var로 지정해야 함.

> You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed. The let keyword is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance initialization.
> 
> 연산 프로퍼티든 읽기전용 연산 프로퍼티든 var 키워드를 통해 변수로 선언해야 합니다. 왜냐 하면 값이 고정되어 있지 않기 때문입니다. let 키워드는 상수만을 위해서, 인스턴스 초기화 때 설정된 값 이외에는 변경될 수 없음을 나타내기 위해서 사용됩니다.

	```swift
	struct CoordinatePoint {
	    var x: Int
	    var y: Int
	    
	    var opposite: CoordinatePoint {
	        
	        get {
	            return CoordinatePoint(x: -x, y: -y)
	        }
	        
	        set(opposite) {
	            x = -opposite.x
	            y = -opposite.y
	        }
	        
	    }
	    
	    var verticalMirrored: CoordinatePoint {
	        get {
	            return CoordinatePoint(x: x, y: -y)
	        }
	        
	        set { //자동으로 newValue 사용됨
	            x = newValue.x
	            y = -newValue.y
	        }
	    }
	    
	    var horizontalMirrored: CoordinatePoint {
            return CoordinatePoint(x: -x, y: y) //읽기전용, getter 단순화
	    }
	}
	```

## 프로퍼티 옵저버
- 프로퍼티 값이 변화함에 따라 해야하는 행동을 지정해줄 수 있음.
- 지연 저장 프로퍼티`lazy var`에는 쓸 수가 없음.
- 상속을 받은 거든 직접 정의한 거든 저장 및 연산 프로퍼티 양쪽에 모두 사용 가능
- 하지만, 사용자가 직접 정의한 연산 프로퍼티의 경우는 애초에 getter와 setter 설정하면서 트래킹이 가능하므로 쓸 이유가 없음. (공식 문서의 NOTE)
	
	```swift
	class Account {
	    var credit: Int = 0 {
	        willSet {
	            print("잔액이 \(credit)원에서 \(newValue)원으로 변화합니다.")
	        }
	        didSet {
	            print("잔액이 \(oldValue)원에서 \(credit)원으로 변화했습니다.")
	            //newValue와 oldValue 등은 자동.
	            //여기에 레이블 등을 연동시킬 수 있을 것 같음.
	        }
	    }
	    
	    var dollarCredit : Double {
	        get {
	            return Double(credit) / 1000.0
	        }
	        set {
	            credit = Int(newValue * 1000)
	            print("잔액을 $\(newValue)로 변경 중입니다.")
	        }
	    }
	}
	
	class ForeignAccount: Account {
	    
	    static var exchangeRate = 1123
	    
	    override var dollarCredit: Double {
	        willSet(powerNew) { //자동 안 쓰고 주는 것도 가능.
	            print("잔액이 $\(dollarCredit)에서 $\(powerNew)으로 변화합니다.")
	        }
	        
	        didSet {
	            print("잔액이 $\(oldValue)에서 $\(dollarCredit)으로 변화했습니다.")
	        }
	    }
	}
	
	var koreanUser: Account = Account()
	koreanUser.credit = 1000
	
	var foreignUser: ForeignAccount = ForeignAccount()
	foreignUser.dollarCredit = 10.5

	```
	### 슈퍼클래스 프로퍼티의 옵저버와 자신의 프로퍼티의 옵저버

	> The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.
	> 
	> 슈퍼클래스 프로퍼티의 willSet과 didSet은 프로퍼티가 슈퍼클래스 초기화 이후 서브클래스 이니셜라이저에서 설정(set)될 때 불립니다.
	
	### 옵저버와 in-out 전달인자
	- in-out으로 보내도 늘 옵저버는 작동함.
	- 나오면서 변화값을 프로퍼티에 반영하기 때문.

## 전역 변수와 지역 변수
- 프로퍼티가 아닌 전역변수나 지역변수에도 사용 가능.
- 전역변수나 상수는 늘 지연 저장되며, 키워드를 쓰지 않아도 됨.

> The capabilities described above for computing and observing properties are also available to global variables and local variables.
> 
> 상술한 연산 프로퍼티와 프로퍼티 옵저버 기능은 (프로퍼티가 아닌)전역 변수나 지역 변수에도 사용이 가능합니다.

## 타입 프로퍼티
 - 인스턴스 생성 여부와 상관없는 프로퍼티.
 - 그렇다는 얘기는 무조건 기본값이 필요. init하지 않기 때문에.
 - 열거형도 가능.

	```swift
	static let pi = 3.1425
	static var date = Date()
	
	enum EraiEnum {
	    case badNum
	    case goodNum
	    
	    static let firstDay = 4
	    static var today = 5
	}
	
	print("상수",EraiEnum.firstDay)
	print("변수",EraiEnum.today)
	EraiEnum.today = 6
	print("변수",EraiEnum.today)
	```