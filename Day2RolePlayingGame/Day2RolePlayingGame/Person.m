//
//  Person.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)damaged:(NSInteger)damage {
    damage -= self.defensePoint;
    self.health = self.health - damage;

    if (self.health <= 0) {
        NSLog(@"------------------------------------");
        NSLog(@"%@이(가) 기절했습니다!",self.name);
        NSLog(@"------------------------------------");
    } else {
        NSLog(@"%@의 HP가 %ld가 되었습니다!",self.name,(long)self.health);
    }
}

@end
