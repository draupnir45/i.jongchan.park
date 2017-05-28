# 클로저
- 블록같은 녀석. 즉, 실행코드를 막 넘기고 막. 막ㅁ마. 다 해써 인마.
- 블록이랑 크게 개념이 다르지 않으니 너무 겁먹지 말 것. 다만 표현법이 아주 다양하다.

## 표현법
- 통상적으로는 아래와 같음.

	```swift
	{(parameters) -> ReturnType
		implementation
		return returnValue //있을 경우만!
	}
	```

- 예전의 코드도 보자. 생략의 HELL

	```swift
	//아래 names 어레이를 역순으로 정렬하는 코드들.
	let names:[String] = ["wizplan", "eric", "yagom", "jenny"]
	
	//풀버전. first와 second를 가지고 어느 게 first가 클 때 true를 반환하는 클로저를 전달.
	let reversedFull: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
	    return first > second
	})
	
	//후행 클로저로 변환. sorted 함수가 받는 인자 이름 'by'와 함께 소괄호 생략, 각 인자 타입도 생략. 자동완성 기능이 추천하는 클로저 형태 (2017년 5월).
	let reversedAuto: [String] = names.sorted { (first, second) -> Bool in
	    return first > second
	}
	
	//어차피 sorted가 받는 형태도 정해져 있고, 전달할 때도 Bool 전달하니까, 반환값 명시와 구분을 위한 괄호 생략
	let reversed: [String] = names.sorted { first, second in
	    return first > second
	}
	
	//어차피 의미도 없는 first와 second 생략. 그냥 $0이랑 $1으로 대체하고 그냥 리턴
	let rvsd: [String] = names.sorted {
	    return $0 > $1
	}
	
	//한 줄만 있으면 자동으로 리턴값 취급하므로 리턴도 생략..
	let rv: [String] = names.sorted {
	    $0 > $1
	}
	
	// '>' 연산자도 함수고 어차피 두개 받아 Bool 리턴하는 거 똑같으니까( (_:,_:) -> Bool ) 그냥 >이것만 전달. 전달할 함수만 준비되어 있다면 자동완성으로 가능. (2017년 5월)
	let r: [String] = names.sorted(by: >)
	```
	
## 캡처! Close!
- 중첩 함수의 경우 상위 함수가 가진 아이를 capture해서 들고 있을 수 있다.
- 상위 함수가 가져온 전달인자는 물론 함수 내부의 지역변수도 들고 있는다.
- 일반적인 생명주기와 다른 행동이 일어나는 부분을 주목하자!

	```swift
	//캡처하는 광경
	func makeIncrementor(for amount: Int) -> (()->Int) {
	    var totalVariableForCapturing: Int = 0
	    func resultClosure() -> Int {
	        totalVariableForCapturing += amount
	        return totalVariableForCapturing
	    }
	    return resultClosure
	}
	
	let incrementor2: Incrementor = makeIncrementor(for: 2)
	print(incrementor2()) // 2
	print(incrementor2()) // 4
	print(incrementor2()) // 6
	print(incrementor2()) // 8
	```
	
## 탈출!!
- `completion` 형태 등 함수 외부로 매개변수로 받은 클로저를 넘겨야 할 때가 있는데, 그럴 때 명시해주어야 함.
- 키워드 `@escaping`을 사용한다.  반환하거나 다른 데로 보낼 때 쓴다.
- 어디보자...

	```swift
	//전달받은 클로저가 외부로 나갈 수 있기 때문에 @escaping 키워드 필요.
	func checkEvenIncrementor(_ array: [Incrementor], _ incrementor: @escaping Incrementor) -> [Incrementor] {
	    
	    let firstInt: Int = incrementor()
	    let secondInt: Int = incrementor()
	    if (secondInt - firstInt) % 2 == 0 {
	        var resultArray = array
	        resultArray.append(incrementor)
	        return resultArray
	    } else {
	        return array
	    }
	}
	
	func someOtherFunction(closure:@escaping Incrementor) {
	    checkEvenIncrementor(evenIncrementorArray, closure)
	}
	
	var evenIncrementorArray: [Incrementor] = []
	
	for i in 1...30 {
	    let incrementor: Incrementor = makeIncrementor(for: i)
	    evenIncrementorArray = checkEvenIncrementor(evenIncrementorArray, incrementor)
	}
	
	for incrementor in evenIncrementorArray {
	    print("\(incrementor()/3)")
	}
	```
	
## 참조 타입이다!
- class 말고도 있었다니...
- 포인터를 넘겨줌. Block도 그랬던가...

## 자동 클로저
- 구현할 일은 많지 않을 것..
- 암튼, 보자.

	```swift
	var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
	let customerClosure: () -> String = {customersInLine.remove(at: 0)}
	func serve(customer customerProvider: @autoclosure () -> String) {
	    print(customersInLine, "실행함수안, 실행전")
	    print("Now serving \(customerProvider())!")
	    print(customersInLine, "실행함수안, 실행후")
	}
	func serveByStr(customer customerProvider: String) {
	    print(customersInLine, "스트링버전실행함수안, 실행전")
	    print("Now serving \(customerProvider)!")
	    print(customersInLine, "스트링버전실행함수안, 실행후")
	}
	
	print(customersInLine, "실행전")
	serve(customer: customersInLine.remove(at: 0))
	print("\n\n스트링버전")
	print(customersInLine, "실행전")
	serveByStr(customer: customersInLine.remove(at: 0))
	```
- 결과창

	```
	클로저버전
	["Chris", "Alex", "Ewa", "Barry", "Daniella"] 실행전
	["Chris", "Alex", "Ewa", "Barry", "Daniella"] 실행함수안, 실행전
	Now serving Chris!
	["Alex", "Ewa", "Barry", "Daniella"] 실행함수안, 실행후
	
	
	스트링버전
	["Alex", "Ewa", "Barry", "Daniella"] 실행전
	["Ewa", "Barry", "Daniella"] 스트링버전실행함수안, 실행전
	Now serving Alex!
	["Ewa", "Barry", "Daniella"] 스트링버전실행함수안, 실행후
	Program ended with exit code: 0
	```