//
//  UIViewController+AlertController.swift
//  SwiftToolBox
//
//  Created by Mark on 2017. 9. 4..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

///UIViewController가 쉽게 얼러트를 띄웁니다.
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
             okTitle: String = "확인",
             okHandler: AlertActionHandler? = nil,
             cancelTitle: String = "취소",
             cancelHandler: AlertActionHandler? = nil,
             completion: (() -> Void)? = nil) {
    
    let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let okClosure = okHandler {
      let okAction:UIAlertAction = UIAlertAction(title: okTitle, style: UIAlertActionStyle.default, handler: okClosure)
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
