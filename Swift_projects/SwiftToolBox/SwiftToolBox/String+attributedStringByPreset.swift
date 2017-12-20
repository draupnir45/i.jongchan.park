//
//  String+attributedStringByPreset.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 11. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//
import UIKit


extension String {
  
  enum AttributePreset {
    case body
    case headline
    case subheadline
  }
  
  func attributedString(font: UIFont, color: UIColor? = nil, customLineHeight: CGFloat? = nil, alignment: NSTextAlignment? = nil, kern: Double? = nil, lineBreakMode: NSLineBreakMode? = nil, underlineStyle: NSUnderlineStyle? = nil, strikeThroughStyle: NSUnderlineStyle? = nil) -> NSAttributedString {
    
    let finalKern: Double = kern ?? 0.0
    let finalLineHeight: CGFloat = customLineHeight ?? font.lineHeight
    let finalColor: UIColor = color ?? UIColor.black
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    paragraphStyle.lineSpacing = finalLineHeight - font.lineHeight
    
    if let alignment = alignment {
      paragraphStyle.alignment = alignment
    }
    
    if let lineBreakMode = lineBreakMode {
      paragraphStyle.lineBreakMode = lineBreakMode
    }
    
    var attributes: [NSAttributedStringKey: Any] = [
      .foregroundColor: finalColor,
      .font: font,
      .kern: finalKern,
      .paragraphStyle: paragraphStyle
    ]
    
    if let underlineStyle = underlineStyle {
      attributes.updateValue(underlineStyle.rawValue, forKey: NSAttributedStringKey.underlineStyle)
      
    }
    
    if let strikeThroughStyle = strikeThroughStyle {
      attributes.updateValue(strikeThroughStyle.rawValue, forKey: NSAttributedStringKey.strikethroughStyle)
      
    }
    
    return NSAttributedString.init(string: self, attributes: attributes)
  }
  
  func attributedString(byPreset preset: AttributePreset, color: UIColor? = nil, customLineHeight: CGFloat? = nil, alignment: NSTextAlignment? = nil, kern: Double? = nil, lineBreakMode: NSLineBreakMode? = nil, underlineStyle: NSUnderlineStyle? = nil, strikeThroughStyle: NSUnderlineStyle? = nil) -> NSAttributedString {
    let finalFont: UIFont
    let finalKern: Double
    let finalLineHeight: CGFloat
    
    switch preset {
    case .body:
      finalFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
      finalKern = kern ?? -0.3
      finalLineHeight = customLineHeight ?? 22.0
    case .headline:
      finalFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
      finalKern = kern ?? -0.3
      finalLineHeight = customLineHeight ?? 22.0
    case .subheadline:
      finalFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
      finalKern = kern ?? -0.3
      finalLineHeight = customLineHeight ?? 20.0
    }
    
    let finalColor: UIColor = color ?? UIColor.black    
    
    return self.attributedString(font: finalFont, color: finalColor, customLineHeight: finalLineHeight, alignment: alignment, kern: finalKern, lineBreakMode: lineBreakMode, underlineStyle: underlineStyle, strikeThroughStyle: strikeThroughStyle)
  }
  
}
