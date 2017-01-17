//
//  main.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Pokemon *hitokage = [[Pokemon alloc] init];
        hitokage.type = @"fire";
        hitokage.specificName = @"파이리";
        hitokage.skill1 = [[Skill alloc] init];
        hitokage.skill1.name = @"불꽃세례";
        hitokage.skill1.type = @"fire";
        hitokage.skill1.damage = 20;
        hitokage.currentHealth = 100;
        
        Pokemon *hoosigidane = [[Pokemon alloc] init];
        hoosigidane.type = @"leaf";
        hoosigidane.specificName = @"이상해씨";
        hoosigidane.skill1 = [[Skill alloc] init];
        hoosigidane.skill1.name = @"덩굴채찍";
        hoosigidane.skill1.type = @"leaf";
        hoosigidane.skill1.damage = 20;
        hoosigidane.currentHealth = 100;
        
        [hitokage attackEnemy:hitokage.skill1 attacker:hitokage target:hoosigidane];
        [hoosigidane attackEnemy:hoosigidane.skill1 attacker:hoosigidane target:hitokage];
        [hitokage attackEnemy:hitokage.skill1 attacker:hitokage target:hoosigidane];
        
    }
    return 0;
}



