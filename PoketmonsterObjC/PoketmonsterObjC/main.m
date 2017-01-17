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
        
        
        
        NSLog(@"전투가 시작됩니다.");
        
        while ((hitokage.currentHealth * hoosigidane.currentHealth)>0) {
            int command;
            
            NSLog(@"파이리는 무엇을 할까요? 1 : 공격, 2 : 도망");
            scanf("%d", &command);
            if (command == 1) {
                [hitokage attackEnemy:hitokage.skill1 attacker:hitokage target:hoosigidane];
            } else if (command == 2) {
                NSLog(@"파이리가 도망쳤습니다.");
                hitokage.currentHealth = 0;
                break;
            } else {
                NSLog(@"잘못된 입력입니다.");
            }
            
            if ((hitokage.currentHealth * hoosigidane.currentHealth)<=0) {
                break;
            }

            
            NSLog(@"이상해씨는 무엇을 할까요? 1 : 공격, 2 : 도망");
            scanf("%d", &command);
            
            if (command == 1) {
                [hoosigidane attackEnemy:hoosigidane.skill1 attacker:hoosigidane target:hitokage];
            } else if (command == 2) {
                NSLog(@"이상해씨가 도망쳤습니다.");
                hoosigidane.currentHealth = 0;
                break;
            } else {
                NSLog(@"잘못된 입력입니다.");
            }
            
            if ((hitokage.currentHealth * hoosigidane.currentHealth)<=0) {
                break;
            }
            
        }
        NSLog(@"전투가 종료되었습니다!");
        
        if (hitokage.currentHealth > hoosigidane.currentHealth) {
            NSLog(@"파이리가 승리했습니다!");
        } else if (hoosigidane.currentHealth > hitokage.currentHealth) {
            NSLog(@"이상해씨가 승리했습니다!");
        } else {
            NSLog(@"문제가 생겼습니다!");
        }
        
        
    }
    return 0;
}



