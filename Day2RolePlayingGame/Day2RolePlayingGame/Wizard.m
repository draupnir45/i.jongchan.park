//
//  Wizard.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

- (id)physicalAttack {
    NSLog(@"마법사가 %@만큼의 데미지를 줍니다.",self.physicalPower);
    return nil;
}

- (id)magicalAttack {
    NSLog(@"마법사가 %@만큼의 데미지를 줍니다.",self.magicalPower);
    return nil;
}

@end
