# 흐름 제어
([playground](5_ControlFlow.playground))

## if
- 다 똑같은데 값이 꼭 Bool이어야 함. 0이나 nil이나 암튼 딴걸로 안 됨. 그냥 `true` or `false`

## switch
- 기존 언어와 가장 많이 달라진 부분. enum이 다양하게 활용될 수 있게 바뀐 것에 맞추어 좋아짐.
- 정수형 이외의 값이 들어갈 수 있으며, 정수 구간도 적용이 가능. ex) `case 1...9:`
- `break` : 선택사항. 없더라도 해당 케이스가 실행되면 바로 나가버림.
- `fallthrough` : `break` 하지 않고 그냥 계속 진행되게 할 때 사용. *별로 안 하고 싶다.*
- `default:` : 열거형 등이 아닌 경우에는 꼭 필요. *역시나... 왠만하면 열거형으로 쓰고 싶다.*
- `where` : 조건을 확장할 때 사용
	
	```swift
	let randomInt: Int = Int(arc4random()%501)
	var str = "Hello"
	
	//범위와 중첩이 가능. 여러 케이스를 하나로 묶을 때는 쉼표로만.
	switch randomInt {
	case 0...99, 200...299, 400...499:
	    print("\(randomInt), 백의 자리가 0이거나 짝수")
	default:
	    print("\(randomInt), 백의 자리가 홀수")
	}
	
	//스트링, 더블 등도 사용 가능. 당연히 enum도 가능.
	switch str {
	case "Hello":
	    print(str)
	default:
	    print("Not Right")
	}
	
	//튜플도 가능. 사용시 와일드카드 적용이 가능, 동시에 값을 바인딩해서 불러오는 것도 가능.
	typealias Person = (name: String, age: Int, height: Double)
	
	let jongchan:   Person = ("종찬", 31, 174.5)
	let byeongjun:  Person = ("병준", 31, 176)
	let junmin:     Person = ("준민", 33, 170)
	let youngjin:   Person = ("영진", 31, 178)
	
	let tupleArr: [Person] = [jongchan, byeongjun, junmin, youngjin]
	let index: Int = Int(arc4random()%4)
	let testingTuple: Person = tupleArr[index]
	
	switch testingTuple {
	case (_, 31, _):
	    print("동갑이네!")
	    fallthrough
	case ("종찬", 31, 174.5):
	    print("나네!")
	case ("준민", let age, _):
	    print("\(age)살인 준민형이네!")
	default:
	    print("뭐야?")
	}
	
	//연관값으로는 검사는 안 되고 전달만 가능. 그래도 유용!
	enum Burger: String {
	    case beef = "버거", cheese = "치즈버거", chicken = "치킨버거", fish = "생선버거"
	}
	enum Drink {
	    case coke, zeroCoke
	}
	enum Fries {
	    case french, onion
	}
	enum BurgerSet {
	    case fullSet(burger: Burger, drink: Drink, fries: Fries)
	    case combo(burger: Burger, drink: Drink)
	    indirect case doublePack(firstSet: BurgerSet, secondSet: BurgerSet)
	}
	
	var order1: BurgerSet = BurgerSet.fullSet(burger: Burger.chicken,
	                                          drink: Drink.coke,
	                                          fries: Fries.french)
	var order2: BurgerSet = BurgerSet.doublePack(firstSet: .fullSet(burger: .chicken,
	                                                                drink: .zeroCoke,
	                                                                fries: .onion),
	                                             secondSet:   .combo(burger: .cheese,
	                                                                 drink: .coke))
	
	
	//where을 이용해 검사. 연관값 등은 와일드카드로 빼서 검사가 가능.
	switch order1 {
	case .fullSet(let burger , _, _) where (burger.rawValue == "치즈버거") :
	    print("\(burger.rawValue)세트 하나요!")
	    
	case .fullSet(let burger , _, _) where (burger.rawValue != "치즈버거") :
	    print("\(burger.rawValue)세트 하나요!")
	
	case .combo:
	    print("세트 하나요!")
	case .doublePack:
	    print("세트 하나요!")
	default :
	    print("got")
	}
	
	//Apple 예제. where을 이용해 검사.
	let yetAnotherPoint = (1, -1)
	switch yetAnotherPoint {
	case let (x, y) where x == y:
	    print("(\(x), \(y)) is on the line x == y")
	case let (x, y) where x == -y:
	    print("(\(x), \(y)) is on the line x == -y")
	case let (x, y):
	    print("(\(x), \(y)) is just some arbitrary point")
	}
	
	```
	
## for-in
- 똑같음. 딕셔너리의 경우는 튜플로 값이 넘어옴.

## while
- 똑같음. 단 do-while이 아니라 repeat-while

## 반복구문 이름표
- 반복구문 그 자체에 이름표를 붙여 제어가 가능.

  ```swift
  반복구문이름: while 조건 {
    실행문
  }
  ```