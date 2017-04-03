//
//  BookCoverCollectionViewCell.h
//  BookShelfCollectionViewPrac
//
//  Created by 박종찬 on 2017. 4. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCoverCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property CGFloat heightByWidthRatio;

+ (CGFloat)getImageRatioWithImage:(UIImage *)image;

@end
