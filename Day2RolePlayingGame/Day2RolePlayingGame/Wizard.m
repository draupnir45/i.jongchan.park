//
//  Wizard.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Wizard.h"
#import "Warrior.h"

@implementation Wizard

-(Wizard *)init {
    self = [super init];
    self.className = @"마법사";
    return self;
}

- (void)physicalAttackTo:(GameCharacter *)target {
    NSLog(@"%@가 %@에게 %lu만큼의 데미지를 줍니다.",self.name, target.name,(unsigned long)self.physicalPower);
    [target damaged:self.physicalPower];
}

- (void)fireBallTo:(GameCharacter *)target {
    NSLog(@"%@가 %@에게 %lu만큼의 데미지를 줍니다.",self.name, target.name,(unsigned long)self.magicalPower);
    [target damaged:self.physicalPower];

}

- (void)meteorAt:(NSMutableArray *)field {
    NSInteger numberOfCharacterInField = [field count];
    NSInteger i;
    NSLog(@"%@가 메테오를 사용합니다!", self.name);
    NSLog(@"%@을(를) 제외한 모두가 데미지를 받습니다!", self.name);
    for (i=0; i<numberOfCharacterInField; i++) {
        GameCharacter *target = ((GameCharacter *)field[i]);
        
        if (field[i] != self) {
            [target damaged:self.magicalPower];
        }
        
    }
}
- (void)lightningBoltTo:(GameCharacter *)target SecondTarget:(GameCharacter *)target2 andThirdTarget:(GameCharacter *)target3 {

}

- (void)expelliarmusTo:(Warrior *)target{
    NSLog(@"%@가 전사를 무장해제합니다!", self.name);
    target.haveWeapon = NO;
}

@end
