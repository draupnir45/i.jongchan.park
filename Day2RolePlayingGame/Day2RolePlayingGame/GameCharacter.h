//
//  GameCharacter.h
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject

@property NSString *name;
@property NSString *className;
@property NSInteger health;
@property NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;
@property NSInteger defensePoint;
@property NSInteger money;

-(void)damaged:(NSInteger)damage;

@end
