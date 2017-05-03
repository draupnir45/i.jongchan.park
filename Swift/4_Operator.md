# 연산자
잊을 법한 부분만 정리하였습니다.

### 참조비교
`A === B`, `A !== B`등으로 비교. 스위프트의 유일한 참조 타입은 클래스의 인스턴스에서만 사용이 가능.

### 삼항 조건 연산자
`Question? T : F` 물음표 앞이 참이면 T, 아니면 F 반환.

### 범위 연산자
- 폐쇄 범위 : `A...B` A와 B를 다 포함.
- 반폐쇄 범위 : `A..<B` B를 포함하지 않음.

### 오버플로 연산자
- `&+`, `&-`, `&*` : 오버플로에 대비하여 연산.

### `nil`병합 연산자
- `A ?? B` : A가 nil이면 B를 반환.

### `optional` 관련
- 옵셔널 강제 추출 연산자 `object!` : 옵셔널 객체의 값을 강제로 추출합니다. (즉 옵셔널이 아니라는 확신이 있을 때 쓴다.)
- 옵셔널 연산자 `value?` : 옵셔널임을 표현합니다.

### class나 struct에 대하여 중위 연산자 구현
- 커스텀 클래스나 구조체에 대해 유용하게 쓰일 수 있는 '비교' 연산자를 구현해줄 수 있다!

  ```swift
	class Car {
		var modelYear: Date?
		var modelName: String?
		var registerNumber: Int?
	}
	
	struct SmartPhone {
	    var modelName: String?
	    var phoneNumber: Int?
	}
	
	//클래스나 구조체나 상관 없이 프로퍼티 중 비교할 것만 비교해서 반환이 가능.
	func == (left: Car, right:Car) -> Bool {
	    return left.registerNumber == right.registerNumber
	}
	
	func == (left: SmartPhone, right: SmartPhone) -> Bool {
	    return left.phoneNumber == right.phoneNumber
	}
	
	```