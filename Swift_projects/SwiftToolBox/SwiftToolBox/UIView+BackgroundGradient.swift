//
//  UIView+BackgroundGradient.swift
//  SwiftToolBox
//
//  Created by Mark on 2017. 9. 4..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//
import UIKit

extension UIView {
  /// 백그라운드 그라디언트의 방향을 유형화합니다.
  ///
  /// - vertical: 위에서 아래로 그라디언트를 넣습니다.
  /// - horizontal: 좌측에서 우측으로 그라디언트를 넣습니다.
  /// - topLeftToBottomRight: 좌상단에서 우하단으로 넣습니다.
  /// - topRightToBottomLeft: 우상단에서 좌하단으로 넣습니다.
  enum BackgroundGradientDirection {
    case vertical
    case horizontal
    case topLeftToBottomRight
    case topRightToBottomLeft
  }
  
  /// UIView의 배경에 그라디언트를 넣습니다.
  ///
  /// - Parameters:
  ///   - direction: 그라디언트의 방향입니다.
  ///   - colors: 컬러값들입니다. 위에서 아래로, 좌측에서 우측으로 순으로 들어갑니다.
  func setBackgroundGradient(direction: BackgroundGradientDirection, colors: UIColor...) {
    let gradientLayer: CAGradientLayer = CAGradientLayer.init()
    gradientLayer.colors = colors.map { $0.cgColor }
    
    switch direction {
    case .vertical:
      break
    case .horizontal:
      gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2.0, 0.0, 0.0, 1.0)
    case .topLeftToBottomRight:
      gradientLayer.startPoint = CGPoint(x: 0, y: 0)
      gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    case .topRightToBottomLeft:
      gradientLayer.startPoint = CGPoint(x: 1, y: 0)
      gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    }
    
    gradientLayer.frame = self.bounds
    
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
  
}
