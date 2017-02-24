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
    
    //NSUserDefaults로부터 설정을 불러오고, 세팅합니다.
    
    self.settings = [SettingData sharedSettings];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"haveData"]) { //설정을 저장한 적이 있는지 확인합니다.
        [self loadSettings]; //
    }
    
    [self setTintChanged:self.settings.tintColorChanged];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"haveData"];
    [[NSUserDefaults standardUserDefaults] setObject:self.settings.favoritePokemonIndexes forKey:@"favoritePokemonIndexes"];
    [[NSUserDefaults standardUserDefaults] setBool:self.settings.tintColorChanged forKey:@"tintColorChanged"];
    [[NSUserDefaults standardUserDefaults] setBool:self.settings.battleSixEnabled forKey:@"battleSixEnabled"];
}

///틴트컬러를 설정에 따라 바꾸어 줍니다.
- (void)setTintChanged:(BOOL)tintChanged {
    if (tintChanged) [self.window setTintColor:[UIColor blueColor]];
    else [self.window setTintColor:[UIColor redColor]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadAppDelegateTable" object:nil];
    self.settings.tintColorChanged = tintChanged;
}

///NSUserDefaults로부터 설정을 불러 와 싱글턴 설정에 넣습니다.
- (void)loadSettings {
    self.settings.favoritePokemonIndexes = [[[NSUserDefaults standardUserDefaults] objectForKey:@"favoritePokemonIndexes"] mutableCopy];
    self.settings.tintColorChanged = [[NSUserDefaults standardUserDefaults] boolForKey:@"tintColorChanged"];
    self.settings.battleSixEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"battleSixEnabled"];

}

@end
