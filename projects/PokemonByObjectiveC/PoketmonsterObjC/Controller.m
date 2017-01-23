//
//  Controller.m
//  PokemonByObjectiveC
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Controller.h"
#import "Pokemon.h"
#import "Skill.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation Controller

- (void)attackWith:(Skill *)skill
         attacker:(Pokemon *)attacker
           target:(Pokemon *)target {
    
    SynastryCalculator *calculator = [[SynastryCalculator alloc] init];
    
    CGFloat synastryWeight = [calculator calcSynastryFrom:skill.type to:target.type];
    
    if (attacker.type == skill.type) {
        synastryWeight = synastryWeight * 1.5;
    }
    
    NSInteger damage = roundf(synastryWeight) * skill.damage;
    
    [target damaged:damage];
    
    if (target.currentHealth <= 0) {
        NSLog(@"%@가 %@에게 %@ 공격! %@가 기절했습니다.",attacker.specificName, target.specificName, skill.name, target.specificName);
    } else {
        NSLog(@"%@가 %@에게 %@ 공격! HP가 %ld으로 깍였습니다.", attacker.specificName, target.specificName, skill.name, (long)target.currentHealth );
    }
    
}


@end
