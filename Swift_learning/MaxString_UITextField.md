##텍스트필드 스트링 길이 제한
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
	        // Do any additional setup after loading the view, typically from a nib.
	    }
	    
	    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
	        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
	        return !(newLength > 10)
	    }
	    
	
	}
	```

- `shouldChange...`이므로 결국 추가하거나 교체하는 것도 지원합니다. 즉 키보드던 뭐던 텍스트필드에 있는 텍스트에 변화를 가할 수 있는 모든 경우에 
- 추가될 값과 지워질 양, 수정을 행할 위치가 필요합니다. 각각 다음과 같은 값으로 전달됩니다.
	- 현재 커서 위치 : `range.location`	
	- 지워질 양 : `range.length`
	- 추가될 값 : `string`

- 상황별로 따져보기.
	1. 일반 키보드 누름
		- `range.location` = 현재 커서 위치
		- `range.length` = 0 바꾸는 것이 아니므로
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