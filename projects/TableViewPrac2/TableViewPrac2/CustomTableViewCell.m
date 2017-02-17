//
//  CustomTableViewCell.m
//  TableViewPrac2
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomTableViewCell.h"


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.customImageView = [[UIImageView alloc] init];
        self.customImageView.frame = CGRectMake(15, 15, 60, 60);
        [self.customImageView.layer setCornerRadius:30];
        [self.customImageView setClipsToBounds:YES];
        [self addSubview:self.customImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
