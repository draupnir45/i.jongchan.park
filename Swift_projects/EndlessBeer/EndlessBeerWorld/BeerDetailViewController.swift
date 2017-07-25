//
//  BeerDetailViewController.swift
//  EndlessBeerWorld
//
//  Created by 박종찬 on 2017. 7. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit
import SDWebImage

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var beerData: Beer!
    private var viewsForAnimation: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = beerData.name
        self.beerImageView.setShowActivityIndicator(true)
        self.beerImageView.setIndicatorStyle(UIActivityIndicatorViewStyle.white)
        self.beerImageView.sd_setImage(with: URL.init(string: beerData.imageUrlString)!, placeholderImage: UIImage.init(named: "placeholder"))
        self.abvLabel.text = "ALCOHOL \(beerData.abv)%"
        self.ibuLabel.text = "BITTERNESS \(beerData.ibu)"
        self.descriptionLabel.text = beerData.beerDescription
        
        //애니메이션을 위한 어레이
        self.viewsForAnimation.append(self.beerImageView)
        self.viewsForAnimation.append(self.abvLabel)
        self.viewsForAnimation.append(self.ibuLabel)
        self.viewsForAnimation.append(self.descriptionLabel)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //순차적 애니메이션
        let translationX: CGFloat = self.view.frame.size.width
        var differentiator: Double = 1.0
        
        for viewForAnimation in viewsForAnimation {
            viewForAnimation.transform = CGAffineTransform.init(translationX: translationX + CGFloat(10.0 * differentiator), y: 0)
            differentiator += 1.0
        }
        
        differentiator = 1.0
        
        for viewForAnimation in viewsForAnimation {
            UIView.animate(withDuration: 1.2, delay: 0.1 * differentiator, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                viewForAnimation.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
            differentiator += 1.0
        }
    }
}
