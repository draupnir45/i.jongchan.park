# 옵셔널 체이닝, 그리고 빠른 종료

## 옵셔널 체이닝 
- 윗물이 맑으면 아랫물은 괜찮을 수도 있다.
- 체이닝의 끝은 늘 `Optional`!
- 바인딩과 함께 써 보도록 하자.
- 백견이 불여일RUN

	```swift
	//옵셔널인 놈에게만 궁금증을 가진다!
	ash?.bag.badgeCase?.append(grayBadge)
	
	//바인딩과 함께 바인딩!
	if let firstBadge = ash?.bag.badgeCase?[0] {
	    print(firstBadge)
	}
	```
	
## 빠른 종료
- `guard let`
- 한 코드 블럭에서 여러 개의 옵셔널을 다루어야 할 때가 있다. 쓸 때마다 언
- 함수, 메서드, 반복문 등 특정 블록 내에서만 사용이 가능.
- 반환값이 있는 함수 내에서 사용할 경우 반환값을 요구하기도 한다.

	```swift
	func greet(person: [String: String]) {
	    guard let name = person["name"] else {
	        return
	    }
	    
	    print("Hello \(name)!")
	    
	    guard let location = person["location"] else {
	        print("I hope the weather is nice near you.")
	        return
	    }
	    
	    print("I hope the weather is nice in \(location).")
	}
	
	//From Apple Docs.
	```