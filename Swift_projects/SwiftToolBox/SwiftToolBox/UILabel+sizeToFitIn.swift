//
//  UILabel+sizeToFitIn.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 9. 28..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension UILabel {
    func sizeToFit(_ size: CGSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), horizontalInset: CGFloat = 0.0, verticalInset: CGFloat = 0.0) {
        
        let size = textBound(in: size, font: self.font)
        
        frame.size = CGSize(width: size.width + (horizontalInset * 2.0), height: size.height + (verticalInset * 2.0))
    }
    
    func textBound(in size: CGSize, font: UIFont) -> CGSize {
        guard let text = text else { return CGSize.zero }
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let bounds = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        return bounds.size
    }
}
