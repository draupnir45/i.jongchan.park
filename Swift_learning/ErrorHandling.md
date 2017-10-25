# API 로딩시 에러 핸들링 Part.1 단계별 목표와 기본 URL 에러

(이 포스팅에서는 [Alamofire](https://github.com/Alamofire/Alamofire)를 활용합니다.)

WebServer 기반의 앱은 하루 종일 요청과 응답을 주고받죠. 그리고 통신은 여러 가지 이유로 실패할 수 있는 만큼, 성공시에 정상적으로 처리되는 것은 당연히 깔아 놓고 실패했을 때를 대비해야 합니다. 사실 결과로만 보면 실패한 통신은 다 똑같아요. 필요한 것을 받아오지 못해 화면에 뿌릴 게 없는 상황이죠. 중요한 건 문제가 왜 일어났는가 하는 겁니다.

가장 답답한 게 "알 수 없는 오류"니까.

그래서 오늘은 Foundation > URL Loading System에 속해 있는 URLError를 사용해서 인간이 알 수 있는 에러 메세지를 표현하는 방법과, 자체적으로 정의한 커스텀 에러를 동일한 방식으로 사용하는 방법을 정리해 보았습니다.

## Error표현의 단계별 목표

Error는 결국 사용자든 개발자든, 사람이 보게 될 실패의 이유입니다. 당연히 모든 에러에 대해서 '실패'라고 하는 것보다는 왜 실패했는지, 성공하려면 어떤 조치를 취해야 하는지 알려줄 수 있으면 좋겠죠. 그래서 나름대로 단계별 목표를 설정해 보았습니다.

1. 세분화: 각 에러별로 왜때문인지를 알랴준다.
2. 현지화: 알아먹을 수 있는(최소한 서비스가 지원하는) 언어로 알려준다.
3. 최적화: 해결법을 제시하거나, 말투를 마케팅 취지에 맞는 형태로 바꾸어 준다.

모든 에러에 대해 3번까지 하기엔 힘들지라도, 적어도 2번까지는 완료하고 일부 빈번할 수 있는 에러는 3번까지도 하는 것이 목표입니다.

그런데 다행히 기본적인 종류의 에러에 대해서는 애플이 거의 2번까지 처리해주고 있습니다.

## Error와 localizedDescription

`Foundation`에 보면 `URLError`라는 구조체가 있습니다. 

> Structure
> #### URLError
> Error codes returned by URL loading APIs.

URL이 API를 로딩하면서 반환하는 에러코드...라고 하네요. 여기 보면, 우리가 필요한 일반적인 상황들은 이미 세분화되서 정의가 되어 있다는 것을 알 수 있습니다.

`networkConnectionLost`라던가, `internationalRoamingOff`, `timedOut`, `notConnectedToInternet`같은 것들 말이죠.

(똑같이 통신을 할 수 없다는 소리지만 미묘하게 달라요. 통신 중에 연결이 끊긴 경우, 아예 연결이 없는 경우, 외국인데 로밍을 끈 경우, 시간이 너무 걸린 경우)

> **NOTE**
> `timedOut`의 경우는 별도로 Alamofire의 SessionManager를 통해 시간을 지정해줄 수 있습니다. 그에 관해서는 다른 포스팅에서 다루겠습니다.

이 정도면 서버의 특성을 타는 에러(커스텀할 에러)를 제외하면 거의 세분화는 완료되었다고 봐도 무방해 보입니다.

그리고 프로퍼티를 보니, `localizedDescription: String`도 있습니다. 이게 기본적으로 현지화되어 제공되는 메세지입니다. 2번도 다 제공한다는 소리죠? 나중에 커스텀할 때에도 이 똑같은 이름을 사용할 예정입니다. (그래야만 합니다...!)

## Alamofire에서 URLError 받아 처리하기

알았으니 활용해봅시다

```swift
Alamofire
  .request(
    URLString,
    method: .get,
    parameters: parameters,
    encoding: JSONEncoding.default,
    headers: headers)
  .validate(statusCode: 200...400)
  .responseJSON { response in
    if let error = response.error {
      print(error.localizedDescription) //이 놈이다...!!
    }
}
```

그런데 사실, 이런 식으로 JSON을 바로 던져주는 경우 보다는 간단한 처리를 해주는 경우가 많죠. Alamofire에도 이미 `DataResponse`에 `Result`라는 것이 정의되어 있는데, 살펴보면 아래와 같습니다.

```swift
public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
```

성공하면 필요한 데이터를 넘기고, 실패하면 Error를 넘긴다는 것이죠. (저는 이 부분을 커스텀해서 따로 enum을 만들어 쓰고 있습니다만, 여기서는 그냥 기존 걸 쓰겠습니다.)

아래와 같이 쓸 수 있습니다. 

```swift
static func someRequest(completion: @escaping (Result<Any>) -> Void) {
	Alamofire
	  .request(
	    URLString,
	    method: .post,
	    parameters: parameters,
	    encoding: JSONEncoding.default,
	    headers: headers)
	  .validate(statusCode: 200...400)
	  .responseJSON { response in
	    completion(response.result)
	}
}
```

쓰는 쪽에서는 이렇게 처리합니다.

```swift
SomeService.someRequest { [weak self] result in
	guard `self` = self else { return }
	switch result {
	case .success(let value):
		//성공시 처리
	case .failure(let error):
		self.alert(title: error.localizedDescription) 
		// 에러 메시지를 화면에 띄웁니다...! 
	}
}
```

> **NOTE**
> 위에 나온 alert(title:)은 알러트 컨트롤러를 단순화한 UIViewController 익스텐션입니다. 
> 추후에 별도로 포스팅하겠습니다.