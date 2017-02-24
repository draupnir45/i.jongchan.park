//
//  SettingData.h
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingData : NSObject


@property (nonatomic, getter=isBattleSixEnabled) BOOL battleSixEnabled;
@property (nonatomic) BOOL tintColorChanged;
@property (nonatomic, retain) NSMutableArray *favoritePokemonIndexes;

+(instancetype)sharedSettings;

@end
