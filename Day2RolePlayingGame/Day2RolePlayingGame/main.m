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
        
        [jongchan setName:@"종찬"];
        
        NSLog(@"%@", jongchan.name);
        
        Warrior *youngjin = [[Warrior alloc] init];
        Warrior *junmin = [[Warrior alloc] init];
        Wizard *donghee = [[Wizard alloc] init];
        Wizard *mijung = [[Wizard alloc] init];
        Person *byungjun = [[Person alloc] init];
        
        jongchan.name = @"종찬";
        byungjun.name = @"병준";
        
        youngjin.health = @100;
        youngjin.mana = @100;
        youngjin.physicalPower = @60;
        youngjin.magicalPower = @40;
        youngjin.weapon = @"도";
        
        junmin.health = @100;
        junmin.mana = @100;
        junmin.physicalPower = @50;
        junmin.magicalPower = @50;
        junmin.weapon = @"검";
        
        donghee.health = @80;
        donghee.mana = @120;
        donghee.physicalPower = @20;
        donghee.magicalPower = @80;
        donghee.weapon = @"지팡이";
        
        mijung.health = @80;
        mijung.mana = @120;
        mijung.physicalPower = @30;
        mijung.magicalPower = @70;
        mijung.weapon = @"지팡이";
        
        
        NSLog(@"내 이름은 %@입니다.",jongchan.name);
        NSLog(@"전사인 영진의 상태: \n    체력: %@\n    마나: %@\n    물리공격: %@\n    마법공격: %@\n    장비: %@", youngjin.health, youngjin.mana, youngjin.physicalPower, youngjin.magicalPower, youngjin.weapon);
        NSLog(@"전사인 준민의 상태: \n    체력: %@\n    마나: %@\n    물리공격: %@\n    마법공격: %@\n    장비: %@", junmin.health, junmin.mana, junmin.physicalPower, junmin.magicalPower, junmin.weapon);
        [jongchan eat];
        [jongchan run];
        [jongchan walk];
        [byungjun eat];
        
        
        [youngjin physicalAttack];
        [youngjin magicalAttack];
        [junmin physicalAttack];
        [junmin magicalAttack];
        [donghee physicalAttack];
        [donghee magicalAttack];
        [mijung physicalAttack];
        [mijung magicalAttack];

    }
    return 0;
}
