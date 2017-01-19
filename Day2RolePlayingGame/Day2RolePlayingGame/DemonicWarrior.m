//
//  DemonicWarrior.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 19..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DemonicWarrior.h"

@implementation DemonicWarrior

-(DemonicWarrior *)initWithWarrior:(Warrior *)warrior {
    self = [[super initWithName:warrior.name] init];
    
    NSLog(@"검사 %@이(가) 마검사로 승급합니다!",warrior.name);
    
    self.haveWeapon = warrior.haveWeapon;
    self.haveMagicalSword = YES;
    self.weaponWakeUp = NO;
    [self setDefaultWithClassName:@"마검사" health:warrior.health physicalPower:warrior.physicalPower magicalPower:(warrior.magicalPower*1.5) defensePoint:warrior.defensePoint];
    
    return self;
}


-(void)wakeUpSword:(NSString *)sword {
    if (self.isFainted) {
        NSLog(@"%@이(가) 기절해서 움직일 수 없습니다!",self.name);
    } else {
        if (self.haveMagicalSword) {
            self.weaponWakeUp = YES;
            NSLog(@"%@이(가) 마검을 각성시킵니다! 검의 공격력이 3배가 되었습니다.",self.name);
        } else {
            NSLog(@"%@이(가) 검을 각성시키려고 시도했지만, 실패했습니다! %@의 검은 마법 무기가 아닙니다!",self.name,self.name);
        }
    }
}

- (void)physicalAttackTo:(GameCharacter *)target {
    if (self.isFainted) {
        NSLog(@"%@ %@이(가) 기절해서 움직일 수 없습니다!",self.className,self.name);
    } else {
        NSInteger damage = self.physicalPower;
        if (self.weaponWakeUp) {
            damage = 3 * (self.physicalPower + 50);
        }else if (self.haveWeapon) {
            damage = self.physicalPower + 50;
        } else {
            NSLog(@"%@ %@에게 무기가 없습니다! 맨손으로 공격합니다.",self.className, self.name);
        }
        
        NSLog(@"%@ %@이(가) %@ %@에게 %lu만큼의 데미지를 줍니다.", self.className,self.name,target.className, target.name, damage);
        [target damaged:damage];
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
                    [target damaged:self.magicalPower-20];
                }
            }
        }
    }
}

@end
