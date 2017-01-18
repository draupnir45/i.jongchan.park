//
//  main.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Warrior.h"
#import "Wizard.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *jongchan;
        jongchan = [[Person alloc] init];
        
        jongchan.money=346;
        
        
        [jongchan setName:@"종찬"];
        
        Warrior *youngjin = [[Warrior alloc] init];
        Warrior *junmin = [[Warrior alloc] init];
        Wizard *donghee = [[Wizard alloc] init];
        Wizard *mijung = [[Wizard alloc] init];
        Person *byungjun = [[Person alloc] init];
        
        jongchan.name = @"종찬";
        byungjun.name = @"병준";
        
        youngjin.name = @"영진";
        youngjin.health = 100;
        youngjin.mana = 100;
        youngjin.physicalPower = 60;
        youngjin.magicalPower = 40;
        youngjin.weapon = @"도";
        youngjin.defensePoint = 30;
        
        junmin.name = @"준민";
        junmin.health = 100;
        junmin.mana = 100;
        junmin.physicalPower = 20;
        junmin.magicalPower = 50;
        junmin.weapon = @"검";
        junmin.defensePoint = 20;
        
        donghee.name = @"동희";
        donghee.health = 80;
        donghee.mana = 120;
        donghee.physicalPower = 20;
        donghee.magicalPower = 80;
        donghee.weapon = @"지팡이";
        donghee.defensePoint = 10;
        
        mijung.name = @"미정";
        mijung.health = 80;
        mijung.mana = 120;
        mijung.physicalPower = 30;
        mijung.magicalPower = 70;
        mijung.weapon = @"지팡이";
        mijung.defensePoint = 10;

        
        NSMutableArray *field = [[NSMutableArray alloc] init];
        
        [field addObject:youngjin];
        [field addObject:junmin];
        [field addObject:mijung];
        [field addObject:donghee];
        
        NSLog(@"====================================");
        NSLog(@"-----------전투가 시작됩니다!------------");
        NSLog(@"====================================");
        [donghee expelliarmusTo:junmin];
        NSLog(@"====================================");
        [junmin physicalAttackTo:donghee];
        NSLog(@"====================================");
        [donghee meteorAt:field];
        NSLog(@"====================================");
        [mijung meteorAt:field];
        NSLog(@"====================================");
        [youngjin physicalAttackTo:mijung];
        NSLog(@"====================================");
        [donghee physicalAttackTo:youngjin];
        

        

    }
    return 0;
}
