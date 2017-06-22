//
//  CustomView.m
//  StairPrac
//
//  Created by 박종찬 on 2017. 2. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (nonatomic, weak) UIImageView *imageViewForProfile;
@property (nonatomic, weak) UIView *profileTextContainer;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *detailLabel;

@end

@implementation CustomView

//초기화 메서드
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
        [self updateLayout];
    }
    return self;
}


- (void)createSubviews {
    
    
    
    UIImageView *imageViewForProfile = [[UIImageView alloc] init];

//    WithImage:[UIImage imageNamed:@"test.jpg"]
    imageViewForProfile.clipsToBounds = YES;
    
    [self addSubview:imageViewForProfile];
    //weak 선언시 해야함
    self.imageViewForProfile = imageViewForProfile;
    
    
    
    UIView *profileTextContainer = [[UIView alloc] init];
    [self addSubview:profileTextContainer];
    self.profileTextContainer = profileTextContainer;
    
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"PROFILE";
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.textAlignment = NSTextAlignmentRight;
    titleLabel.font = [UIFont systemFontOfSize:20 weight:0.7];
    titleLabel.contentMode = UIViewContentModeBottom;
    
    [profileTextContainer addSubview:titleLabel];
    self.titleLabel = titleLabel;

    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"이름";
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.textAlignment = NSTextAlignmentRight;
    nameLabel.contentMode = UIViewContentModeTop;
    nameLabel.font = [UIFont systemFontOfSize:50 weight:-0.5];
    
    [profileTextContainer addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.text = @"내용";
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.font = [UIFont systemFontOfSize:25];
    detailLabel.numberOfLines = 0;
    detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self addSubview:detailLabel];
    self.detailLabel = detailLabel;

    
}

- (void)updateLayout {
    
    const CGFloat MARGIN = 30;
    
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    self.imageViewForProfile.frame = CGRectMake(offsetX, offsetY, 100, 100);
    self.imageViewForProfile.layer.cornerRadius = self.imageViewForProfile.frame.size.width / 2;
    offsetX += self.imageViewForProfile.frame.size.width;

    
    self.profileTextContainer.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, self.imageViewForProfile.frame.size.height);
    
    offsetX = MARGIN;
    offsetY += self.imageViewForProfile.frame.size.height;
    
    self.detailLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - (MARGIN * 2), self.frame.size.height - offsetY - MARGIN);
    
    self.titleLabel.frame = CGRectMake(0, 0, self.profileTextContainer.frame.size.width, 30);

    self.nameLabel.frame = CGRectMake(0, 30, self.profileTextContainer.frame.size.width, self.profileTextContainer.frame.size.height - 30);
    
}

- (void)layoutTest {
    self.backgroundColor = [UIColor blackColor];
    self.imageViewForProfile.backgroundColor = [UIColor yellowColor];
    self.profileTextContainer.backgroundColor = [UIColor blueColor];
    self.detailLabel.backgroundColor = [UIColor redColor];
}

-(void)setDataWithImgURL:(NSString *)imgURLStr
                    name:(NSString *)nameStr
                     msg:(NSString *)msgStr {
    self.imageViewForProfile.image = [UIImage imageNamed:imgURLStr];
    self.nameLabel.text = nameStr;
    self.detailLabel.text = msgStr;
}

@end
