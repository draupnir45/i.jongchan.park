# 텍스트필드의 글자수 제한
패스트캠퍼스에서 딜리게이트에 관련된 수업을 진행하던 도중, 텍스트필드의 글자수를 제한하는 것에 관련된 예제를 진행한 적이 있었습니다. 최초에 나온 답변에 대해서 다시 버그를 찾아내고, 그 버그를 픽스하고 하면서 Delegate에 대해서 알아볼 수 있는 굉장히 유익한 시간이었는데요. 해결하고자 하는 요건은 아래와 같았습니다.

- 입력되는 글자수가 10자를 넘지 않을 것.
- 입력시 커서가 텍스트 내에 어디에 있든 상관없이 작동할 것.
- 복사해온 스트링을 넣어도 알아서 거부할 것.
- 삭제 기능이 문제없이 작동할 것.

단순히 잘 해결했다는 느낌을 떠나서, 딜리게이트의 구조를 정확히 알고 또 구현하고자 하는 상황의 의미를 그대로 코드로 자아낸 예제라서 기억에 많이 남습니다. 당시 결론으로 배운 것들을 정리합니다.

## 풀이와 설명

- 결론부터 말하면 답은 아래와 같습니다.

	```swift
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
	    let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
	    return !(newLength > 10)
	}
	```

- `UITextField`에는 `textField(_:shouldChangeCharactersIn:replacementString:)->Bool` 이 부분이 **아마** 이렇게 되어있을 거에요. 

	```swift
	protocol UITextFieldDelegate {
	    func textField(_ textField: UITextField,shouldChangeCharactersIn range: Range<String.CharacterView.Index>, replacementString string: String) -> Bool
	}
	
	class UITextField {
	    var delegate: UITextFieldDelegate?
	    var text: String = ""
	    func keyTouched(in range: Range<String.CharacterView.Index>, replacementString string: String) {
	        if (self.delegate?.textField(self, shouldChangeCharactersIn: range, replacementString: string))! {
	            self.text = self.text.replacingCharacters(in: range, with: string)
	        }
	    }
	
	}
	```

- `ViewController`엔 이렇게 되어 있을 겁니다.

	```swift
	class ViewController: UIViewController, UITextFieldDelegate {
	
	    @IBOutlet weak var myTextField: UITextField!
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        self.myTextField.delegate = self
	    }
	    
	    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
	        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
	        return !(newLength > 10)
	    }
	}
	```

- `shouldChange...`이므로 결국 추가하거나 교체하는 것도 지원합니다. 즉 키보드던 뭐던 텍스트필드에 있는 텍스트에 변화를 가할 수 있는 모든 경우에 불리게 됩니다.
- 추가될 값과 지워질 양, 수정을 행할 위치가 필요합니다. 각각 다음과 같은 값으로 전달됩니다.
	- 현재 커서 위치 : `range.location`	
	- 지워질 양 : `range.length`
	- 추가될 값 : `string`

- 상황별로 따져보기.
	1. 일반 키보드 누름
		- `range.location` = 현재 커서 위치
		- `range.length` = 0
		- `string` = 누른 키보드의 캐릭터
	2. 지우기(delete)누름
	 	- `range.location` = 현재 커서 위치 - 1 (문자열 처음에서는 안됨)
		- `range.length` = 1
		- `string` = ""
	3. 복사해서 붙여넣음
		- `range.location` = 현재 커서 위치
		- `range.length` = 0
		- `string` = 복사된 스트링
	4. 문자열을 선택한 후 붙여넣기 (바꿔넣기)
		- `range.location` = 현재 커서 위치
		- `range.length` = 선택된 스트링 길이
		- `string` = 복사된 스트링

		
- 위와 같이 들어옵니다. 여기서 if문 안을 살펴봅시다.

	```swift
	if (self.delegate?.textField(self, shouldChangeCharactersIn: range, replacementString: string))! {
		self.text = self.text.replacingCharacters(in: range, with: string)
		//1. 커서 위치(range.location)에서 (range.length)만큼 문자열을 지운다.
		//2. 커서 위치(range.location)에 추가할 문자열(string)을 추가한다.
	}
	```
	
- `replacingCharacters`함수가 실행되는 과정을 통해 문자열 변화가 일어난 후의 길이를 계산해 보겠습니다.

	```swift
	//변화 후 텍스트 길이 = 현재 텍스트 길이 + 추가되는 텍스트 길이 - 지울 길이
	let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
	return !(newLength > 10)
	```
