//
//  UIView+RoundCorners.swift
//  SwiftToolBox
//
//  Created by Mark on 2017. 9. 4..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension UIView {
  
  /// UIView의 각 코너를 선택적으로 둥글게 만드는 함수입니다.
  ///
  /// - Parameters:
  ///   - corners: 코너를 선택해줍니다. (복수 가능)
  ///   - radius: 둥글게 만들기 위한 반지름값입니다. 가로길이나 세로길이의 반 이상이 되면 더이상 커지지 앟습니다.
  func makeRounded(corners: UIRectCorner..., radius: CGFloat) {
    let rectCorner = UIRectCorner.init(rawValue: corners.reduce(0) { $0 + $1.rawValue })
    
    let path = UIBezierPath(roundedRect: self.bounds,
                            byRoundingCorners: rectCorner,
                            cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}
