//
//  CustomTableViewCell.h
//  StairPrac
//
//  Created by 박종찬 on 2017. 2. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

-(void)setDataWithImgURL:(NSString *)imgURLStr
                    name:(NSString *)nameStr
                     msg:(NSString *)msgStr;

- (void)updateLayout;

@end
