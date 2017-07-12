# Tip. UIControl 바깥을 탭해서 키보드 내리기

### 들어가면서
모바일에서 정보를 입력 받는 뷰의 경우... 안 그래도 좁은 화면에 키보드까지 덮여 있기 때문에 사용자가 불편함을 느껴 키보드를 내리려고 할 때가 많습니다. 키보드에 액세서리 뷰를 추가하는 방법도 있긴 하지만 잠깐 화면을 볼 때마다 뭔가 결정하는 듯한 뉘앙스를 주는 거 같아서, 그냥 화면 내에 인터랙션이 없는 곳을 탭해서 내리고 싶을 때가 있죠. 그럴 때 쉽게 적용할 수 있는 방식을 소개합니다!

### 1. UIViewController의 extension 만들기
```swift
extension UIViewController {
    func endEditingModeWhenUserTapOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.endEditingView))
        self.view.addGestureRecognizer(tap)
    }
    
    func endEditingView() {
        self.view.endEditing(true)
    }
}
```

### 2. 적용하고 싶은 ViewController에 적용
```swift
class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        endEditingModeWhenUserTapOutside()
    }
}
```