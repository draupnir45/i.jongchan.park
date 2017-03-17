//
//  JCAlertController.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAlertController : UIAlertController


///취소를 자동으로 만들어주는 메서드, 취소 액션의 타이틀을 넣을 수 있습니다.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle;


///하나의 액션과 함께 블록을 넘기면 실행해줍니다.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             actionTitle:(NSString *)actionTitle
                                 handler:(void (^)(UIAlertAction *action))handler;


///스위치 밸류가 바뀐 경우 받아서 확인하면 그대로 두고 취소하면 값을 원래대로 바꿔 줍니다.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                           touchedSwitch:(UISwitch *)touchedSwitch;

///okTitle을 탭하면 컴플리션 블록 안에 있는 것을 실행.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                               okHandler:(void (^)(UIAlertAction *))handler;

@end
