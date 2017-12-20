//
//  String+nsRange.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 11. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

extension String {
  /// Returns NSRange of subString.
  ///
  /// - Parameter subString: target sub string
  /// - Returns: NSRange converted from Range
  func nsRange(of subString: String) -> NSRange? {
    guard let range = self.range(of: subString) else { return nil }
    let location: Int = self.distance(from: self.startIndex, to: range.lowerBound)
    let length: Int = self.distance(from: range.lowerBound, to: range.upperBound)
    return NSRange(location: location, length: length)
  }
}

