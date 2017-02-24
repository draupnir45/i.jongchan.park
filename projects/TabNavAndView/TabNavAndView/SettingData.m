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
    
    NSLog(@"sharedSettings을 실행합니다.");
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
        NSLog(@"세팅 싱글톤 초기화중...");
        self.battleSixEnabled = NO;
        self.favoritePokemonIndexes = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
