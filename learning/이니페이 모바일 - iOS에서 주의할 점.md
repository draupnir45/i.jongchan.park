# 이니시스의 이니페이 모바일 - iOS에서 주의할 점

이니페이 모바일(INIPay Mobile)은 이니시스(INICIS)의 서비스 중 하나로, 앱 내에서 웹뷰를 이용해 결제 서비스를 제공할 수 있도록 하는데요. 직접 iOS에 붙이면서 배운 점을 정리해 보았습니다. 언어는 Swift 4.0입니다.

### 주의할 쿼리, `P_RESERVED`
- 앱 내에서 웹뷰를 띄울 때를 위한 대부분의 설정은 여기서 해 줍니다. 
- 그런데 `P_RESERVED`는 '복합 필드'라고 해서, `P_`라는 프리픽스가 붙는 쿼리들과 섞여서 요청되게 되는데 그 값에 문자열 `&`이나 `=` 들어가야만 합니다. INIPay 문서 쪽에는 이 처리를 위한 iOS 가이드가 없습니다. 따라서 캐릭터셋 중에 .alphanumerics이라는 놈을 이용하여 퍼센트인코딩을 해 주었습니다.
- 일단 잘 동작하긴 하지만, 테스트를 많이 거쳐야 할 거 같습니다.

### httpBody의 EUC_KR 인코딩
- 위의 `P_RESERVED`를 담은 전체 파라미터는 웹뷰 리퀘스트의 바디에 들어가게 됩니다. 해당 부분은 EUC-KR로 인코딩 해야 하는데요. 아래와 같은 코드로 가능합니다.

```swift
let eucKrRawValue = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.EUC_KR.rawValue))
let parameterString = notEncodedParameterString.data(using: String.Encoding(rawValue: eucKrRawValue))
request.httpBody = parameterString
```

### 처리 상태 확인
- 결제 처리 후에는 웹뷰가 `P_NEXT_URL`이나 `P_NOTI_URL`을 호출하게 되는데요. 이 타이밍에 서비스 웹서버에 결제 처리에 대한 요청을 하면 됩니다. 정해진 정책에 따라 반복 요청해서 결과를 띄워주면 되겠습니다.