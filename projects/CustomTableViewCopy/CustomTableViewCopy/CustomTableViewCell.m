//
//  CustomTableViewCell.m
//  CustomTableViewCopy
//
//  Created by 박종찬 on 2017. 2. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "CustomTableViewCell.h"
@interface CustomTableViewCell()

@property (nonatomic, weak) UILabel *dynamicContentLabel;

@end


@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)createSubviews {
    
    UILabel *customTextLabel = [[UILabel alloc] init];
    self.customTextLabel = customTextLabel;
    [self.customTextLabel setFont:[UIFont systemFontOfSize:17]];
    
    [self.contentView addSubview:customTextLabel];
//     [self.textLabel setFrame:CGRectMake(70, 8, self.frame.size.width - 80, self.frame.size.height - 16)];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.customTextLabel setFrame:CGRectMake(70, 8, self.frame.size.width - 80, self.frame.size.height - 16)];
}

@end
