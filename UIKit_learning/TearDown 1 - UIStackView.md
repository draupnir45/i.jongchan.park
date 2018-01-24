UIKit TearDown 1
# UIStackView, Intrinsic Size, Fitting Size

이 글을 쓰고 있는 이 시점(2018년 1월) 기준으로 [iOS 버전 수용도](https://data.apteligent.com/ios-adoption-by-usage)조사에 따르면 iOS 9.0 이하 버전을 사용하는 사람들이 2018년 1월 중순 기준 1퍼센트도 안 됩니다. 그 바람을 따라 요즘 iOS 8을 지원중단하는 앱들이 많아졌습니다. 

그래서 드디어...! UIStackView를 쓸 수 있게 되었습니다. 따라서 오늘은 UIStackView 그 자체와, 함께 쓸 수 있는 연관된 오토 레이아웃 기능들을 정리해 보고자 합니다.

### UIStackView

|SDKs|Framework|
|:--|:--|
|iOS 9.0+<br>tvOS 9.0+|UIKit|

### UIView
뷰에서 레이아웃 관련된 프로퍼티, 메서드.

#### intrinsicContentSize
|SDKs|Framework|
|:--|:--|
|iOS 6.0+<br>tvOS 9.0+|UIKit|

#### setContentCompressionResistancePriority(_:for:)
|SDKs|Framework|
|:--|:--|
|iOS 6.0+<br>tvOS 9.0+|UIKit|

#### setContentHuggingPriority(_:for:)
|SDKs|Framework|
|:--|:--|
|iOS 6.0+<br>tvOS 9.0+|UIKit|

#### systemLayoutSizeFitting(_:)
|SDKs|Framework|
|:--|:--|
|iOS 6.0+<br>tvOS 9.0+|UIKit|