//
//  String+sizing.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 10. 27..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension String {
  func singleLineWidth(font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: font.lineHeight)
    let options: NSStringDrawingOptions = [.usesFontLeading]
    let attributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: font]
    let boundingRect = NSString.init(string: self).boundingRect(with: constraintRect, options: options, attributes: attributes, context: nil)
    return boundingRect.width
  }
  
  func multiLineHeight(with width: CGFloat, font: UIFont, numberOfLines: Int = 0) -> CGFloat {
    let maximumHeight = numberOfLines == 0
      ? CGFloat.greatestFiniteMagnitude
      : font.lineHeight * CGFloat(numberOfLines)
    let constraintRect = CGSize(width: width, height: maximumHeight)
    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
    let attributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: font]
    let boundingRect = NSString.init(string: self).boundingRect(with: constraintRect, options: options, attributes: attributes, context: nil)
    return boundingRect.height
  }
}
