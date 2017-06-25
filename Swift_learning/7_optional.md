# 옵셔널


## 거 얘긴 많이 들었는데... 그래서 그게 뭐죠?
Swift에 대해 이야기할 때 가장 자주 등장하는 주제 중 하나가 옵셔널입니다. 결론부터 말하면 옵셔널이란 '값의 부재를 표현하는 Generic Enumeration'인데요... 뭔 소린지 파봤습니다.



와닿게 해보려고 옵셔널이 만들어진 경위를 상상해 보았습니다.

기존의 Objective-C에서는 특정 클래스의 인터페이스를 만들 때, `nil`이 들어가도 되는지 안 되는지를 꼭 **주석으로 명시해 주어야** 했습니다. 왜냐면 실제 값을 할당해주지 않았어도 선언을 했다면 그대로 불러다 쓸 수 있었고, 빈 값인지 아닌지를 확신할 수 없어도 빌드에 실패하지는 않기 때문이죠.

...그런데 뭐든 그렇지만 사용자(개발언어의 사용자. 개발자.)가 설명서(주석, 도큐먼트)를 자세히 읽을 것이라고 가정하는 것은 아주 어리석은 일입니다. 더 명확하게 나타내는 게 좋죠. 사실 생각해보면 프로그램 내의 값들은 있을 수도 있고 없을 수도 있는 경우가 그렇지 않은 경우보다 많습니다. Apple의 프레임워크만 보더라도 빈 값을 넣어서 어떤 특정 기능을 쓰고 안 쓰고를 컨트롤하는 경우가 정말 많습니다. Objective-C에서는 이와 같은 상황을 이해하고 잘 컨트롤하는 것이 트러블슈팅에서 정말 중요했습니다. 문법적으로는 그냥 nil이 들어가든 안 들어가든 실제 돌리기 전까진 특별히 오류를 내 주지 않았으니까요.

Swift는 이것을 아예 문법 구조에 반영해 더 명확하게 컨트롤해 주고 싶었던 것 같습니다. 어차피 **있을 수도 있고 없을 수도 있는 어떤 값**을 처리하는 일이 많다면, 모든 타입에 대해서 있는 케이스와 없는 케이스를 정의하고 최대한 단순한 문법으로 쓸 수 있게 지원해주자는 것입니다.

자 그래서 이걸 어떻게 할 것인가 생각해 보니, 있을 때와 없을 때의 두 케이스를 커버하면서 동시에 모든 타입에 작동해야 할 것입니다. 케이스를 지정해주는 데 합당한 것은 당연히도 열거형이죠. 그거 하자고 있는 게 열거형이니까요. 그리고 모든 타입, 심지어는 사용자가 지금 정의한 타입에도 먹어야 됩니다. 그러면 `generic`이 되어야 하겠죠. 여기까지 이해하고 나면, [공식 문서](https://developer.apple.com/documentation/swift/optional)의 제목 부분이 완벽하게 합리적(makes perfect sense.)으로 보입니다. 

> #### Generic Enumeration
> # Optional
> A type that represents either a wrapped value or nil, the absence of a value.

그래서 한 줄로 요약하자면 '값의 부재를 표현하는 Generic Enumeration'인 셈이죠.

이제, 열심히 만들어 주신 이걸 어떻게 쓰는지 한번 볼까요?

## 정의하기`?`

- 물음표나 키워드 `Optional`을 통해 정의.
- 옵셔널로 정의하지 않은 것에는 `nil`할당이 불가 == 옵셔널로 정의된 것은 `nil`이 될 수 있다는 의미.
- 띄어서 쓰면 안 됩니다! 후위연산자.

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
	