회사에서 결제 페이지를 만들 때, 네비게이션 바에 화면 전환에 대한 프로그래스를 넣어달라는 요청이 있었습니다. 기본 네비바에서는 화면 전환 때문에 불가능하니 커스텀 네비바를 쓰고 여러 페이지에 있는 뷰를 하나의 뷰 컨트롤러에서 관리하도록 바꾸었습니다. 그렇게 하고 나니 화면 가장자리에서 스와이프해서 팝하는 기능을 쓸 수가 없더라구요. 그래서 기본 UINavigationController가 하는 행동을 따라 직접 만들어 넣어 주었습니다.

## 결과물

![](images/custom_push_and_pop.gif)

## 환경

- iOS 9.0 +
- Swift 4.0
- SnapKit ([GitHub](https://github.com/SnapKit/SnapKit))
- FlameKit ([Github](https://github.com/draupnir45/FlameKit))

## Code

예제파일

핵심적인 부분만 설명하겠습니다.

### UIScreenEdgePanGestureRecognizer
가장자리에서 pan하는 걸 인식하는 녀석입니다. 루트뷰에다가 걸어 줍니다. 일반 `UIPanGestureRecognizer`와 다른 점은, 어느 가장자리에서 인식할 것인지 선택해주어야 한다는 겁니다. 아무래도 상단이나 하단은 OS 특성상 쓰기 어려울 거 같고, 쓴다면 좌우 정도 활용하겠네요. 하지만 옵션은 모두 있습니다.

```swift
override func viewDidLoad() {
  super.viewDidLoad()
    ...

  let screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(self.handleScreenEdgePan(_:)))
  screenEdgePanGestureRecognizer.edges = .left
  self.view.addGestureRecognizer(screenEdgePanGestureRecognizer)
}
```

그리고 받은 좌표값으로 할 일을 지정해 줍니다. 자세한 코드는 예제 파일에 있습니다. 여기선 구조만 확인하도록 할게요.

```swift
@objc func handleScreenEdgePan(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
    guard currentStageIndex != 0 else { return } // 만약 맨 첫번째 뷰라면, 그냥 돌아갑니다.
    
    switch gestureRecognizer.state {
    case .began:
    
      // 제스처가 시작되었습니다. 
     
      // 현재 뷰와 이전 뷰에서 화면전환 일어나기 전에 해야 할 것들을 해 주세요.
    
    case .changed:
      
      // 화면상에서 손가락이 움직이고 있습니다.
      
      // gestureRecognizer의 'translation' 프로퍼티의 정보를 가지고, 
      // 현재 뷰의 x 좌표가 화면상의 터치 지점을 따라갈 수 있게 해 줍니다.
      
    case .ended:
      
      // 제스처가 끝났습니다.
      
      // 1. 만약 충분한 지점까지 혹은 충분히 빠른 속도로 스와이프하지 않았다면
      // 원래 뷰로 되돌려 줍니다.
      
      // 2. 만약 충분한 지점까지 혹은 충분히 빠른 속도로 스와이프했다면
      // 남은 부분만큼 마저 애니메이션해 줍니다.

    default:
      // 제스처가 실패하거나 취소되었습니다.
    }
    
  }
```

많이 겁먹었었는데 생각보다 그리 어렵지 않고 재밌게 할 수 있었습니다. `UIGestureRecognizer`의 `translation` 값을 잘 이해하는 일이 중요한 것 같습니다.