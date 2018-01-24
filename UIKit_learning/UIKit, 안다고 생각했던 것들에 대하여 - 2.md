## UIViewController

### loadView()
[문서](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621454-loadview)

- view 프로퍼티가 아직 nil일 때 불립니다.
- IB를 사용한다면 재정의해서는 안 됩니다(must not).
- view를 수동으로 만들고자 할 때 재정의할 수 있습니다. (하지 않아도 됩니다... 만 viewDidLoad에서 설정을 해주어야 합니다.)
- 재정의할 때, 'super'를 불러선 안 됩니다(should not).
- 그 외의 초기화를 하고 싶다면 `viewDidLoad()`에서 하세요.

### viewDidLoad()

[문서](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload)

- **초기화**를 합니다. 루트뷰 이외의 것들에 대한 **초기화**를 합니다.