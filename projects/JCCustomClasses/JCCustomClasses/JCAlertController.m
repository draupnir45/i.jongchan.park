//
//  JCAlertController.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCAlertController.h"

@interface JCAlertController ()

@end

@implementation JCAlertController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle {
    
    JCAlertController *alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    return alert;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                          viewController:(UIViewController *)viewController
                         segueIdentifier:(NSString *)segueIdentifier {
    
    JCAlertController *alert = [JCAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:preferredStyle
                                                               cancelTitle:cancelTitle];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [viewController performSegueWithIdentifier:segueIdentifier sender:alert];
    }];
    
    [alert addAction:okAction];
    
    return alert;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                             cancelTitle:(NSString *)cancelTitle
                                 okTitle:(NSString *)okTitle
                           touchedSwitch:(UISwitch *)touchedSwitch {
    
    JCAlertController *alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [touchedSwitch setOn:!touchedSwitch.on];
    }];
    
    [alert addAction:cancelAction];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    
    return alert;
}


@end
