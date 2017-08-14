# Monad

> **Monad**
> [|mɑ:nӕd;|moʊn-]
> 
> (철학)모나드(무엇으로도 나눌 수 없는 궁극적인 실체)
> 
> <p align = right>Oxford Advanced Learner's English-Korean Dictionary </p>

...왜 이 개념이 이렇게 쓰였는지는 아직 모르겠습니다. 더 공부해 보겠습니다.

## 컨텍스트
- 맥락. 어떤 위치에 어떤 값이 존재할 수 있는 맥락.
- 옵셔널은 맥락은 존재하지만 값이 필연적으로 존재하지는 않을 수도 있는 부분에 들어감.
- 값과 컨텍스트는 다르다. 그래서 옵셔널은 값을 대신할 수 없다!

```swift
func add3(to int: Int) -> Int {
    return int + 3
}
	
add3(to: Optional(2)) // 오류! 
// 값이 들어가야 하는 곳에 컨텍스트만이 들어갔다.
```

## 함수객체
- 함수객체란 맵을 적용할 수 있는 컨테이너 타입 (Optional, Array, Dictionary...)
- 옵셔널은 컨테이너, 함수 객체. map을 사용하는 것이 가능하다.
- 컨테이너를 해제하지 않은 채로 값을 연산한 후 되돌려준다.

```swift
var optionalNumber: Int? = 2
	
print( optionalNumber.map({ add3(to: $0) }) ) //Optional(5), 2번 연산
	
optionalNumber = nil
	
print( optionalNumber.map({ add3(to: $0) }) ) //nil, 연산 횟수는 없다?
```

## 모나드
- 값이 있을지 없을지 모르는 컨텍스트를 가지는 함수객체
- 대표적으로 옵셔널. 혹은 옵셔널을 값으로 가지는 콜렉션 [Int]같은 것들.
- 여기에 대응하는 것이 flatMap! 값이 있을지 미지수인 컬렉션을 쉽게 조작할 수 있도록 해줍니다.

```swift
let possibleNumberStringArray: [String] = ["2", "아닌데?", "103", "323"]

let numbers: [Int] = possibleNumberStringArray.map { Int($0) }.flatMap { $0 }

print(numbers) //[2, 103, 323]

let oneLineSumWithFunctionChaining: Int = possibleNumberStringArray.map { Int($0) }.flatMap { $0 }.reduce(0){ $0 + $1 }

print(oneLineSumWithFunctionChaining) //428
```

## 나가면서
여전히 왜 '궁극의 실체'인지는 모르겠습니다. 컴퓨터 안에서 궁극적으로 옵셔널이 아닌 값이 없다는 의미일까요?