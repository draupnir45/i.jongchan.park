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
	
