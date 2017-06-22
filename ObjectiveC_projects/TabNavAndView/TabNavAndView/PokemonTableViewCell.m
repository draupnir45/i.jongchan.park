//
//  PokemonTableViewCell.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PokemonTableViewCell.h"



@implementation PokemonTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tintColor = [[[UIApplication sharedApplication] keyWindow] tintColor];
        [self createSubviews];
    }
    return self;
}



- (void)createSubviews {
    UILabel *numberLabel = [[UILabel alloc] init];
    [numberLabel setTextColor:self.tintColor];
    [numberLabel setAlpha:1.0];
    [numberLabel setFont:[UIFont systemFontOfSize:12 weight:-0.3]];
    
    
    [self.contentView addSubview:numberLabel];
    self.numberLabel = numberLabel;
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.numberLabel setFrame:CGRectMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y+10, self.frame.size.width, self.frame.size.height)];
    [self.numberLabel sizeToFit];
    
    CGRect textLabelFrame = self.textLabel.frame;
    CGFloat const textLabelMargin = 15;
    textLabelFrame.origin.y += textLabelMargin;
    textLabelFrame.size.height -= textLabelMargin;
    
    [self.textLabel setFrame:textLabelFrame];
    
}



@end
