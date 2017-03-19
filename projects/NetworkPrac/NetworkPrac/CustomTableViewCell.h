//
//  CustomTableViewCell.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *fcImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
