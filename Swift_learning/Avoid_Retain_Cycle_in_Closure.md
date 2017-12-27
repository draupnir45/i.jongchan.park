# Closure 안에서 `self` 상호참조 피하기

Closure 안에서 `self`를 무심코 참조하여 쓰는 경우가 많습니다. 하지만 Swift에서는 Closure가 일급 객체이기 때문에, self의 프로퍼티로 저장될 수도 있습니다. 아무 조치 없이 그냥 쓴다면 상호참조로 인해 메모리 누수가 발생하기 쉬운데요. 그래서 클로저 파라미터 앞에 `[weak self]`를 넣어 리테인 카운트를 올리지 않은 채 참조할 수 있도록 해주는 것이 필요합니다. 이렇게 `weak` 키워드를 넣으면 클로저 내부에서는 `self`를 옵셔널로 판단합니다. 쓰려면 까 주어야죠.

```swift
someInstance.someFunction { [weak self] param in
  guard let `self` = self else { return }
  self.someOtherFuction(param)
  
  //아니면 간단한 경우
  self?.someOtherFunction(param)
}
```

부끄러운 이야기입니다만, 예전에 잘 모르고 무조건 `[unowned self]`를 붙였던 적이 있습니다. `unowned`는 `self`를 암시적 추출 옵셔널로 간주합니다. 리테인 카운트는 올리지 않지만, 만약 `self` 메모리에서 해제되어 없을 경우에는 앱이 죽어버리죠. 다만 미래 특정 시점에 실행되거나 다른 인스턴스로 넘기는 클로저가 아니라면, 즉 `self`가 살아있을 수밖에 없는 부분에서는 `unowned`를 써주는 것이 더 간단하겠죠. `guard`문이나 `if`문 같은 조건문을 한 번 피할 수 있으니, 조금이겠지만 퍼포먼스에도 유리할 겁니다. 아래는 예시입니다.

```swift
let newArray = someArray.map { [unowned self] item in
  return item * self.someProperty
}
```