//
//  Wizard.h
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "GameCharacter.h"
@class Warrior;
//#import "Warrior.h"

@interface Wizard : GameCharacter


@property NSString *weapon;

- (void)physicalAttackTo:(Warrior *)target;
- (void)fireBallTo:(id)target;
- (void)meteorAt:(NSMutableArray *)field;
- (void)lightningBoltTo:(id)target SecondTarget:(id)target2 andThirdTarget:(id)target3;
- (void)expelliarmusTo:(Warrior *)target;

@end
