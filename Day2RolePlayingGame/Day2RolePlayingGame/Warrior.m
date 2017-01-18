//
//  Warrior.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

-(Warrior *)init {
    self = [super init];
    self.haveWeapon = YES;
    self.className = @"전사";
    return self;
}

- (void)physicalAttackTo:(Person *)target {
    NSInteger damage = self.physicalPower;
    if (self.haveWeapon) {
        damage = self.physicalPower + 50;
    } else {
        NSLog(@"%@에게 무기가 없습니다! 맨손으로 공격합니다.", self.name);
    }
//    if (self.haveWeapon) {
//        damage = self.physicalPower + 50;
//    } else {
//        NSLog(@"%@에게 무기가 없습니다! 맨손으로 공격합니다.", self.name);
//    }
    

    
    
    NSLog(@"%@가 %@에게 %lu만큼의 데미지를 줍니다.",self.name, target.name, damage);
    [target damaged:damage];
    

}

- (void)magicalAttackWith:(id)weapon to:(Person *)target {
    NSLog(@"%@이(가) %lu만큼의 데미지를 줍니다.",self.name, (unsigned long)self.physicalPower);
}

@end
