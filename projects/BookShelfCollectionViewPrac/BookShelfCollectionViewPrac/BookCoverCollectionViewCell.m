//
//  BookCoverCollectionViewCell.m
//  BookShelfCollectionViewPrac
//
//  Created by 박종찬 on 2017. 4. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "BookCoverCollectionViewCell.h"

@implementation BookCoverCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

- (void)layoutSubviews {
    //get ratio and layout bookcover
    CGFloat heightByWidthRatio = [BookCoverCollectionViewCell getImageRatioWithImage:self.coverImageView.image];
    
    if (heightByWidthRatio <= (172.0f/96.0f)) {
        CGFloat newHeight = heightByWidthRatio * 96.0f;
        self.coverImageView.frame = CGRectMake(0, self.frame.size.height - newHeight, 96.0f, newHeight);
    } else {
        CGFloat newWidth = 172.0f / heightByWidthRatio;
        self.coverImageView.frame = CGRectMake(0, 0, newWidth, 172.0f);
    }
    
    NSLog(@"layoutSubviews");
}

+ (CGFloat)getImageRatioWithImage:(UIImage *)image
{
    return image.size.height/image.size.width;
}

@end
