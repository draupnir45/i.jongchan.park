# 옵셔널

- `nil`이 될 수 있는 것과 없는 것을 구분해서 표시하는 방법.

## 정의하기`?`

- 물음표나 키워드 `Optional`을 통해 정의.
- 옵셔널로 정의하지 않은 것에는 `nil`할당이 불가 == 옵셔널로 정의된 것은 `nil`이 될 수 있다는 의미.

## 강제 추출`!`

- 위험. 단거. DANGER.
- `if`로 검사할 수 있음. 
- 지양.

	```swift
	var shouldHaveValue = str!

	if noName != nil { //if로 안전하게.
	    shouldHaveValue = noName!
	} else {
	    print("없어!")
	}
	```
	
## 옵셔널 바인딩

- 