//
//  JCCardViewController.h
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JCCardViewStatus) {
    JCCardViewStatusClosed,         //카드가 열려있지 않은 상황을 나타냅니다.
    JCCardViewStatusOpened,
    JCCardViewStatusEditing
};

@interface JCCardViewController : UIViewController

@end
