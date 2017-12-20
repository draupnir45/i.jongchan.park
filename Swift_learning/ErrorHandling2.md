# API 로딩시 에러 핸들링 Part.2 커스텀 URL 에러와 메시지

[Part.1 단계별 목표와 기본 URL 에러](ErrorHandling1.md)

Part 1에서는 기본적인 에러들을 다루었는데요. 이번에는 커스텀 에러를 적용해 보겠습니다. 기본적인 에러의 메시지를 `localizedDescrition`을 이용해 가져왔기 때문에, 그것과 똑같이 제공할 수 있도록 해 보겠습니다.

우선 아래와 같이 주어졌다고 가정해 보죠.

```swift
enum MyServiceError: Int, Error {
  case authentificationTokenExpired = 2001 // 약속된 결과코드.
  case passwordInvalid = 2002
}
```

이제 여기에 `localizedDescrition`을 제공해 볼 텐데요. 아래의 프로토콜을 이용하면 쓰면 그런 효과를 낼 수 있습니다.

> Protocol
> ### LocalizedError
> A specialized error that provides localized messages describing the error and why it occurred.
> 
> (번역) 에러와 에러가 일어난 이유를 현지화된 메세지로 제공하기 위해 전문화된 에러입니다.

아래와 같이 `errorDescription`에 현지화된 스트링을 넣어주면 됩니다.

```swift
extension NetworkingError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .authentificationTokenExpired:
      return "Authentification token is expired".localized
    case .passwordInvalid:
      return "Wrong password.".localized
    }
  }
}
```


> NOTE

> `"string".localized` 는 현지화 스트링을 간단히 받아오기 위해 만든 커스텀 String 익스텐션입니다. 방법은 [여기](SimplifyLocalizedString.md)에서 확인할 수 있습니다.