//
//  FlameButton.swift
//  THEREApp
//
//  Created by Mark on 2017. 10. 30..
//  Copyright © 2017년 THERE. All rights reserved.
//

import UIKit

typealias FlameButtonHandler = (FlameButton) -> Void
typealias FlameButtonAppearanceHandler = (Bool, UIView) -> Void

class FlameButton: UIView {
  
  var handler: FlameButtonHandler?
  
  var customView: UIView?
  var appearanceHandler: FlameButtonAppearanceHandler?
  
  var isSelected: Bool = false {
    didSet {
      if let appearanceHandler = appearanceHandler, let customView = customView {
        appearanceHandler(isSelected, customView)
      }
    }
  }
  let tapGestureRecognizer = UITapGestureRecognizer()
  
  private func setInitialState() {
    addGestureRecognizer(tapGestureRecognizer)
    tapGestureRecognizer.addTarget(self, action: #selector(self.executeHandler(_:)))
  }
  
  @objc func executeHandler(_ sender: UITapGestureRecognizer) {
    if let handler = handler {
      handler(self)
    }
  }
  
  func add(handler: @escaping FlameButtonHandler) {
    self.handler = handler
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setInitialState()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setInitialState()
  }
  
  func setCustomView(_ customView: UIView, appearanceHandler: @escaping FlameButtonAppearanceHandler) {
    addSubview(customView)
    customView.frame = bounds
    self.appearanceHandler = appearanceHandler
  }
  
}
