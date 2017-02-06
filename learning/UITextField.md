#UITextField

- 사용시 내 클래스를 `UITextFieldDelegate`로 만들어 활용한다.

```objc
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // NO를 반환하면 수정을 거부한다.
- (void)textFieldDidBeginEditing:(UITextField *)textField;           // firstResponder가 될 때마다 불려진다.
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // 사용자의 인터랙션이 다른 곳으로 가도록 허용한다.
- (void)textFieldDidEndEditing:(UITextField *)textField;             // 인터랙션을 중단하는 것(위)가 허용되지 않았음에도 억지로 리스폰더에서 해제된 경우 불린다. (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0); // 구현되있을 경우 textFieldDidEndEditing: 대신 불린다.

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // 텍스트를 바꾸고 싶지 않을 때 NO를 반환.

- (BOOL)textFieldShouldClear:(UITextField *)textField;               // 클리어 버튼이 눌렸을 때 YES면 실행되고 NO면 실행되지 않는다.
- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // 리턴 키를 눌렀을 때 YES면 실행, NO면 무시한다.
```