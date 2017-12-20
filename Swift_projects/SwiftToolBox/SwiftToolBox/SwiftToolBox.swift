//
//  AlertPack.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 6. 1..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

//typealias SimpleNoneVoidClosure = (() -> Void)

let defaultDateFormatString = "MMM d, yyyy"

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
  func attributedString(color: UIColor? = nil, fontName: String? = nil, size: CGFloat = 12.0, weight: UIFont.Weight = UIFont.Weight.regular, lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> NSAttributedString {
    
    let attributedString = NSMutableAttributedString(string: self)
    
    let allRange = NSRange(location: 0, length: attributedString.length)
    
    //컬러
    if let color = color {
      attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: allRange)
    }
    
    //폰트
    if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
    } else {
      let font = UIFont.systemFont(ofSize: size, weight: weight)
      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
    }
    
    //행간,문단간
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    paragraphStyle.alignment = alignment
    if let paragraphSpace = paragraphSpacing {
      paragraphStyle.paragraphSpacing = paragraphSpace
    }
    attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: allRange)
    
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
func attributes(color: UIColor? = nil, fontName: String? = nil, size: CGFloat = 12.0, weight: UIFont.Weight = UIFont.Weight.regular, lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> [NSAttributedStringKey : Any] {
  var attributes: [NSAttributedStringKey : Any] = [:]
  if let color = color {
    attributes.updateValue(color, forKey: NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue))
  }
  
  if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
    attributes.updateValue(font, forKey: NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue))
  } else {
    let font = UIFont.systemFont(ofSize: size, weight: weight)
    attributes.updateValue(font, forKey: NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue))
  }
  
  let paragraphStyle = NSMutableParagraphStyle()
  paragraphStyle.lineSpacing = lineSpacing
  paragraphStyle.alignment = alignment
  if let paragraphSpace = paragraphSpacing {
    paragraphStyle.paragraphSpacing = paragraphSpace
  }
  attributes.updateValue(paragraphStyle, forKey: NSAttributedStringKey(rawValue: NSAttributedStringKey.paragraphStyle.rawValue))
  
  return attributes
}

//
//extension String {
//  
//  func lineSpacedAttributedString(lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> NSAttributedString {
//    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.lineSpacing = lineSpacing
//    paragraphStyle.alignment = alignment
//    if let paragraphSpace = paragraphSpacing {
//      paragraphStyle.paragraphSpacing = paragraphSpace
//    }
//    
//    return NSAttributedString.init(string: self, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle])
//  }
//  
//  /// String을 NSAttributedString으로 만듭니다.
//  ///
//  /// - Parameters:
//  ///   - color: 글자 색. 넣지 않으면 무시됩니다.
//  ///   - fontName: 폰트 이름, 만약 유효하지 않을 경우 무시됩니다.
//  ///   - size: 글자 크기. 기본값은 12입니다.
//  ///   - weight: 폰트 웨이트를 지정합니다. 참고 : UIFontWeight
//  ///   - lineSpacing: 줄 간격입니다. 기본값은 0.0입니다.
//  ///   - alignment: 정렬입니다. 기본은 .left입니다. 참고 : NSTextAlignment
//  ///   - paragraphSpacing: 문단 간의 간격입니다. 넣지 않으면 무시됩니다.
//  /// - Returns: 완성된 NSAttributedString를 반환합니다.
//  func attributedString(color: UIColor? = nil, fontName: String? = nil, size: CGFloat = 12.0, weight: UIFont.Weight = UIFont.Weight.regular, lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil) -> NSAttributedString {
//    
//    let attributedString = NSMutableAttributedString(string: self)
//    
//    let allRange = NSRange(location: 0, length: attributedString.length)
//    
//    //컬러
//    if let color = color {
//      attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: allRange)
//    }
//    
//    //폰트
//    if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
//      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
//    } else {
//      let font = UIFont.systemFont(ofSize: size, weight: weight)
//      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
//    }
//    
//    //행간,문단간
//    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.lineSpacing = lineSpacing
//    paragraphStyle.alignment = alignment
//    if let paragraphSpace = paragraphSpacing {
//      paragraphStyle.paragraphSpacing = paragraphSpace
//    }
//    attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: allRange)
//    
//    return attributedString
//  }
//  
//  
//  /// String을 NSAttributedString으로 만듭니다.
//  ///
//  /// - Parameters:
//  ///   - color: 글자 색. 넣지 않으면 무시됩니다.
//  ///   - fontName: 폰트 이름, 만약 유효하지 않을 경우 무시됩니다.
//  ///   - size: 글자 크기. 기본값은 12입니다.
//  ///   - weight: 폰트 웨이트를 지정합니다. 참고 : UIFontWeight
//  ///   - lineSpacing: 줄 간격입니다. 기본값은 0.0입니다.
//  ///   - alignment: 정렬입니다. 기본은 .left입니다. 참고 : NSTextAlignment
//  ///   - paragraphSpacing: 문단 간의 간격입니다. 넣지 않으면 무시됩니다.
//  /// - Returns: 완성된 NSAttributedString를 반환합니다.
//  func attributedString(color: UIColor? = nil, font: UIFont? = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body), lineSpacing: CGFloat = 0.0, alignment: NSTextAlignment = .left, paragraphSpacing: CGFloat? = nil, kern: Double?) -> NSAttributedString {
//    
//    let attributedString = NSMutableAttributedString(string: self)
//    
//    let allRange = NSRange(location: 0, length: attributedString.length)
//    
//    //컬러
//    if let color = color {
//      attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: allRange)
//    }
//    
//    //    //폰트
//    //    if let fontName = fontName, let font = UIFont.init(name: fontName, size: size) {
//    //      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
//    //    } else {
//    //      let font = UIFont.systemFont(ofSize: size, weight: weight)
//    //      attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allRange)
//    //    }
//    
//    if let kern = kern {
//      attributedString.addAttribute(NSAttributedStringKey.kern, value: kern, range: allRange)
//    }
//    
//    //행간,문단간
//    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.lineSpacing = lineSpacing
//    paragraphStyle.alignment = alignment
//    paragraphStyle.lineBreakMode = NSLineBreakMode.byCharWrapping
//    if let paragraphSpace = paragraphSpacing {
//      paragraphStyle.paragraphSpacing = paragraphSpace
//    }
//    attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: allRange)
//    
//    return attributedString
//  }
//}

