# [iOS] 오토 레이아웃과 함께 UIView의 애니메이션 기능 사용하기

UIView에는 `animate(withDuration:animations:completion:)`라는 애니메이션 메서드가 있습니다. 프레임(frame) 베이스의 앱에서는 아주 직관적이고 편리한 메서드입니다. 

하지만 오토 레이아웃을 쓰게 되면 좀 혼란스러워지죠. 프레임처럼 단순히 값만 바꿔주는 걸로는 작동하지 않습니다. 애초에 프레임 값의 변화를 캐치해서 애니메이션으로 만들어 주는 메서드이기 때문입니다. 찾아보면 슈퍼뷰(superview)에 `layoutIfNeeded()`를 사용하면 된다고 하는데, **모든 서브뷰**를 다시 레이아웃하는 메서드인 만큼 부작용이 따를 수 있습니다. 

게다가 뷰의 레이아웃 뿐만 아니라 컬러라든가 컨텐츠 등을 업데이트하는 것도 같은 타이밍에 애니메이션되어야 한다면 머리가 좀 아파집니다.

관련해서 찾아본 내용들을 정리해 보았습니다. 

* 이 포스팅에서 오토 레이아웃은 [SnapKit](https://github.com/SnapKit/SnapKit)을 이용해 작성했습니다.
* iOS 9.0 이상, Swift 4.0을 기준으로 작성되었습니다.
* [예제 다운로드](https://www.dropbox.com/s/vnsrx9yvaduz18m/AnimationWithAutoLayout.zip?dl=0)

## `layoutIfNeeded()`와 `setNeedsLayout()`

오토 레이아웃은 계산 결과를 최종적으로 프레임에 반영합니다. 그런데 프레임과 달리 값의 변화를 저장해 두었다가, 뷰가 새롭게 서브뷰들을 레이아웃(`layoutSubviews()`)할 때 반영합니다. 이는 아마도 프레임과 오토 레이아웃의 차이점 때문인 것으로 보입니다.

프레임의 경우 각 뷰가 독립적으로 지니고 있는 프로퍼티로써, 슈퍼뷰 이외의 다른 뷰에 영향을 끼치지 않습니다. 그래서 프레임은 한 줄 한 줄 바로 변화를 반영해도 다른 뷰의 레이아웃이 깨진다거나 레이아웃을 결정할 수 없는 경우가 생기지 않죠. 근데 오토 레이아웃은 그렇지 않습니다. 원하는 효과를 만들기 위해서 한 컨스트레인트(Constraint)를 바꾸면 거기에 연관된 다른 것들이 우수수 변화하고, 상황에 따라 그릴 수 없는 상황도 발생합니다. 퍼포먼스에도 좋지 않겠죠.

이때문에 의도적으로 바로바로 변화를 반영하지 않도록 만든 것으로 보입니다. 따라서 우리는 오토 레이아웃이 프레임에 변화를 일으키는 메서드를 찾아서 그걸 애니메이션 메서드 클로저 안에 넣어 주어야 합니다.

그래서 오토 레이아웃상의 변화를 반영하기 위한 용도로 만들어진 메서드가 두 가지. `layoutIfNeeded()`와 `setNeedsLayout()`입니다. 각각의 공식 문서를 보겠습니다. (사실상 필요한 건 `layoutIfNeeded()`입니다만, 비슷한 일을 하는 메서드라 매번 헷갈리기 때문에 둘 다 정리합니다.)

### setNeedsLayout()

출처 - [공식 문서](https://developer.apple.com/documentation/uikit/uiview/1622601-setneedslayout)

> Call this method on your application’s main thread when you want to adjust the layout of a view’s subviews. This method makes a note of the request and returns immediately. Because this method does not force an immediate update, but instead waits for the next update cycle, you can use it to invalidate the layout of multiple views before any of those views are updated. This behavior allows you to consolidate all of your layout updates to one update cycle, which is usually better for performance.
> 
> 뷰의 서브뷰 레이아웃을 조정하려 할 때 이 메서드를 메인 스레드에서 호출하십시오. 이 메서드는 요청하는 메모를 남기고 바로 빠져나옵니다. 왜냐 하면 이 메서드는 즉각 업데이트를 강제하지 않고 다음 업데이트 사이클을 기다리기 때문이며, 당신은 다수 뷰 중에 어느 것이든 업데이트되기 전에 레이아웃을 무효화(invalidate)하기 위해 이 메서드를 사용할 수 있습니다. 이것은 일반적으로 더 나은 퍼포먼스를 가질 수 있게 하기 위해 한 업데이트 사이클에 모든 업데이트를 통합할 수 있게 합니다. 

### layoutIfNeeded()

출처 - [공식 문서](https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded)

>Use this method to force the view to update its layout immediately. When using Auto Layout, the layout engine updates the position of views as needed to satisfy changes in constraints. Using the view that receives the message as the root view, this method lays out the view subtree starting at the root. If no layout updates are pending, this method exits without modifying the layout or calling any layout-related callbacks.

>뷰의 레이아웃을 **즉시** 강제로 업데이트하고자 할 때 사용하십시오. 오토 레이아웃을 사용할 때 레이아웃 엔진이 뷰의 위치를 컨스트레인트의 변화에 따라 업데이트합니다. 만약에 루트 뷰를 리시버로 이 메서드를 호출하면, 루트로부터 뷰 서브트리를 레이아웃합니다. 보류된 레이아웃 업데이트가 없는 경우 별개의 수정이나 새로운 레이아웃 콜백들을 호출하지 않은 채 빠져나갑니다.

쉽게 말해서 `setNeedsLayout()`은 다음 업데이트 때 이 부분이 변화했다는 사실을 기록하고 지나가는 거고, `layoutIfNeeded()`는 지금 **당장** 레이아웃을 업데이트 시킨다는 겁니다. `setNeedsLayout()`의 설명에서 중요한 것이, 그냥 메모만 남기고 **바로** 나온다는 설명이 있는 것이 중요합니다. **실제 업데이트를 하지 않는다**는 말이죠. 

그래서 우리가 지금 관심있는 메서드는 `layoutIfNeeded()`입니다.

관련해서 예제를 만들어 보았습니다. [여기에서 다운로드](https://www.dropbox.com/s/vnsrx9yvaduz18m/AnimationWithAutoLayout.zip?dl=0)

## 적용 방법
순서는 1. 컨스트레인트 수정 2. animate 메서드 안에서 `layoutIfNeeded()` 호출 이렇게 두 단계입니다. 만약 레이아웃 이외의 것을 같이 수정하고 싶다면

1. 컨스트레인트 수정 
2. animate 메서드 안에서 레이아웃 이외의 변경사항 반영 
3. 슈퍼 뷰에 `layoutIfNeeded()` 호출 

이렇게 3단계가 되겠네요. 코드로 하면 아래와 같습니다.

```swift
@objc func toggleTargetViewShape(_ sender: UIButton) {
  sender.isSelected = !sender.isSelected
  
  // 1. 컨스트레인트 수정 
  self.targetView.snp.updateConstraints({ make in
    make.width.equalTo(self.targetViewWidth)
    make.height.equalTo(self.targetViewHeight)
  })
  
  UIView.animate(withDuration: 0.5) {
    // 2. animate 메서드 안에서 레이아웃 이외의 변경사항 반영 
    self.targetView.backgroundColor = .darkGray
    self.targetView.layer.cornerRadius = self.targetViewCornerRadius
    
    self.view.layoutIfNeeded()
  }
}
```
하지만 이 코드에는 부작용이 있습니다.

## 부작용

`layoutIfNeeded()`는 자기 자신을 루트로 해서 자기 위에 있는 뷰들을 업데이트합니다. 즉 지금 원하는 뷰(이하 타겟 뷰)를 업데이트하기 위해서는 구조상 타겟 뷰의 슈퍼 뷰(이하 슈퍼 뷰)에게 이 메서드를 호출해야 하는 것입니다. 그런데 슈퍼 뷰에 다른 서브 뷰가 있고, 그 역시 업데이트를 기다리고 있다면 어떨까요?

예제처럼 뷰컨트롤러의 뷰 위에 UIView 하나와 UIButton 하나가 올라가 있다고 해 봅시다. 예제에 있는 UIButton은 시스템 버튼인데요. 시스템 버튼은 선택되었을 때 콘텐츠를 감싸는 파란 색 배경을 만듭니다. 이게 오토 레이아웃으로 되어 있는 모양인지, 위처럼 코드를 짜면 버튼의 파란 배경이 같이 애니메이션이 되어 버립니다.

이를 해결하기 위해서는 애니메이션에 돌입하기 전에 버튼 업데이트를 먼저 쳐버려야 합니다.

```swift
@objc func toggleTargetViewShape(_ sender: UIButton) {

  //여기서 업데이트가 예정되는 것이죠.
  sender.isSelected = !sender.isSelected
  
  //그래서 먼저 선수를 칩니다. 이렇게 하면 애니메이션 전에 예정되었던 다른 혹시 모를 업데이트도 모두 해결할 수 있습니다.
  self.view.layoutIfNeeded()
  
  // Update Constraints...
  self.targetView.snp.updateConstraints({ make in
    make.width.equalTo(self.targetViewWidth)
    make.height.equalTo(self.targetViewHeight)
  })
  
  UIView.animate(withDuration: 0.5) {
    // Update Appearances...
    self.targetView.backgroundColor = .darkGray
    self.targetView.layer.cornerRadius = self.targetViewCornerRadius
    self.view.layoutIfNeeded()
  }
}
```

이렇게 하는 것이 뭔가 석연찮으신 분들은, 타겟 뷰를 다른 뷰로 감싸는 방법도 있습니다. 하지만 그렇게 하면 슈퍼뷰 대비해서 위치를 조정하는 것이 번거롭고, 쓰지도 않을 뷰가 계속 떠 있게 되겠죠. 그러기보다는 깔끔하게 할 거 다 해버리고 하는 게 낫습니다. `layoutIfNeeded()`는 변경사항이 없는 부분은 계산하지 않고 넘어가기 때문에, 어차피 퍼포먼스적으로 큰 부담이 되는 부분은 아닙니다.

## 그 외

- `animate(withDuration:animations:completion:)`에서는 클로저에 `weak self`나 `unowned self`처리를 해줄 필요가 없습니다. self가 클로저에 대해 소유하는 경우가 없기 때문에, 리테인 사이클이 발생하지 않기 때문입니다. 혹시나 하는 마음에 타이머를 통해 3초 이후에 실행되게 해놓은 채 뷰를 팝 시켜보기도 했는데, 문제 없었습니다.
- 자주 쓸지도 모르겠다는 생각에 extension도 하나 만들어 보았습니다...만은 사실상 인터페이스가 직관적이지 않아서 쓰지는 않을 거 같습니다.

    ```swift
    extension UIView {
      static func animateAutoLayoutedViews(onSuperview superview: UIView, duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        superview.layoutIfNeeded()
        UIView.animate(
          withDuration: duration, 
          animations: {
            animations()
            superview.layoutIfNeeded()
          }, 
          completion: completion)
      }
    }

    ```