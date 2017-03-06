//
//  AppDelegate.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingData.h"

@interface AppDelegate ()

@property SettingData *settings;

@end

@implementation AppDelegate



///저장되는 설정을 불러옵니다.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.settings = [SettingData sharedSettings];
    [self setTintChanged:self.settings.tintColorChanged];
    
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //어플리케이션이 종료되기 전에 설정을 저장해 줍니다.
    [self.settings saveData];
}

///틴트컬러를 설정에 따라 바꾸어 줍니다.
- (void)setTintChanged:(BOOL)tintChanged {
    if (tintChanged) [self.window setTintColor:[UIColor blueColor]];
    else [self.window setTintColor:[UIColor redColor]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadAppDelegateTable" object:nil];
    self.settings.tintColorChanged = tintChanged;
}


@end
