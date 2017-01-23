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
#import "Type.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation Controller
/** 포켓몬으로 하여금 다른 포켓몬을 공격하도록 하는 함수입니다.
 
 @author Jongchan Park
 @date 2017. 1. 17
*/
+ (void)attackWith:(Skill *)skill
         attacker:(Pokemon *)attacker
           target:(Pokemon *)target {
    
    //상성계산기를 불러, 상성을 계산합니다.
    CGFloat synastryWeight = [Controller calcSynastryFrom:skill.type to:target.type];
    
    //자속보정을 적용합니다.
    if (attacker.type == skill.type) {
        synastryWeight = synastryWeight * 1.5;
    }
    
    //데미지를 계산, 타겟에게 보냅니다.
    NSInteger damage = roundf(synastryWeight) * skill.damage;
    [target damaged:damage];
    
    //타겟이 기절했는지 확인하고, 기절하지 않았으면 HP를 로그에 표시합니다.
    if (target.currentHealth <= 0) {
        NSLog(@"%@가 %@에게 %@ 공격! %@가 기절했습니다.",attacker.specificName, target.specificName, skill.name, target.specificName);
    } else {
        NSLog(@"%@가 %@에게 %@ 공격! HP가 %ld으로 깍였습니다.", attacker.specificName, target.specificName, skill.name, (long)target.currentHealth );
    }
    
}


+ (void)battleStartWith:(Pokemon *)mine To:(Pokemon *)enemy {
    NSLog(@"전투가 시작됩니다.");
    NSLog(@"%@와 %@의 대결!", mine.specificName, enemy.specificName);
    while ((mine.currentHealth * enemy.currentHealth)>0) {
        
        [Controller battleComandBy:mine to:enemy];
        
        if ((mine.currentHealth * enemy.currentHealth)<=0) {
            break;
        }
        
        [Controller battleComandBy:enemy to:mine];
        
        if ((mine.currentHealth * enemy.currentHealth)<=0) {
            break;
        }
        
    }
    NSLog(@"전투가 종료되었습니다!");
}

+(void)battleComandBy:(Pokemon *)by to:(Pokemon *)to {
    int command;
    NSLog(@"%@는 무엇을 할까요? 1 : 공격, 2 : 도망", by.specificName);
    scanf("%d", &command);
    if (command == 1) {
        [Controller attackWith:by.skills[0] attacker:by target:to];
    } else if (command == 2) {
        NSLog(@"%@가 도망쳤습니다.",by.specificName);
        [by damaged:by.currentHealth];
//        break;
    } else {
        NSLog(@"잘못된 입력입니다.");
    }

}

+ (CGFloat)calcSynastryFrom:(NSString *)skillType
                         to:(NSString *)targetType {
    Type *typeRef = [[Type alloc]init];
    NSDictionary *skillData = [typeRef.index objectForKey:skillType];
    //타겟의 타입에 따라 적용될 가중치를 정합니다.
    CGFloat synastry = [[skillData objectForKey:targetType]floatValue];
    
    //상성 가중치를 반환합니다.
    return synastry;
}

@end
