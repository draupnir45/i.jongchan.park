//
//  main.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharacter.h"
#import "Warrior.h"
#import "Wizard.h"
#import "DemonicWarrior.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Warrior *youngjin = [[Warrior alloc] initWithName:@"영진"];
        Warrior *junmin = [[Warrior alloc] initWithName:@"준민"];
        Wizard *donghee = [[Wizard alloc] initWithName:@"동희"];
        Wizard *mijung = [[Wizard alloc] initWithName:@"미정"];
        
        
        NSLog(@"%@",youngjin.className);
        
        NSMutableArray *field = [[NSMutableArray alloc] init];
        
        [field addObject:youngjin];
        [field addObject:junmin];
        [field addObject:mijung];
        [field addObject:donghee];
        
        
        DemonicWarrior *demonicYoungjin = [donghee makeWeaponOfWarriorMagical:youngjin];
        [field replaceObjectAtIndex:[field indexOfObject:youngjin] withObject:demonicYoungjin];
        
        
        [demonicYoungjin wakeUpSword:demonicYoungjin.weapon];
        [mijung meteorAt:field];
        [junmin physicalAttackTo:demonicYoungjin];
        [donghee fireBallTo:mijung];
        [demonicYoungjin physicalAttackTo:junmin];
        [mijung fireBallTo:demonicYoungjin];
        [junmin physicalAttackTo:demonicYoungjin];
        [demonicYoungjin meteorAt:field];
        [donghee fireBallTo:mijung];
        [mijung fireBallTo:donghee];
        [donghee fireBallTo:mijung];
        [demonicYoungjin meteorAt:field];

        
        

    }
    return 0;
}
