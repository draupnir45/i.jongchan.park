//
//  Warrior.h
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
@class Wizard;

@interface Warrior : Person


@property NSString *weapon;
@property BOOL haveWeapon;

- (void)physicalAttackTo:(Wizard *)target;
- (void)magicalAttackWith:(NSString *)weapon to:(Wizard *)target;

@end
