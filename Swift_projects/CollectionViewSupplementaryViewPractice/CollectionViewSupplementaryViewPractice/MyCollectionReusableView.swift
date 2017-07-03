//
//  MyCollectionReusableView.swift
//  CollectionViewSupplementaryViewPractice
//
//  Created by 박종찬 on 2017. 7. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class MyCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    static let reuseID: String = "HeaderReusableView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
