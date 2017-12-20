//
//  FlameSegmentedControl.swift
//  THEREApp
//
//  Created by 박종찬 on 2017. 11. 2..
//  Copyright © 2017년 THERE. All rights reserved.
//
import UIKit

protocol FlameSegmentedControlDelegate: class {
  func segmentedControl(_ segmentedControl: FlameSegmentedControl, didSelectedIndex index: Int)
}

class FlameSegmentedControl: UIView {
  weak var delegate: FlameSegmentedControlDelegate?
  var segments: [FlameButton] = []
  var selectedIndex: Int = 0 {
    didSet {
      self.delegate?.segmentedControl(self, didSelectedIndex: selectedIndex)
      self.segments[oldValue].isSelected = false
      self.segments[selectedIndex].isSelected = true
    }
  }
  
  let rootStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setInitialState()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setInitialState()
  }
  
  convenience init(frame: CGRect, titles: [String]) {
    self.init(frame: frame)
    self.addSegments(titles)
  }
  
  func setInitialState() {
    backgroundColor = .white
    
    addSubview(rootStackView)
    rootStackView.frame = bounds
  }
  
  func addSegments(_ titles: [String]) {
    _ = titles.map { addSegment(title: $0) }
  }
  
  func addSegment(title: String) {
    let button = FlameButton.init(frame: CGRect.zero)
    self.segments.append(button)
    button.add { [weak self] button in
      guard 
        let `self` = self,
        let index = self.segments.index(of: button) 
        else { return }
      self.selectedIndex = index
    }
  }
  
  func setButtonCustom(view: UIView, appearanceHandler: @escaping FlameButtonAppearanceHandler) {
    _ = segments.map { button in
      guard let view = view.copy() as? UIView else { return }
      button.setCustomView(view, appearanceHandler: appearanceHandler) 
    }
    
  }
  

}
