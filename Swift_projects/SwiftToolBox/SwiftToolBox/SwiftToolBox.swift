//
//  AlertPack.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 6. 1..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

typealias SimpleNoneVoidClosure = (() -> Void)
typealias AlertActionToVoidClosure = ((UIAlertAction) -> Void)
let defaultDateFormatString = "MMM d, yyyy"

class JCAlertPack {
    func presentAlert(withTitle title: String,
                      message: String,
                      sender: UIViewController,
                      okTitle: String = "확인",
                      okHandler: AlertActionToVoidClosure? = nil,
                      cancelTitle: String = "취소",
                      cancelHandler: AlertActionToVoidClosure? = nil,
                      completion: SimpleNoneVoidClosure? = nil) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: UIAlertActionStyle.cancel, handler: cancelHandler)
        if let okClosure = okHandler {
            let okAction:UIAlertAction = UIAlertAction(title: okTitle, style: UIAlertActionStyle.default, handler: okClosure)
            alert.addAction(okAction)
        }
        alert.addAction(cancelAction)
        sender.present(alert, animated: true, completion: completion)
    }
    
    
    func presentSimpleInfoAlert(withTitle title: String, message: String, sender: UIViewController, cancelTitle: String = "확인") {
        presentAlert(withTitle: title, message: message, sender: sender, cancelTitle: cancelTitle)
    }
}
let alertPack: JCAlertPack = JCAlertPack()

class JCDatePack {
    
    var defaultFormatter: DateFormatter = DateFormatter()
    
    init() {
        self.defaultFormatter.dateFormat = defaultDateFormatString
    }
    
    init(withFormat format: String) {
        self.defaultFormatter.dateFormat = format
    }
    
    func string(withDate date: Date, inFormat format: String? = nil) -> String {
        if let customFormat = format {
            let customFormatter: DateFormatter = DateFormatter()
            defaultFormatter.dateFormat = customFormat
            return customFormatter.string(from: date)
        } else {
            return defaultFormatter.string(from: date)
        }
        
    }
    
}
let defaultDateStringPack: JCDatePack = JCDatePack()

func attributedString(withString string: String, lineSpacing: Double, paragraphSpacing: Double? = nil) -> NSAttributedString {
    let attrString = NSMutableAttributedString(string: string)
    let style = NSMutableParagraphStyle()
    style.lineSpacing = CGFloat(lineSpacing)
    if let paragraphSpace = paragraphSpacing {
        style.paragraphSpacing = CGFloat(paragraphSpace)
    }
    attrString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: attrString.length))
    return attrString
}
