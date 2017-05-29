##텍스트필드 스트링 길이 제한

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
	
- 상황별로 따져보겠습니다.
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

- 위와 같이 들어옵니다. 여기서 if문 안을 살펴봅시다.

	```swift
	if (self.delegate?.textField(self, shouldChangeCharactersIn: range, replacementString: string))! {
	    
	self.text = self.text.replacingCharacters(in: range, with: string)
	
	}
	```
	
