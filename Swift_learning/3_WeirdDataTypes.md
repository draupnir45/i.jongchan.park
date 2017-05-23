# 이상한 스위프트 나라의 데이터 타입 이야기
([playground](3_WeirdDataTypes.playground))

## Type-safe
- 타입을 안심하고 사용할 수 있다  == 컴파일할 때 그만큼 엄격하다는 뜻!
- 암튼 첫째도 타입 둘째도 타입. 타입만 잘 지정하면 그 다음부턴 세상 편하다!

## 타입 별칭
- 데이터 타입이 몇몇가지로 지정되어 있고, 나머지는 모두 객체(참조 타입)로 쓰면서 데이터 타입들만 특별히 다루었던  Objective-C와 달리, 객체보다는 좀더 데이터 타입에 집중하기 시작했다.
- 따라서 데이터 타입도 클래스처럼 정의하거나 별칭을 붙여서 활용할 수 있게 되었다. 좀더 현실화된 것.
- 상황에 따라 적절한 이름을 붙여서 가독성을 높일 수 있을 것 같다!
  
  ```swift
	//이름을 지정할 수 있다. 지정 후에도 기존 이름을 사용할 수도 있다.
	typealias JCInt = Int64
	typealias JCUInt = UInt64
	
	let a: JCInt = 100
	let b: Int64 = 100
  
  ```
  
## 튜플
- 데이터의 묶음.
- 타입 이름이 따로 필요없지만, 별칭을 주어서 묶을 수 있으며 그 경우 재사용이 가능.

  ```swift
	//따로 타입 이름이나 데이터 이름을 지정하지 않고 쓰는 경우. 변수명에 점을 찍고 인덱스를 적는 것으로 받아오고 할당할 수 있다. (할당은 var일 때만)
	var chani: (String, Int, Double) = ("jongchan", 31, 174.5)
	
	chani.1 = 32
	dump(chani) //값 전부 로그에.
	
	//요소와 튜플 형태 자체에 이름을 지정
	typealias Person = (name: String, age: Int, height: Double)
	
	let jongchan: Person = ("Jongchan", 32, 174.5)
	
	//데이터기 때문에 할당할 때 값만 복사해온다.
	var clone: Person = ("Jongchan", 31, 174.5)
	
	dump(jongchan)
	
	//연산자로 비교도 가능. 값타입이기 때문에 같으면 그냥 같다.
	if clone == jongchan {
	    dump("same!")
	} else {
	    dump("nope!")
	}
	
	clone.age = 32
	
	if clone == jongchan {
	    dump("same!")
	} else {
	    dump("nope!")
	}
	
	// 아래 둘 다 불가. let이면 그냥 상수값.
	// jongchan.age = 32
	// jongchan = clone 
	```
	
	
## 배열 ***짱***

- 객체가 아니다. ***짱***.
- 기존의 `NSArray`, `NSMutableArray` 대신 데이터 타입의 `Array` 추가됨. let과 var로 뮤터블인지 아닌지 결정한다. ***짱짱***. 
- 객체만 담던 사촌형들이랑 달리 다 담을 수 있다. ***짱짱짱***.
- 근데 서로 다른 타입(값이든 객체든)은 못 담는다. (그런건 튜플로 해염. 사실 별 필요도 없다.) 그래서 어떤 타입을 담는 배열인지 표시해주어야 한다. ***괜차네***
- 사실은 Linked-List의 형태임.

	```swift
	//선언
	var names: [String] = []
	names.isEmpty
	
	//붙이기
	names.append("jongchan")
	names.append("byeongjun")
	names.append("junmin")
	names.append("youngjin")
	
	//선언 안해도 한방에 만들면 괜춘. but 왠만하면 쓰지 말자
	let ages = [31, 31, 33, 31]
	type(of: ages)
	
	//삽입하기. 빈 어레이에다가는 0만 가능.
	var heights: [Double] = [174.5, 170, 178.0]
	heights.insert(174.5, at: 0)
	
	//튜플을 넣어 봅시다.
	var personArray: [Person] = []
	for i in 0...3 {
	    let person: Person = (name: names[i], age: ages[i], height: heights[i])
	    personArray.append(person)
	}
	dump(personArray)
	
	personArray[0].name // "jongchan"
	personArray.count // 4
	```
	
