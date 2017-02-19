//
//  CustomTableViewCell.h
//  CustomTableViewCopy
//
//  Created by 박종찬 on 2017. 2. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, weak) UILabel *customTextLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *idLabel;
@property (nonatomic, weak) UIImageView *profilePhoto;
@property CGFloat imageSize;

@end
