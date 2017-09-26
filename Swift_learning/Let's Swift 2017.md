# Let's Swift 2017

## Swift 4
- 문자열 리터럴

	```swift
	let str = """
		신난다
		재미난다
		더게임 오브 데
		스
		"""
	```
- 다시 컬렉션으로..`count` 등 컬렉션 메서드 사용 가능
- SubString 공부... 문자열이랑 뭐가 다른가

### 접근제한자
- `private` 달라짐... `extension` 안에서 `private` 접근 가능 (같은 소스 파일 안에서 그렇다. `fileprivate`을 거의 대부분 바꿀 것.

### SmartKeyPath
- 잘 모르겠다. 다시 공부
- `addObserver도 공부.`

### Existential
- 프로토콜을 그냥 &으로 추가, 타입이랑 같이도 쓸 수 있음
- 프로토콜 오리엔티드로 가봅시다 (애들을 프로토콜로 역할지정하기)

	```swift
	func doSomeThing(thing: Savable & Loadable) {
	
	}
	
	func saveView(view: UIView & Savable) {
	  view.save()
	}
	
	```

### One Sided Range
- 한 쪽을 열어주면 다른 쪽은 자동!

### @objc 자동추론 많이 없어짐.
- 오버라이드에는 붙일 필요 없음.
- 오브젝티브씨 관련 `@IBOutlet`, `@IBAction` 등등 @키워드들은 안해도 됨.
- `dynamic`은 넣어줘야 함.

### Codable✨
- json들 파싱하는 경우! 편하게 할 수 있도록 바뀜.
- `Codable`, `Decodable` 공부할 것!!
- `NSCoding`이랑 비슷...?
- `CodingKeys` 짱짱맨
- 'Using JSON with Custom Type' 검색해볼 것

### Swift 5.0
- 비동기작업 관련 기능이 추가될 것으로 보임

## Swift와 Kotlin 
Kakao 유용하님

### 두 언어의 비교
- Apple / JetBrains
- from OC / JAVA
- 오픈소스

자바스크립트 타겟이 뭘까

## 병행처리 (Concurrency)
- Lock?? <- 뭔지 찾아볼 것
- stdAtomic
- GCD <- 한번 더 공부
- KVO 도 공부

## Metal🌟
- 애니메이션 작성에 활용 .... 일반 앱에서 사용
- GPU직접 접근해 퍼포먼스 이슈 해결
- Post Processing 방법론

## iOS 11 ARKit 🌝ㅣ봉원님
- AR
	- Mixed Reality
	- Pokemon Go
- ARKit
- 

## Toss
- 나중에 다시 볼 것
- 배포자동화 : https://fastlane.tools

## Serverless vs Server-side Swift

## RxSwift

## ReactorKit

- Rx + MVVM / Rx + MVC : 상태를 관리하기가 어렵다.
- Cyclic Data dep. 순환 데이터 의존성
	- 이전 작업의 결과가 지금 작업에 필요.
	- Behavier Subject(플래그) 점점 늘어나는 Variable = 명령형.
RxSwift를 상태관리 쉽게 만드는 것.
- 단방향.
- 반응형.

### ReactorKit

- 리액터가 로직 / 뷰컨은 랜더링
- RxSwift 그대로 다 활용
- 중간상태를 Reduce에서 관리

#### 추가적으로
- 작게 시작이 가능
- 테스팅 도구 자체 지원


## 비밀의 숲
- 임은성
- iOS in Enterprize
- 올리면 안되는 이야기들

http://bit.ly/startpoll

