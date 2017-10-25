//
//  String+boundingRect.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 9. 28..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension String {
    
    func boundingRect(in size: CGSize, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let bounds = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        return bounds.size
    }
}
