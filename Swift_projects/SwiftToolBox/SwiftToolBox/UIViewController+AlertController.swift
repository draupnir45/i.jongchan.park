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
  
  /// only 'title' is required parameter. you can ignore rest of them.
  ///
  /// - Parameters:
  ///   - title: Title string. required.
  ///   - message: Message for alert. 
  ///   - okTitle: Title for confirmation action. If you don't probide 'okHandler', this will be ignored.
  ///   - okHandler: Closure for confirmation action. If it's implemented, alertController will have two alertAction.
  ///   - cancelTitle: Title for cancel/dissmis action. 
  ///   - cancelHandler: Closure for cancel/dissmis action.
  ///   - completion: Closure will be called right after the alertController presented.
  func alert(title: String,
             message: String? = nil,
             okTitle: String = "OK",
             okHandler: AlertActionHandler? = nil,
             cancelTitle: String? = nil,
             cancelHandler: AlertActionHandler? = nil,
             completion: (() -> Void)? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if okHandler != nil {
      
      let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
      alert.addAction(okAction)
      
      let cancelAction = UIAlertAction(title: cancelTitle ?? "Cancel", style: .cancel, handler: cancelHandler)
      alert.addAction(cancelAction)
    
    } else {
      let cancelAction = UIAlertAction(title: cancelTitle ?? "OK", style: .cancel, handler: cancelHandler)
      alert.addAction(cancelAction)
    }
    self.present(alert, animated: true, completion: completion)
  }
}
