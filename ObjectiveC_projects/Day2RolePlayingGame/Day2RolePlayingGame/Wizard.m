//
//  Wizard.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Wizard.h"
#import "Warrior.h"
#import "DemonicWarrior.h"

@implementation Wizard

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultWithClassName:@"마법사" health:200 physicalPower:30 magicalPower:70 defensePoint:10];
    }
    return self;
}


- (instancetype)initWithName:(NSString *)name {
    self = [[super initWithName:name] init];
    return self;
}


- (void)fireBallTo:(GameCharacter *)target {
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className ,self.name);
    } else {
        NSLog(@"%@ %@이(가) %@ %@에게 파이어볼로 %lu만큼의 데미지를 줍니다.",self.className, self.name, target.className, target.name,(unsigned long)self.magicalPower);
        [target damaged:self.magicalPower];
    }

}

- (void)meteorAt:(NSMutableArray *)field {
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className ,self.name);
    } else {
        NSInteger numberOfCharacterInField = [field count];
        NSInteger i;
        NSLog(@"%@ %@이(가) 메테오를 사용합니다!", self.className, self.name);
        NSLog(@"%@을(를) 제외한 모두가 데미지를 받습니다!", self.name);
        for (i=0; i<numberOfCharacterInField; i++) {
            GameCharacter *target = ((GameCharacter *)field[i]);
            
            if (field[i] != self) {
                if (target.health > 0 ) {
                    [target damaged:self.magicalPower];
                }
            }
        }
    }
}


- (void)expelliarmusTo:(Warrior *)target{
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className ,self.name);
    } else {
        NSLog(@"%@ %@이(가) %@ %@을(를) 무장해제합니다!",self.className, self.name, target.className, target.name);
        target.haveWeapon = NO;
    }
}

- (DemonicWarrior *)makeWeaponOfWarriorMagical:(Warrior*)warrior {
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className ,self.name);
        return nil;
    } else {
        if (warrior.isFainted) {
            NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!", warrior.className, warrior.name);
            return nil;
        } else {
            NSLog(@"%@ %@이(가) %@ %@의 무기에 마법을 걸어줍니다.",self.className,self.name, warrior.className, warrior.name);
            DemonicWarrior * newDemonic = [[DemonicWarrior alloc] initWithWarrior:warrior];
            return newDemonic;
        }
    }
}

@end
