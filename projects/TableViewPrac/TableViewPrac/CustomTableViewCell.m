//
//  CustomTableViewCell.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (self) {
        [self.imageView setFrame:CGRectMake(15, 0, 96, 96)];
        UIView *imageFrame = [[UIView alloc] initWithFrame:CGRectMake(20, 5, 86, 86)];
        [imageFrame.layer setCornerRadius:43];
        [imageFrame.layer setBorderWidth:1];
        [imageFrame setBackgroundColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:98.0/255.0 blue:166.0/255.0 alpha:1.0]];
        [self addSubview:imageFrame];
        [self sendSubviewToBack:imageFrame];
        
        
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.imageView setFrame:CGRectMake(10, 0, 60, 60)];
        UIView *imageFrame = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        [imageFrame.layer setCornerRadius:20];
        [imageFrame setBackgroundColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:98.0/255.0 blue:166.0/255.0 alpha:1.0]];
        [self addSubview:imageFrame];
        [self sendSubviewToBack:imageFrame];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.imageView setFrame:CGRectMake(15, 0, 96, 96)];
        UIView *imageFrame = [[UIView alloc] initWithFrame:CGRectMake(20, 5, 86, 86)];
        [imageFrame.layer setCornerRadius:43];
        [imageFrame setBackgroundColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:98.0/255.0 blue:166.0/255.0 alpha:1.0]];
        [self addSubview:imageFrame];
        [self sendSubviewToBack:imageFrame];
        
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
