# 잊을만하면 필요할 것만 같은 무언가들

### 컨트롤러 없이 UINavigationBar만 사용하기.
 - 우선 [공식문서](https://developer.apple.com/reference/uikit/uinavigationbar)
 - 스테이터스 바 배경 넣는 방법 `UINavigationBarDelegate` 설정 후
	
	```objc
	- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
	    return UIBarPositionTopAttached;
	}
	
	```

### 형식지정자
 - 이 [블로그](http://ownstory.tistory.com/18)를 참조하자!
 - 숫자에 0패딩을 주고 싶으면 아래와 같이 하자.
 
	```objc	
	NSInteger i = 77;
	NSLog(@"%03ld",i); // -> 077
	```
	
### 텍스트필드 글자수 제한
 - 10글자인 상태에서 지워지고, 복사 붙여넣기, 중간수정 등등 모든 걸 해결하는 방법

	```swift
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
	    let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
	    return !(newLength > 10)
	}
	```

### UIDatePicker의 버그

- `CountDownTimer`모드로 `UIDatePicker`를 사용하는 경우 `ValueChanged` 이벤트를 연결하면 첫 번째 스핀은 무시하는 버그가 있다. 버그라기엔 너무 간단한 거라서 열심히 찾아봤지만 결국은 안 쓰는 걸로
- 추가 생각: 데이트피커라는 게 이벤트가 되기보다는 사실 해놓은 값을 그냥 읽어오는 게 더 자연스럽긴 하다. 그래서 그냥 아울릿으로 놓고 불러와서 쓰도록!

### 컨트롤 바깥을 탭해서 키보드 내리기
- `UITapGestureRecognizer`를 이용할 수 있음!
- ViewDidLoad()에서 할 수도 있지만, `extension`을 이용해 

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