//
//  HSCollectionViewCell.h
//  NibXibPrac
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *squareThumb;
@property (weak, nonatomic) IBOutlet UILabel *recipeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *recipeTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recipeCostLabel;

@end
