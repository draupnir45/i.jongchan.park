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


///UIViewController가 쉽게 얼러트를 띄웁니다.
extension UIViewController {
    
    typealias AlertActionHandler = ((UIAlertAction) -> Void)
    
    /// 기본 얼러트컨트롤러를 쉽게 띄울 수 있는 함수입니다.
    /// 필수는 'title' 뿐이며, 나머지는 모두 무시해도 실행됩니다.
    ///
    /// - Parameters:
    ///   - title: 타이틀. 필수입니다.
    ///   - message: 메시지. 넣지 않으면 무시됩니다.
    ///   - okTitle: 확인 액션의 타이틀입니다. 기본값은 "확인"입니다.
    ///   - okHandler: 확인 액션의 핸들러입니다. 유저가 확인을 눌렀을 때 실행할 코드가 들어갑니다.
    ///   - cancelTitle: 취소 액션의 타이틀입니다. 기본값은 "취소"입니다. 확인 액션의 핸들러가 없으면 "확인"이 대신 들어갑니다.
    ///   - cancelHandler: 취소 액션의 핸들러입니다. 유저가 취소를 눌렀을 때 실행할 코드가 들어갑니다.
    ///   - completion: 얼러트컨트롤러가 뜨고 난 직후에 실행될 클로저입니다.
    func alert(title: String,
               message: String? = nil,
               okTitle: String = "확인",
               okHandler: AlertActionHandler? = nil,
               cancelTitle: String = "취소",
               cancelHandler: AlertActionHandler? = nil,
               completion: (() -> Void)? = nil) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let okClosure = okHandler {
            let okAction:UIAlertAction = UIAlertAction(title: okTitle, style: UIAlertActionStyle.default, handler: okClosure)
            alert.addAction(okAction)
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: UIAlertActionStyle.cancel, handler: cancelHandler)
            alert.addAction(cancelAction)
        } else {
            let cancelAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: cancelHandler)
            alert.addAction(cancelAction)
        }
        self.present(alert, animated: true, completion: completion)
    }
}



/// 지금 시간을 원하는 포맷으로 반환합니다.
///
/// - Parameters:
///   - format: dateFormat에 대응하는 포맷 스트링입니다. 기본포맷은 "yyyy-MM-dd hh:mm:ss"
/// - Returns: 포맷에 맞는 String이 반환됩니다.
func now(format: String? = "yyyy-MM-dd hh:mm:ss") -> String {
    let dateFormatter = DateFormatter()
    if let format = format {
        dateFormatter.dateFormat = format
    }
    return dateFormatter.string(from: Date())
}

extension Date {
    ///Date값을 String으로 변환합니다. 기본 포맷은 "yyyy-MM-dd, hh:mm:ss"
    func string(format: String?  = "yyyy-MM-dd, hh:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        if let format = format {
            dateFormatter.dateFormat = format
        }
        return dateFormatter.string(from: self)
    }
}

extension String {
    ///String으로부터 Date를 만듭니다.
    func date(format: String  = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    

    /// String을 NSAttributedString으로 만듭니다.
    ///
    /// - Parameters:
    ///   - color: 글자 색. 넣지 않으면 무시됩니다.
    ///   - fontName: 폰트 이름, 만약 유효하지 않을 경우 무시됩니다.
    ///   - size: 글자 크기. 기본값은 12입니다.
    ///   - weight: 폰트 웨이트를 지정합니다. 참고 : UIFontWeight
    ///   - lineSpacing: 줄 간격입니다. 기본값은 0.0입니다.
    ///   - alignment: 정렬입니다. 기본은 .left입니다. 참고 : NSTextAlignment
    ///   - paragraphSpacing: 문단 간의 간격입니다. 넣지 않으면 무시됩니다.
    /// - Returns: 완성된 NSAttributedString를 반환합니다.
    func attributedString(color: UIColor? = nil, fontName: String? = nil, size: CGFloat = 12.0, weight: CGFloat = UIFontWeightRegular, lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        
        let allRange = NSRange(location: 0, length: attributedString.length)
        
        //컬러
        if let color = color {
            attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: allRange)
        }
        
        //폰트
        if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
            attributedString.addAttribute(NSFontAttributeName, value: font, range: allRange)
        } else {
            let font = UIFont.systemFont(ofSize: size, weight: weight)
            attributedString.addAttribute(NSFontAttributeName, value: font, range: allRange)
        }
        
        //행간,문단간
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        if let paragraphSpace = paragraphSpacing {
            paragraphStyle.paragraphSpacing = paragraphSpace
        }
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: allRange)
        
        return attributedString
    }
    
}

/// NSAttributedString을 위한 attribute 딕셔너리를 만들어 반환합니다.
///
/// - Parameters:
///   - color:
///   - color: 글자 색. 넣지 않으면 무시됩니다.
///   - fontName: 폰트 이름, 만약 유효하지 않을 경우 무시됩니다.
///   - size: 글자 크기. 기본값은 12입니다.
///   - weight: 폰트 웨이트를 지정합니다. 참고 : UIFontWeight
///   - lineSpacing: 줄 간격입니다. 기본값은 0.0입니다.
///   - alignment: 정렬입니다. 기본은 .left입니다. 참고 : NSTextAlignment
///   - paragraphSpacing: 문단 간의 간격입니다. 넣지 않으면 무시됩니다.
/// - Returns: 어트리뷰트가 들어 있는 딕셔너리의 형태로 반환됩니다.
func attributes(color: UIColor? = nil, fontName: String? = nil, size: CGFloat = 12.0, weight: CGFloat = UIFontWeightRegular, lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> [String : Any] {
    var attributes: [String : Any] = [:]
    if let color = color {
        attributes.updateValue(color, forKey: NSForegroundColorAttributeName)
    }
    
    if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
        attributes.updateValue(font, forKey: NSFontAttributeName)
    } else {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        attributes.updateValue(font, forKey: NSFontAttributeName)
    }
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    paragraphStyle.alignment = alignment
    if let paragraphSpace = paragraphSpacing {
        paragraphStyle.paragraphSpacing = paragraphSpace
    }
    attributes.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
    
    return attributes
}
