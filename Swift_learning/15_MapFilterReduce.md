# 맵, 필터, 그리고 리듀스

## 그 전에 제네릭과 프로토콜
- 제네릭 : 아무 타입이나 쓸 수 있게! `Array<Element>`
- 프로토콜 : 프로토콜 

## 맵
- `for-in`처럼 각 요소에 특정한 행동을 수행해준 후에 그 각각 처리된 요소를 이용한 컬렉션을 만들어줌.

	```swift
	var numbers: [Int] = []
	
	for i in 1...10 {
	   numbers.append(Int(arc4random_uniform(100)))
	}
	
	print(numbers)
	
	var doubled: [Int] = numbers.map { (i: Int) -> Int in
	    return i * 2
	}
	
	print(doubled)
	
	var dbld: [Int] = numbers.map({$0 * 2})
	
	print(dbld)
	```

## 필터


## 리듀스