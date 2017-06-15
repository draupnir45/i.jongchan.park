//
//  DiaryTableViewCell.swift
//  OneTwoHundredDiary
//
//  Created by 박종찬 on 2017. 6. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class OTDiaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dayLabel: UILabel!
    
    static let reuseIdentifier: String = "DiaryCell"
    static let nibName: String = "OTDiaryTableViewCell"
    static let height: Double = 196.0
    var indexPath: IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

