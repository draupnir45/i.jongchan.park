//
//  DemonicWarrior.h
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Warrior.h"

@interface DemonicWarrior : Warrior

@property BOOL haveMagicalSword;
@property BOOL weaponWakeUp;

-(void)wakeUpSword:(NSString *)sword;
-(DemonicWarrior *)initWithWarrior:(Warrior *)warrior;
- (void)meteorAt:(NSMutableArray *)field;

@end
