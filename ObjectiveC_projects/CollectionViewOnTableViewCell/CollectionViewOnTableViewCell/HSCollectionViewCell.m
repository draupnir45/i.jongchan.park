//
//  HSCollectionViewCell.m
//  NibXibPrac
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "HSCollectionViewCell.h"

@implementation HSCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self.squareThumb.layer setCornerRadius:6];
    
    
}

@end
