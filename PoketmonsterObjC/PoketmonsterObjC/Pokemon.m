//
//  Pokemon.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (Pokemon *)initWithName:(id)specificName
              health:(int)health
                type:(id)type {
    self = [self init];
    self.specificName = specificName;
    self.health = health;
    self.currentHealth = health;
    self.type = type;
    self.skills = [NSMutableArray array];
//    for (int i = 0; i < 4; i++) {
//        self.skills = [self.skills arrayByAddingObject:[[Skill alloc] init]];
//    }
    return self;
}
/** 포켓몬으로 하여금 다른 포켓몬을 공격하도록 하는 함수입니다.
현재 Controller 클래스를 아직 만들지 않아 Pokemon 클래스에 있지만, 추후 옮길 예정입니다.

 @author Jongchan Park
 @date 2017. 1. 17
 */
- (void)attackEnemy:(Skill *)skill
         attacker:(Pokemon *)attacker
           target:(Pokemon *)target {
    
    SynastryCalc *calculator = [[SynastryCalc alloc] init];
    
    float synastryWeight = [calculator calcSynastryFrom:skill.type to:target.type];
    
    if (attacker.type == skill.type) {
        synastryWeight = synastryWeight * 1.5;
    }
    
    int damage = roundf(synastryWeight) * skill.damage;
    
    target.currentHealth = target.currentHealth - damage;
    
    if (target.currentHealth <= 0) {
        NSLog(@"%@가 %@에게 %@ 공격! %@가 기절했습니다.",attacker.specificName, target.specificName, skill.name, target.specificName);
    } else {
        NSLog(@"%@가 %@에게 %@ 공격! HP가 %d으로 깍였습니다.", attacker.specificName, target.specificName, skill.name, target.currentHealth );
    }
    
}

@end
