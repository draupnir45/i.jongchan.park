# iPhone 화면사이즈 종결하기

참고한 자료 ([PaintCode - The Ultimate Guide To iPhone Resolutions](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions))

### Code

```swift
extension UIScreen {
  enum ScreenType: Int { //스크린 높이를 rawValue로.
    case iPhone1 = 480
    case iPhone5 = 568
    case iPhone6 = 667
    case iPhone6Plus = 736
    case iPhoneX = 812
    case unDefined = 0
  }
  
  class var width: CGFloat {
    return UIScreen.main.bounds.width
  }
  
  class var height: CGFloat {
    return UIScreen.main.bounds.height
  }
  
  class var screenType: ScreenType {
    let height = Int(UIScreen.height)
    if let screenType = ScreenType.init(rawValue: height) {
      return screenType
    } else { return .unDefined }
  }
}
```

### Usage

```swift
UIScreen.screenType // -> .iPhoneX
```

### GUI Components Sizes

```swift
struct GUIComponentsSizes {
  static var navigationBarHeight: CGFloat {
    
  }
  static var navigationBarHeightWithLargeTitle: CGFloat {
    
  }
  static var tabBarHeight: CGFloat {
    
  }
}
```