//
//  Warrior.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"
#import "DemonicWarrior.h"

@implementation Warrior

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.haveWeapon = YES;
        [self setDefaultWithClassName:@"전사" health:220 physicalPower:70 magicalPower:30 defensePoint:20];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super initWithName:name];
    [self setDefaultWithClassName:@"전사" health:220 physicalPower:70 magicalPower:30 defensePoint:20];
    return self;
}

- (void)physicalAttackTo:(GameCharacter *)target {
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className,self.name);
    } else {
        NSInteger damage = self.physicalPower;
        if (self.haveWeapon) {
            damage = self.physicalPower + 50;
        } else {
            NSLog(@"%@ %@에게 무기가 없습니다! 맨손으로 공격합니다.",self.className, self.name);
        }
        
        NSLog(@"%@ %@이(가) %@ %@에게 %lu만큼의 데미지를 줍니다.", self.className,self.name,target.className, target.name, damage);
        [target damaged:damage];
    }
    

}

@end
