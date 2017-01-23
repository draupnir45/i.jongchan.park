//
//  main.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import "Type.h"
#import "Controller.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        Pokemon *hitokage = [[Pokemon alloc] initWithName:@"파이리" health:100 type:@"fire"];
        Skill *ember =[[Skill alloc] initWithName:@"불꽃세례" type:@"fire" damage:20];
        hitokage.skills[0] = ember;
        

        Pokemon *hoosigidane = [[Pokemon alloc] initWithName:@"이상해씨" health:100 type:@"leaf"];        
        Skill *vineWhip =[[Skill alloc] initWithName:@"덩굴채찍" type:@"leaf" damage:20];
        hoosigidane.skills[0] = vineWhip;
        
        Controller *controller = [[Controller alloc]init];
        
        
        [controller battleStartWith:hitokage To:hoosigidane];

        
        if (hitokage.currentHealth > hoosigidane.currentHealth) {
            NSLog(@"파이리가 승리했습니다!");
        } else if (hoosigidane.currentHealth > hitokage.currentHealth) {
            NSLog(@"이상해씨가 승리했습니다!");
        } else {
            NSLog(@"승패를 판단하는 과정에 문제가 생겼습니다!");
        }
        
    }
    return 0;
}



