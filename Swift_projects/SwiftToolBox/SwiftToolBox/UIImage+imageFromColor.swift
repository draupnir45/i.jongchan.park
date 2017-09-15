//
//  UIImage+imageFromColor.swift
//  SwiftToolBox
//
//  Created by Mark on 2017. 9. 4..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension UIImage {
  static func image(with color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img!
  }
}
