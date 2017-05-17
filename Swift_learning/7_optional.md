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

- 값이 있는 경우 새로운 변수에 할당해 사용 가능하도록 함. 
- 자동완성 스니펫으로 지원.

	```swift
	var optString: String? = "옵셔널 스트링"

	if let variableToBind = optString {
	    print("\(variableToBind)에 값이 있다!")
	} else {
	    print("닐이다!")
	}
	
	if var variableToBind = optString {
	    variableToBind = variableToBind + "에 값이 있으니 변경도 가능하다!"
	    print(variableToBind)
	} else {
	    print("닐이다!")
	}
	
	if let variable1 = optString, let variable2 = str {
	    print("둘다 있다!")
	} else {
	    print("둘 중에 하나가 없거나 둘다 없다!")
	}
	
	
	
	```