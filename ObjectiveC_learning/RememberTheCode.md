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