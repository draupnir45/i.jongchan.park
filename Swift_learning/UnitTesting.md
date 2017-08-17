# Unit Testing 정리
회사에서 새롭게 만드는 프로젝트의 중요 기능에 유닛 테스트를 적용하기 위해 방법을 정리해 보았다.


### 방법
- 테스트 타겟을 만들어 특정 함수가 기대하는 결과를 내는지를 검증.
- **순서** : 유닛 테스트 타겟 추가 → 테스트용 인스턴스 생성 → 결과 확인을 XCTest 함수에 연결 → `⌘ + U`로 실행

### 테스트용 인스턴스
- 테스트용 인스턴스는 `setUp()`에서 만들고 `tearDown()`에서 풀어준다.
- `setUp()` 에서는 `super.setUp()`아래에 인스턴스를 만든다.
- `tearDown()`에서는 `super.tearDown()` 위에서 `nil`을 할당해 준다.

	```swift
    var instanceForTesting: ClassForTesting!
    
    override func setUp() {
        super.setUp()
        instanceForTesting = ClassForTesting()
    }
    
    override func tearDown() {
        instanceForTesting = nil
        super.tearDown()
    }
	```

> **이미 테스트 코드가 작성된 코드의 테스트 방법**
> 
> 모든 테스트 구동하려면 `⌘ + U`를 이용. 그 이외의 경우는 Test Navigator에서 각각 실행이 가능.

### 동기 작업시 테스팅

- 비동기 작업의 경우 바로 XCTest로 검사할 수가 없다. 끝날 때까지 기다려야 하기 때문.
- 즉 1. 시간이 과도하게 걸려 타임아웃 되거나 2. 작업은 끝났는데 정상적이지 않게 끝났거나 3. 성공. 이렇게 3가지 경우를 커버해주어야 한다.
- 예시 (출처 [iOS Unit Testing and UI Testing Tutorial](https://www.raywenderlich.com/150073/ios-unit-testing-and-ui-testing-tutorial) from Ray Wenderlich)

	```swift
	func testCallToiTunesCompletes() {
	    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")!
	    
	    let promise = expectation(description: "Completion handler invoked")
	    var statusCode: Int?
	    var responseError: Error?
	    
	    let dataTask = sessionUnderTest.dataTask(with: url) { (data, response, error) in
	        statusCode = (response as? HTTPURLResponse)?.statusCode
	        responseError = error
	        
	        promise.fulfill()
	    }
	    
	    dataTask.resume()
	
	    waitForExpectations(timeout: 5)
	    //비동기 처리시 우선 선결 조건이 완료될 때까지 기다린다.
	    
	    // 'waitForExpectations()'보다 빠르게 적으면 의미가 없음
	    XCTAssertNil(responseError)
	    XCTAssertEqual(statusCode, 200)
	}
	```
	
- 상기 예시는 예제를 위한 것이고, 일반적으로는 이렇게 될 듯 싶다.

	```swift
	func testCallForSomeNetworkRequest() {	    
	    //타임아웃을 감지하기 위한 XCTestExpectation
	    let promise = expectation(description: "Completion handler invoked")
	    
	    //성공여부 판단을 위한 변수
	    var statusCode: Int?
	    var responseError: Error?
	    
	    networkManagerUnderTest.someNetworkRequest() { data, response, error in 
	       statusCode = (response as? HTTPURLResponse)?.statusCode
	       responseError = error
	    }
	    
	    waitForExpectations(timeout: 5)
	    //비동기 처리시 우선 선결 조건이 완료될 때까지 기다린다.
	    //XCTestExpectation이 완료되거나 타임아웃되면 지나간다.
	    
	    // 'waitForExpectations()'보다 빠르게 적으면 의미가 없음
	    XCTAssertNil(responseError)
	    XCTAssertEqual(statusCode, 200)
	}
	```