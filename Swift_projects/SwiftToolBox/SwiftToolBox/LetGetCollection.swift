//
//  LetGetCollection.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 11. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class LetGetViewController: UIViewController {

let scrollView: UIScrollView = {
  let scrollView = UIScrollView()
  return scrollView
}()

let verticalStackView: UIStackView = {
  let stackView = UIStackView()
  stackView.axis = .vertical
  stackView.alignment = .fill
  stackView.distribution = .fill
  return stackView
}()

let horizontalStackView: UIStackView = {
  let stackView = UIStackView()
  stackView.axis = .horizontal
  stackView.alignment = .fill
  stackView.distribution = .fill
  return stackView
}()

let imageView: UIImageView = {
  let imageView = UIImageView()
  imageView.contentMode = .scaleAspectFill
  return imageView
}()

let label: UILabel = {
  let label = UILabel()
  label.numberOfLines = 0
  return label
}()

let button: UIButton = {
  let button = UIButton()
  return button
}()

let justView: UIView = {
  let view = UIView()
  return view
}()
  
let textView: UITextView = {
  let view = UITextView()
  return view
}()

  func setSubviews() {
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setSubviews()
  }
  
  func attributes() -> [NSAttributedStringKey: Any] {
    return [
      .font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body),
      .foregroundColor: UIColor.black,
    ]
  }
  
}
