# TabBarController & Life Cycle


```swift
// ================== 닙 최우선 ==================
FirstVC awakeFromNib()
SecondVC awakeFromNib()

// ================== 뷰1 그리기 ==================
FirstVC viewDidLoad()
FirstVC viewWillAppear
FirstVC viewWillLayoutSubviews()
FirstVC viewDidLayoutSubviews()
FirstVC viewDidAppear

// ================== 뷰2 선택 ==================
tabBar(_:didSelect:) <UITabBarItem: 0x7fc78371b990> selected
SecondVC viewDidLoad()
SecondVC viewWillAppear
FirstVC viewWillDisappear
SecondVC viewWillLayoutSubviews()
SecondVC viewDidLayoutSubviews()
SecondVC viewDidAppear

// ================== 뷰1 선택 ==================
tabBar(_:didSelect:) <UITabBarItem: 0x7fc783717f20> selected
FirstVC viewWillAppear
SecondVC viewWillDisappear
FirstVC viewDidAppear
```