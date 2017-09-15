//
//  BeerTableViewCell.swift
//  EndlessBeerWorld
//
//  Created by 박종찬 on 2017. 7. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit
import SDWebImage

class BeerTableViewCell: UITableViewCell {
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    var bgView: UIView!
    static let reuseIdentifier: String = "BeerTableViewCell"

    //데이터 세팅
    var beerData: Beer! {
        didSet {
            self.beerImageView.setShowActivityIndicator(true)
            self.beerImageView.setIndicatorStyle(UIActivityIndicatorViewStyle.white)
            guard let placeholderImage = UIImage.init(named: "placeholder") else { return }
            self.beerImageView.sd_setImage(
                with: URL.init(string: beerData.imageUrlString),
                placeholderImage: placeholderImage)
            self.beerNameLabel.text = beerData.name
            self.tagLineLabel.text = beerData.tagline
            self.abvLabel.text = "ALCOHOL \(beerData.abv)%"
            self.ibuLabel.text = "BITTERNESS \(beerData.ibu)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView = UIView.init()
        bgView.backgroundColor = UIColor.white
        self.insertSubview(bgView, at: self.subviews.index(of: contentView)!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgView.frame = self.bounds
    }

}
