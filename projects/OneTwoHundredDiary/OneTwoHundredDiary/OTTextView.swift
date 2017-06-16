//
//  OTTextView.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class OTTextView: UITextView {

    var indexPath: IndexPath?
    override var text: String! {
        didSet {
            print(text)
        }
    }

}
