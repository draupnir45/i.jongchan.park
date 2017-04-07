//
//  JCButton.h
//  ButtonCustomPrac
//
//  Created by 박종찬 on 2017. 4. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JCButtonState)
{
    JCButtonStateNormal,
    JCButtonStateSelected
};

@interface JCButton : UIView

@property JCButtonState state;

@end
