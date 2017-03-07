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

///취소와 확인 액션을 자동으로 받고, 뷰 컨트롤러의 세그를 작동시킵니다.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                          viewController:(UIViewController *)viewController
                         segueIdentifier:(NSString *)segueIdentifier;

///스위치 밸류가 바뀐 경우 받아서 확인하면 그대로 두고 취소하면 값을 원래대로 바꿔 줍니다.
+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                           touchedSwitch:(UISwitch *)touchedSwitch;

@end
