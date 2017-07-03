//
//  LabelCollectionViewCell.swift
//  CollectionViewSupplementaryViewPractice
//
//  Created by 박종찬 on 2017. 7. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    static let reuseID: String = "LabelCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        self.selectedBackgroundView = UIView.init()
        self.selectedBackgroundView?.backgroundColor = UIColor.gray
    }
    
}
