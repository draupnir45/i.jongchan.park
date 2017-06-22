//
//  CustomView.h
//  StairPrac
//
//  Created by 박종찬 on 2017. 2. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

-(void)setDataWithImgURL:(NSString *)imgURLStr
                    name:(NSString *)nameStr
                     msg:(NSString *)msgStr;

@end
