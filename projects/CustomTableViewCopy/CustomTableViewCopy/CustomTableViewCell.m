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
    
    UIImageView *profilePhoto = [[UIImageView alloc] init];
    [profilePhoto.layer setCornerRadius:3];
    [profilePhoto setClipsToBounds:YES];
    [self.contentView addSubview:profilePhoto];
    self.profilePhoto = profilePhoto;
    
    
    UILabel *customTextLabel = [[UILabel alloc] init];
    [self.customTextLabel setFont:[UIFont systemFontOfSize:17 weight:-0.3]];
    
    [self.contentView addSubview:customTextLabel];
    self.customTextLabel = customTextLabel;
    
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:19]];
    
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *idLabel = [[UILabel alloc] init];
    [idLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [idLabel setTextColor:[UIColor lightGrayColor]];
    
    [self.contentView addSubview:idLabel];
    self.idLabel = idLabel;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat MARGIN_X = 10;
    const CGFloat MARGIN_Y = 8;
    
    CGFloat offsetX = MARGIN_X;
    CGFloat offsetY = MARGIN_Y;
    
    [self.profilePhoto setFrame:CGRectMake(offsetX, offsetY, self.imageSize, self.imageSize)];
    
    [self.nameLabel setFrame:CGRectMake(0, 0, self.frame.size.width - 80, 20)];
    //    [self.nameLabel sizeToFit];
    CGSize nameLabelSizeThatFits = [self.nameLabel sizeThatFits:self.nameLabel.frame.size];
    
    offsetX += self.profilePhoto.frame.size.width + MARGIN_X;
    
    [self.nameLabel setFrame:CGRectMake(offsetX, offsetY, nameLabelSizeThatFits.width, 20)];
    
    offsetY += self.nameLabel.frame.size.height + MARGIN_Y;
    
    [self.customTextLabel setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN_X, self.frame.size.height - offsetY - MARGIN_Y)];
    
    
    offsetX = self.nameLabel.frame.origin.x + nameLabelSizeThatFits.width + 5;
    offsetY = MARGIN_Y;
    [self.idLabel setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - 5, 20)];

    
    
}

@end
