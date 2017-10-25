# 쉽게 UIAlertController 띄우기

저는 UIAlertController를 되게 좋아합니다. 예쁘고, 기능도 딱 충분할 만큼이어서 복잡하지 않죠. 근데 단 하나. 간단한 거 하나를 띄우려고 해도 너무 많은 코딩이 필요하다는 단점이 있습니다. 뭐 그것도 대단히 긴 줄은 아닙니다만... 어쨌든, 함수 정의의 특성을 이용해서 가장 간단한 얼러트부터 가장 복잡한 얼러트까지 단 한 줄로 해결할 수 있는 extension을 만들어 보았습니다.

## Code

```swift
extension UIViewController {
  typealias AlertActionHandler = ((UIAlertAction) -> Void)
  
  /// 기본 얼러트컨트롤러를 쉽게 띄울 수 있는 함수입니다.
  /// 필수는 'title' 뿐이며, 나머지는 모두 무시해도 실행됩니다.
  ///
  /// - Parameters:
  ///   - title: 타이틀. 필수입니다.
  ///   - message: 메시지. 넣지 않으면 무시됩니다.
  ///   - okTitle: 확인 액션의 타이틀입니다. 기본값은 "확인"입니다.
  ///   - okHandler: 확인 액션의 핸들러입니다. 유저가 확인을 눌렀을 때 실행할 코드가 들어갑니다.
  ///   - cancelTitle: 취소 액션의 타이틀입니다. 기본값은 "취소"입니다. 확인 액션의 핸들러가 없으면 "확인"이 대신 들어갑니다.
  ///   - cancelHandler: 취소 액션의 핸들러입니다. 유저가 취소를 눌렀을 때 실행할 코드가 들어갑니다.
  ///   - completion: 얼러트컨트롤러가 뜨고 난 직후에 실행될 클로저입니다.
  func alert(title: String,
             message: String? = nil,
             okTitle: String = "OK",
             okHandler: AlertActionHandler? = nil,
             cancelTitle: String = "Cancel",
             cancelHandler: AlertActionHandler? = nil,
             completion: (() -> Void)? = nil) {
    
    let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let okClosure = okHandler {
      let okAction: UIAlertAction = UIAlertAction(title: okTitle, style: UIAlertActionStyle.default, handler: okClosure)
      alert.addAction(okAction)
      let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: UIAlertActionStyle.cancel, handler: cancelHandler)
      alert.addAction(cancelAction)
    } else {
      let cancelAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: cancelHandler)
      alert.addAction(cancelAction)
    }
    self.present(alert, animated: true, completion: completion)
  }
}
```

## Usage

```swift
// UIViewController에서...
// in UIViewController...

// 가장 간단한 경우. 타이틀과 아무 것도 하지 않는 "OK" 액션만 있다
// the simplist case. just title and "OK" Action which does nothing
self.alert(title: "TitleString") 

// 가장 복잡한 경우. 타이틀, 메세지, OK/Cancel 버튼 타이틀, OK/Cancel 버튼 행동, 얼러트를 띄운 직후 실행할 클로저 등 모듯 것을 커스텀할 수 있다.
// the most complicated case. You can customize title, message, OK action title, OK handler, cancel action title, cancel handler and completion hander.
self.alert(
  title: "Title", 
  message: "message to user", 
  okTitle: "OK", 
  okHandler: { alertAction in
    //확인을 눌렀을 때를 위한 클로저 
    //Closure on user select "OK"
}, 
  cancelTitle: "Cancel", 
  cancelHandler: { alertAction in
    //취소를 눌렀을 때를 위한 클로저
    //Closure on user select "Cancel"
}, 
  completion: {
    //프레젠트 직후를 위한 클로저
    //closure on present
})
```
