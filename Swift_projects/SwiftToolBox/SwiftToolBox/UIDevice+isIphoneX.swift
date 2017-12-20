//
//  UIDevice+isIphoneX.swift
//  SwiftToolBox
//
//  Created by 박종찬 on 2017. 11. 8..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

extension UIDevice {
  var isIphoneX: Bool {
    return UIScreen.main.nativeBounds.height == 2436
  }
}

