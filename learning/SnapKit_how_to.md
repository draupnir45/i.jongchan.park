# SnapKit 사용법 정리

## SnapKit이란?
오토 레이아웃을 코드 베이스로 작성하는 것을 편하게 해 주는 DSL입니다.
예를 들면 아래와 같습니다. 

```swift
self.view.addSubview(mySubView)
    
mySubView.snp.makeConstraints { make in
  make.width.equalTo(self.view).multipliedBy(1.0/5.0).priority(700)
  make.width.greaterThanOrEqualTo(200.0).priority(1000)
  make.height.equalTo(self.view).multipliedBy(1.0/3.0)
  make.center.equalTo(self.view)
}
```

설치는 CocoaPods, Carthage를 지원합니다. 안내는 [여기](https://github.com/SnapKit/SnapKit)에 있습니다. 아무래도 문법이 달라지는 부분이다보니 이번에는 사용법 위주로 정리하겠습니다.

## 사용법
 - [문서 사이트](http://snapkit.io/docs/)

### 제약 걸기
SnapKit은 3가지 유형의 layout relation을 11가지 유형의 view attribute와 조합하여 사용할 수 있습니다. 위에서 든 예에서 `equalTo`나 `greaterThanOrEqualTo`가 layout relation이고, `width`나 `height`가 view attribute입니다. 써놓고 보니 설명할 게 없네요. Interface Builder의 제약사항과 똑같이 작동합니다.

### 설정 위치
프레임 베이스의 경우에는 서브뷰를 레이아웃할 때 설정해 주는 것이 일반적입니다. 하지만 이 경우엔 애초에 적용되어 있는 제약 사항을 이용해 레이아웃이 진행되기 때문에 그보다 더 먼저 하는 게 맞습니다. 뷰디드로드나 어웨이크 프롬 닙 같은 곳에서 하면 될 것입니다. 추가적으로 그렇기에 제약사항이 변했을 경우 새롭게 레이아웃을 만들라는 메서드를 수행시녀 주어야 합니다.