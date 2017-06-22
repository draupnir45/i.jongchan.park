//
//  RoundedButton.swift
//  LoginSignUpPractice
//
//  Created by 박종찬 on 2017. 6. 1..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
}
