//
//  Double+currencyString.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 9. 29..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

extension Double {
  func currencyString(currencyCode: String? = nil) -> String {
    let numberFormatter = NumberFormatter()
    if let currencyCode = currencyCode {
      numberFormatter.currencyCode = currencyCode
    }
    numberFormatter.numberStyle = .currency
    let number = NSNumber(value: self)
    
    if let resultString = numberFormatter.string(from: number) {
      return resultString
    } else {
      return "wrong number"
    }
  }
}
