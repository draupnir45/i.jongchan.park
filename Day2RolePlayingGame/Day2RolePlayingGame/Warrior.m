//
//  Warrior.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

- (id)physicalAttack {
    NSLog(@"전사가 %@만큼의 데미지를 줍니다.",self.physicalPower);
    return nil;
}

- (id)magicalAttack {
    NSLog(@"전사가 %@만큼의 데미지를 줍니다.",self.magicalPower);
    return nil;
}

@end
