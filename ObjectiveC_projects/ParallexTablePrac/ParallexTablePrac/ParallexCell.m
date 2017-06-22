//
//  ParallexCell.m
//  ParallexTablePrac
//
//  Created by 박종찬 on 2017. 2. 18..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ParallexCell.h"
@interface ParallexCell()

@property (nonatomic, weak) UIScrollView *scrollViewForParallex;
//@property (nonatomic, weak) UIView *textHolder;

//@property UILabel *titleLabel;
//@property UIView *subTitleHolder;
//@property UILabel *subTitle;

@end

@implementation ParallexCell

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
    
    self.backgroundView = [[UIView alloc] init];
    
    UIScrollView *scrollViewForParallex = [[UIScrollView alloc] init];
    scrollViewForParallex.scrollEnabled = NO;
    [self.backgroundView addSubview:scrollViewForParallex];
    self.scrollViewForParallex = scrollViewForParallex;
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    [self.scrollViewForParallex addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    
    UIView *textHolder = [[UIView alloc] init];
    [self.contentView addSubview:textHolder];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat scrollViewContentHeight = 2;
    self.scrollViewForParallex.frame = self.frame;
    self.scrollViewForParallex.contentSize = CGSizeMake(self.frame.size.width, 340);
    self.scrollViewForParallex.contentOffset = CGPointMake(0, 0);
    
    self.backgroundImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*scrollViewContentHeight);
    
}

@end
