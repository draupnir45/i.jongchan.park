# 프로퍼티

## 저장 프로퍼티
- 클래스 또는 구조체 인스턴스에 연관된 값을 저장합니다.
- 기본값(정의할 때)과 초깃값(초기화할 때)을 지원


	### 구조체의 경우
	```swift
	struct PowerPoint {
	    var x: Int
	    var y: Int
	}
	
	let badPoint: PowerPoint = PowerPoint(x: 0, y: 0) //이니셜라이저의 자동 생성
	```
	
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
	
## 지연 저장 프로퍼티
- `lazy`키워드를 붙이면, 호출될 때까지 기다렸다가 할당된다.

## 연산 프로퍼티
- 실제 값을 저장하는 것이 아니라, 다른 프로퍼티의 값을 기준으로 `getter` 역할만 하거나 `setter`역할까지 할 수도 있다.
- `setter`만 할 수는 없다. 

## 프로퍼티 옵저버
- 프로퍼티 값이 변화함에 따라 해야하는 행동을 지정해줄 수 있음.
- 지연 저장 프로퍼티에는 쓸 수가 없음.
	
	```swift
	class Account {
	    var credit: Int = 0 {
	        willSet {
	            print("잔액이 \(credit)원에서 \(newValue)원으로 변화합니다.")
	        }
	        didSet {
	            print("잔액이 \(oldValue)원에서 \(credit)원으로 변화했습니다.")
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
	    override var dollarCredit: Double {
	        willSet {
	            print("잔액이 $\(dollarCredit)에서 $\(newValue)으로 변화합니다.")
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


