//
//  CustomTableViewCell.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.customImageView.layer setCornerRadius:self.customImageView.frame.size.height/2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
