# Extension을 이용하여 localizedString 코드 단순화하기.

(이 포스팅은 StackOverFlow의 이 [답변](https://stackoverflow.com/a/44795575/7688558)의 아이디어를 기반으로 간단한 수정만을 거쳤음을 알립니다.)

iOS에서 로컬라이제이션을 하려면 아래와 같은 코드를 사용합니다.

```swift
myLabel.text = Bundle.main.localizedString(forKey: "쓰고자 하는 글", value: nil, table: nil)
```

**스트링이 들어가는 모든 부분에 말이죠.** 한두번도 아니고 말그대로 수십번 이렇게 쓰는 것은 쉬운 일이 아닙니다. 그래서, 이 똑같은 걸 간단하게 바꾸는 아이디어가 있기에 가져와 보았습니다.

그러니까 **스트링이 들어가는 모든 부분**에 필요한 거잖아요. 그럼 스트링한테 시키면 된다는 겁니다.

```swift
extension String {
  var localized: String {
    return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
  }
}
```

이렇게 `localized`라는 연산 프로퍼티를 만들어 주는 겁니다.

그러면 

```swift
myLabel.text = "쓰고자 하는 글".localized
```

이렇게만 쓰면 됩니다. 게다가, 의미적으로도 잘 읽히죠. 해당 부분에 필요한 (개발 언어에서의) 스트링의 현지화된(localized) 버전을 가지고 오라는 겁니다.