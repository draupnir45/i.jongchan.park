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
@class DemonicWarrior;
//#import "Warrior.h"

@interface Wizard : GameCharacter

- (instancetype)initWithName:(NSString *)name;
- (void)fireBallTo:(id)target;
- (void)meteorAt:(NSMutableArray *)field;
- (void)expelliarmusTo:(Warrior *)target;
- (DemonicWarrior *)makeWeaponOfWarriorMagical:(Warrior*)warrior;

@end
