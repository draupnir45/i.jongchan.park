코드로 오토레이아웃 하기 - safeAreaLayoutGuide

```swift
if #available(iOS 11.0, *) {
  NSLayoutConstraint.activate([
    segmentedControl.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0)
    ])
} else {
  segmentedControl.snp.makeConstraints { (make) in
    make.top.equalToSuperview()
  }  
}
```
