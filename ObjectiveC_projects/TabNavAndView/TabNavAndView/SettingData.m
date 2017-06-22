//
//  SettingData.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SettingData.h"



@implementation SettingData

+(instancetype)sharedSettings {
    
    static SettingData *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SettingData alloc] init];
    });
    
    return instance;
    
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.battleSixEnabled = NO;
        self.favoritePokemonIndexes = [[NSMutableArray alloc] init];
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"haveData"]) { //이전에 설정을 저장한 적이 있는지 확인합니다.
            self.favoritePokemonIndexes = [[[NSUserDefaults standardUserDefaults] objectForKey:@"favoritePokemonIndexes"] mutableCopy];
            self.tintColorChanged = [[NSUserDefaults standardUserDefaults] boolForKey:@"tintColorChanged"];
            self.battleSixEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"battleSixEnabled"];
        }
        

        
    }
    return self;
}

- (void)saveData { //설정을 저장합니다.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"haveData"];
    [[NSUserDefaults standardUserDefaults] setObject:self.favoritePokemonIndexes forKey:@"favoritePokemonIndexes"];
    [[NSUserDefaults standardUserDefaults] setBool:self.tintColorChanged forKey:@"tintColorChanged"];
    [[NSUserDefaults standardUserDefaults] setBool:self.battleSixEnabled forKey:@"battleSixEnabled"];
}


@end
