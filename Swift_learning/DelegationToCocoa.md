# Cocoa에게 Delegation이란?

### Re-Visited

Delegation이란, 한 프로그램 안에서 한 오브젝트가 다른 오브젝트와 협동할 수 있게 하는 하나의 패턴입니다.

두 오브젝트 사이에서 일어나는 일이기에, 우선 용어를 정리하겠습니다. 아래 괄호 속 영문용어는 Apple의 공식 [도큐먼트](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html)를 참조했습니다.

- 위임자 객체 (Delegating Object) : Delegate 프로토콜을 정의하는 주체입니다. `UITableViewDelegate`에서의 `UITableView`, `UITextFieldDelegate`에서의 `UITextField`가 위임자라고 볼 수 있겠습니다.
- 대리자 객체 (Delegate Object) : Delegate 프로토콜을 따르며, 실제 위임자 객체의 `delegate?` 프로퍼티로 지정되는 객체를 말합니다.

(이하 편의상 위임자와 대리자로 부르겠습니다.)

### 위임자 혹은 그 작성자의 입장

위임자의 클래스는 여느 클래스와 마찬가지로 프로퍼티와 메서드로 구성되어 있습니다. 예를 들어 그 위임자가 `UITextField`라고 생각해 보겠습니다. 텍스트필드는 비교적 짧은 스트링을 입력받기 위한 용도로 어느 앱에서나 광범위하게 이용되는 클래스로, 앱의 성격이나 해당 텍스트필드의 위치에 따라 서로 다르게 행동할 필요가 있습니다. 또한, 텍스트필드에 특정 스트링값이 들어갔을 때 다른 뷰의 UI를 업데이트해야 할지도 모릅니다. 이를 위해 `UITextField`의 작성자는 `UITextField`를 '위임자 객체(Delegating Object)'가 되게 하려고 합니다.

우선은 충분히 많은 기능을 쓸 수 있도록, 텍스트필드가 하는 행동들을 정리합니다. 예컨데 수정을 시작한다거나, 내부에 있는 글씨를 수정한다거나, 리턴 키를 누르는 행동 등을 생각해 볼 수 있겠습니다. 그 결과가 프로토콜로 선언된 것이 아래입니다.

```swift
public protocol UITextFieldDelegate : NSObjectProtocol {

optional public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.
optional public func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
optional public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
optional public func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
optional public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:
optional public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text
optional public func textFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
optional public func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.

}

```

이렇게 선언했으니, 클래스를 써가면서 해당되는 메서드마다 위에 정의된 메서드를 불러주면 그때 그때 미래의 대리자(있다면)가 자신이 할 일을 적정 시점에 할 수 있겠죠.

근데 메서드를 부르려면 부를 객체가 있어야 합니다. 그 객체는 위의 프로토콜을 알고 있어야 하구요.

거꾸로 말하면, 위의 프로토콜을 알고 있는 객체만이 대리자가 될 수 있는 겁니다. 그래서 그런 프로퍼티를 만들고, 그 사실을 알립니다.

```swift
weak open var delegate: UITextFieldDelegate? // default is nil. weak reference
```

이렇게 말이죠. 선언하지 않으면 nil입니다. 옵셔널이구요. 없다면, 메서드를 부를 대상이 없기 때문에 그냥 지나갈 겁니다. 타입 부분에는 프로토콜 이름이 들어갑니다. `UITextFieldDelegate`를 따른다면 어떤 객체든 상관없이 delegate가 될 수 있다는 의미지요.

이제 모든 것이 준비되었으니 위임자는 어디에서든 대리자에게 필요한 메서드를 부를 수 있습니다.

```swift
func keyTouched(in range: Range<String.CharacterView.Index>, replacementString string: String) {
    if (self.delegate?.textField(self, shouldChangeCharactersIn: range, replacementString: string))! {
        self.text = self.text.replacingCharacters(in: range, with: string)
    }
}
```

이렇게요.

그럼 이제 대리자 입장에서 생각해 볼까요?

### 대리자 혹은 그 작성자의 입장

그러니까 대다수의, 애플 직원이 아닌, Cocoa나 Cocoa Touch랑 살아가려고 노력하는 개발자의 입장이겠죠?

대리자 입장에서는 기본 `UITextField`의 행동만으로는 충분히 하고 싶은 것을 이루기가 어렵습니다. 그래서 `UITextField`의 행동에 조금 간섭하거나, 혹은 사용자의 행동에 대해 의도대로 대응할 수 있기를 원합니다.

예를 들어, 어떤 이유에서건 텍스트필드를 수정할 수 없게 만들고 싶다고 칩시다.

자, 이제 프로토콜을 볼 시간입니다.

```swift
public protocol UITextFieldDelegate : NSObjectProtocol {

optional public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.

...(후략)...
}

```
이런 게 있네요. 한글이라면 이런 느낌이겠죠?

```swift
public protocol UITextFieldDelegate : NSObjectProtocol {

선택사항 public func 텍스트필드가_수정을_시작해야하는가(_ 텍스트필드: UITextField) -> Bool
// 싫으면 false 반환하세여

...(후략)...
}

```

오케이. 그럼 저 메서드를 쓰기 위해 대리자가 되어 보죠.

1. 우선 자격증명을 쓰구요.

	```swift
	class ViewController: UIViewController, UITextFieldDelegate { ... }
	```

2. 신청을 해봅니다.

	```swift
	override func viewDidLoad() {
	    super.viewDidLoad()
	    self.textField.delegate = self
	}
	```

3. 다 되었으니 우리는 이제 당당하게 싫다고 말합니다.

	```swift
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
	    return false
	}
	```

### 위임자와 대리자라는 이름에 대해

사실, 위의 예제와 같이 굳이 텍스트필드가 해야 하는 일을 대리해주는 것은 아닙니다. 위 예제는 오히려 간섭하고 있죠. 그래서 저는 이 패턴의 이름으로 Delegation이 굉장히 잘 어울린다고 생각지는 않습니다. 그냥 프로토콜에 의한 통신 내지는 협력 정도로 이해하는 것이 맞을 것 같아요!