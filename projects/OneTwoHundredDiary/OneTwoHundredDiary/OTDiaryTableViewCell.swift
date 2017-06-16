//
//  DiaryTableViewCell.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class OTDiaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: OTTextView!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    static let reuseIdentifier: String = "DiaryCell"
    
    static let nibName: String = "OTDiaryTableViewCell"
    
    static let height: Double = 196.0
    
}

