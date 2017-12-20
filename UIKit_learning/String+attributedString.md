# String 익스텐션으로 디자이너의 침공에 대비하자. (NSAttributedString)

앱 개발을 하게 되면 보통 UI 디자인은 Sketch로 하게 됩니다. 그리고 그 디자인을 제플린이나 여타 툴로 받아서 구현하게 되는데요. 제플린은 정말 좋은 툴이라 텍스트에 필요한 여러 옵션을 읽어서 글꼴 프리셋을 만들어 주기도 합니다. 하지만 늘 그렇듯 자동화라는 게 스스로 짜놓은 것만 못하고, 또 어쩌다가 실수로 0.1만 틀려진 설정도 다 다른 설정으로 받아들입니다.

그렇다고 안 쓰자니, Sketch에서는 버튼 한 두개로 바꿀 수 있는 설정이 개발에서는 그리 간단히 되질 않습니다. 그래서 스케치에서 할 수 있는 글꼴 설정의 (거의) 모든 걸 지원할 수 있는 익스텐션을 만들었습니다.

### Code

```swift
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
```

### Usage
```swift
// to use preset 'body'
"String to apply".attributedString(byPreset: .body) 
// to add underline to 'body'
"String to apply".attributedString(byPreset: .body, underlineStyle: NSUnderlineStyle.styleSingle) 
```