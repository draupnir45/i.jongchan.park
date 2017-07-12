# 맵, 필터, 그리고 리듀스

사실상 for의 대체품이나 다름이 없습니다. 성능 부분을 한번 확인해볼 필요가 있을 것 같습니다.

## 맵
- `for-in`처럼 각 요소에 특정한 행동을 수행해준 후에 그 각각 처리된 요소를 이용한 컬렉션을 만들어줍니다. 반환하지 않는 클로저를 전달하면 그냥 반복문으로 사용 가능.

	```swift
	//긴 버전
	var doubled: [Int] = numbers.map { (i: Int) -> Int in
	    return i * 2
	}
	print(doubled)
	
	//짧은 버전
	var dbld: [Int] = numbers.map({$0 * 2})
	print(dbld)
	```

## 필터
- `for-in`처럼 각각 해주되, `Bool`값을 반환하면, false인 것들을 뺀 상태의 새로운 컬렉션을 반환해 줍니다.

```swift
//긴 버전
let evens: [Int] = numbers.filter { (i: Int) -> Bool in
    i % 2 == 0
}
print(evens)

//짧은 버전
let evn: [Int] = numbers.filter({$0 / 2 == 0})
print(evn)
```

## 리듀스
- 하나의 결과값을 두고, 거기에 계속 반복된 작업을 해 줍니다. 마지막엔 결과값만 반환합니다.

```swift
//긴 버전
var reduced: Int = evens.reduce(0) { (result: Int, i: Int) -> Int in
    return result + i
}
print(reduced)

//짧은 버전
var rdcd: Int = evens.reduce(0, {$0 + $1})
print(rdcd)
```