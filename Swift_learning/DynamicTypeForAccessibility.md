# 접근성 - 다이나믹 타입 지원

아이폰 접근성 메뉴에 있는 '큰 글씨체'를 지원하는 방법입니다.

## 폰트 설정
이 기능은 기본적으로 `UIFontTextStyle`을 이용해 폰트를 지정한 경우에 작동하는데, 방법은 아래처럼 코드로 지정하거나, 혹은 IB에서 텍스트 스타일을 선택하는 두 가지 방법이 있습니다.

```swift
emailLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
```

## 추가 설정
앱이 켜지기 전에 이미 설정값(`UIContentSizeCategory`)이 바뀌어 있으면 켜지면서 자동으로 그 사이즈에 맞게 들어갑니다. 하지만 한번 로드된 컨텐츠는 로드됐던 사이즈를 없애고 다시 바꾸어 주어야 하는데요. `UIContentSizeCategoryDidChange` 노티피케이션을 받아 처리합니다. 아래 코드와 같이 할 수 있습니다. (iOS 7.0 +)

```swift
_ = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil, queue: nil) { _ in
  self.emailLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
}
```

만약 앱이 iOS 10 이후 버전만 지원한다면 아래와 같이 설정해주기만 해도 됩니다.

```swift
self.emailLabel.adjustsFontForContentSizeCategory = true
```

버전에 따른 것을 고려한 전체 코드는 아래와 같습니다.

```swift
if #available(iOS 10.0, *) {
  self.emailLabel.adjustsFontForContentSizeCategory = true
} else {
  _ = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil, queue: nil) { _ in
	 // 폰트 사이즈를 다시 부여합니다. (자동으로 서브뷰 레이아웃이 수정됩니다.)
    self.emailLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
  }
}
```

## 커스텀 폰트 지원 (iOS 11 이후 지원)

커스텀 폰트를 이용해 다이나믹 타입을 지원하는 것이 iOS 11에서 추가되었습니다.

```swift
titleLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
```