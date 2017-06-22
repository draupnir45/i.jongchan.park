//
//  CustomTableViewCell.m
//  StairPrac
//
//  Created by 박종찬 on 2017. 2. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()

@property (nonatomic, weak) UIImageView *imageViewForProfile;
@property (nonatomic, weak) UIView *profileTextContainer;
@property (nonatomic, weak) UILabel *myTitleLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *myDetailLabel;

@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    
    [self.contentView addSubview:imageViewForProfile];
    //weak 선언시 해야함
    self.imageViewForProfile = imageViewForProfile;
    
    
    
    UIView *profileTextContainer = [[UIView alloc] init];
    [self.contentView addSubview:profileTextContainer];
    self.profileTextContainer = profileTextContainer;
    
    
    
    UILabel *myTitleLabel = [[UILabel alloc] init];
    myTitleLabel.text = @"PROFILE";
    myTitleLabel.textColor = [UIColor lightGrayColor];
    myTitleLabel.textAlignment = NSTextAlignmentRight;
    myTitleLabel.font = [UIFont systemFontOfSize:20 weight:0.7];
    
    [profileTextContainer addSubview:myTitleLabel];
    self.myTitleLabel = myTitleLabel;
    
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"이름";
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.textAlignment = NSTextAlignmentRight;
    nameLabel.contentMode = UIViewContentModeTop;
    nameLabel.font = [UIFont systemFontOfSize:50 weight:-0.5];
    
    [profileTextContainer addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
    
    UILabel *myDetailLabel = [[UILabel alloc] init];
    myDetailLabel.text = @"내용";
    myDetailLabel.textColor = [UIColor grayColor];
    myDetailLabel.font = [UIFont systemFontOfSize:25];
    myDetailLabel.numberOfLines = 0;
    myDetailLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.contentView addSubview:myDetailLabel];
    self.myDetailLabel = myDetailLabel;
    
    
}

- (void)updateLayout {
    
    const CGFloat MARGIN = 15;
    
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    self.imageViewForProfile.frame = CGRectMake(offsetX, offsetY, 100, 100);
    self.imageViewForProfile.layer.cornerRadius = self.imageViewForProfile.frame.size.width / 2;
    offsetX += self.imageViewForProfile.frame.size.width;
    
    
    self.profileTextContainer.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, self.imageViewForProfile.frame.size.height);
    
    offsetX = MARGIN;
    offsetY += self.imageViewForProfile.frame.size.height;
    
    self.myDetailLabel.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - (MARGIN * 2), self.frame.size.height - offsetY - MARGIN);
    
    self.myTitleLabel.frame = CGRectMake(0, 0, self.profileTextContainer.frame.size.width, 30);
    
    self.nameLabel.frame = CGRectMake(0, 30, self.profileTextContainer.frame.size.width, self.profileTextContainer.frame.size.height - 30);
    
}

- (void)layoutTest {
    self.backgroundColor = [UIColor blackColor];
    self.imageViewForProfile.backgroundColor = [UIColor yellowColor];
    self.profileTextContainer.backgroundColor = [UIColor blueColor];
    self.myDetailLabel.backgroundColor = [UIColor redColor];
}

-(void)setDataWithImgURL:(NSString *)imgURLStr
                    name:(NSString *)nameStr
                     msg:(NSString *)msgStr {
    self.imageViewForProfile.image = [UIImage imageNamed:imgURLStr];
    self.nameLabel.text = nameStr;
    self.myDetailLabel.text = msgStr;
}

-(void)layoutSubviews {
    [self updateLayout];
}


@end
