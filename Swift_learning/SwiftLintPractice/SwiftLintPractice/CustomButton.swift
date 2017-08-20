//
//  CustomButton.swift
//  SwiftLintPractice
//
//  Created by 박종찬 on 2017. 8. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension UIView {
    func makeRounded(corners: [UIRectCorner], radius: CGFloat) {
        let rectCorner: UIRectCorner = UIRectCorner.init(rawValue: corners.reduce(0) { $0 + $1.rawValue })
        
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: rectCorner,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class CustomButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeRounded(corners: [.topLeft, .bottomRight], radius: self.bounds.height / 2.0)
    }
}