## 딕셔너리
- 어레이와 비슷한 특성들을 담고 있음
- 백문이 불여일RUN

	```swift
	//선언
	var dict: [String: Person] = [:]
	//[String: Any]//요렇게 하면 아무거나 넣을 수 있다. 하지만 가져올 때 캐스팅해줘야 할수도 있으니... 좋은 방법을 고민해보자.
		
	//아이템 추가. 그냥 리터럴에 할당하면 생성됨
	for i in 0...3 {
	    dict[personArray[i].name] = personArray[i]
	}
		
	dump(type(of: dict["jongchan"])) //[String: Any]로 생성된 경우에는 Any 로 나온다.

	```
	
## 세트
- 순서 없음
- 모든 값이 유일
- 해시 가능한 값(Hashable)만 들어와야 함. 기본 데이터 타입은 모두 가능.
- 무조건 `Set<Type>`으로 써야 함
- `insert(_:)`와 `remove(_:)` 메서드로 추가 및 삭제

	```swift
	var seedSet: Set<String> = []
		
	for name in names {
	    seedSet.insert(name)
	}
		
	//seedSet.remove("jongchan")
		
	for name in seedSet {
	    print(name)
	}
		
	//스트링 셋을 정의
	typealias StringSet = Set<String>
		
	//샘플용 셋들
	let seokchonSeoulSet: StringSet = ["jongchan", "byeongjun", "junsuk"]
	let dokhanPeopleSet: StringSet = ["jongchan", "junmin", "youngjin", "byeongjun", "hyeonjung", "donghee"]
		
	//교집합, 여집합의 합, 합집합, 차집합.
	let intersectSet: StringSet = seedSet.intersection(seokchonSeoulSet)
	let symetricDiff: StringSet = seedSet.symmetricDifference(dokhanPeopleSet)
	let unionSet: StringSet = seedSet.union(seokchonSeoulSet)
	let subtracktedSet: StringSet = seokchonSeoulSet.subtracting(seedSet)
		
	//서로 배타적인지, 포함되는지, 포함하는지.
	symetricDiff.isDisjoint(with: seokchonSeoulSet)
	seedSet.isSubset(of: dokhanPeopleSet)
	dokhanPeopleSet.isSuperset(of: seedSet)
	```
	
	
## 열거형
- 기존 `NS_ENUM`과 달리, 기본 정수형으로 정의되지 않음.
- 기존 `UITableViewStylePlain`처럼 plain을 위해 제목을 모두 쓸 필요 없으며, 점 접근법(dot notation)으로 제목과 붙입니다.
- 지정한 형태(strings, characters, or any of the integer or floating-point number types)의 원시값(rawValue)과 연관값을 가질 수 있습니다. 

	```swift
	//원시값을 가지는 열거형
	enum Hometown: String {
	    case seoul      = "서울"
	    case gimcheon   = "김천"
	    case incheon    = "인천"
	    case unknown
	}
		
	typealias HometownAddedPerson = (name: String, age: Int, height: Double, hometown: Hometown)
		
	var newPersonArray: [HometownAddedPerson] = []
		
	for person in personArray {
	    var newPerson: HometownAddedPerson = (person.name, person.age, person.height, Hometown.unknown)
	    newPersonArray.append(newPerson)
	}
		
	newPersonArray[0].hometown = Hometown.seoul
	newPersonArray[1].hometown = Hometown.gimcheon
	newPersonArray[2].hometown = Hometown.incheon
	newPersonArray[3].hometown = Hometown.seoul
		
	for person in newPersonArray {
	    print("\(person.name)의 고향은 \(person.hometown.rawValue)입니다.")
	}
		
	//연관값과 순환 열거형을 이용한 연동
	enum Burger {
	    case beef, cheese, chicken, fish
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
		
	var order1: BurgerSet = BurgerSet.fullSet(burger: Burger.cheese, drink: Drink.coke, fries: Fries.french)
	var order2: BurgerSet = BurgerSet.doublePack(firstSet: BurgerSet.fullSet(burger: .chicken, drink: .zeroCoke, fries: .onion), secondSet: .combo(burger: .cheese, drink: .coke))
	```
