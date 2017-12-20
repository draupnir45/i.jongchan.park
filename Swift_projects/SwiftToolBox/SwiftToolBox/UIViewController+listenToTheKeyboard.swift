//
//  UIViewController+listenToTheKeyboard.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 11. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

//extension UIViewController {
//  func listenToTheKeyboardNotification() {
//    
//    
//    
//  }
//  
//  func visibleRect() {
//    var 
//  }
//}



//var shouldListenToTheKeyboardNotification: Bool = false {
//  didSet {
//    if shouldListenToTheKeyboardNotification {
//      keyboardWillShowNotification = 
//        NotificationCenter.default
//          .addObserver(forName: NSNotification.Name.UIKeyboardWillShow, 
//                       object: nil, 
//                       queue: OperationQueue.main) 
//          {[weak self] (notification) in
//            guard 
//              let `self` = self,
//              let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue 
//              else { return }
//            let keyboardRect: CGRect = keyboardFrameValue.cgRectValue
//            self.visibleSize.height = self.bounds.height - keyboardRect.size.height
//            
//            let visibleRect = CGRect(origin: self.contentOffset, 
//                                     size: self.visibleSize)
//            
//            if 
//              let firstResponder = self.firstResponder, 
//              firstResponder.frame.intersection(visibleRect) != firstResponder.frame {
//              let targetOffset = CGPoint(x: 0.0, y: firstResponder.frame.origin.y - self.spacing - self.contentInset.top)
//              self.setContentOffset(targetOffset, animated: true) }}
//      
//      keyboardWiilHideNotification = 
//        NotificationCenter.default
//          .addObserver(forName: NSNotification.Name.UIKeyboardWillHide, 
//                       object: nil, 
//                       queue: OperationQueue.main) 
//          { (notification) in
//            self.visibleSize.height = self.bounds.height }
//    }
//  }
//}
//
//var keyboardWillShowNotification: NSObjectProtocol?
//var keyboardWiilHideNotification: NSObjectProtocol?

//deinit {
//  keyboardWillShowNotification = nil
//  keyboardWiilHideNotification = nil
//}

