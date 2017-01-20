//
//  Pokemon.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Pokemon.h"

@interface Pokemon ()

//기본정보
@property (readwrite) NSString *specificName;
@property (readwrite) id appearance;

//트레이너관련
@property (readwrite) NSString *nickName;
@property (readwrite) id trainer;
//@property id firstTrainer;

////레벨 관련
//@property id exp;
//@property id level;
//- (void)gainExp;

//전투에 의한 현 상태
@property (readwrite)NSInteger currentHealth;
@property (readwrite)NSInteger health;
//@property id status;

//기술
@property (readwrite)NSMutableArray *skills;
//@property id skill2;
//@property id skill3;
//@property id skill4;

//타입
@property (readwrite) id type;
//@property id type2;

//능력치
@property (readwrite) NSInteger attack;
@property (readwrite) NSInteger defense;
@property (readwrite) NSInteger specialAttack;
@property (readwrite) NSInteger specialDefense;

//진화관련 상황
//@property id evolveStatus;
//@property id evolvable;
//- (void)evolve;

//일러스트
@property (readwrite) Appearance *rootAppearance;

////첫 번째 진화 관련
//@property id ev2Level;
//@property Appearance *ev2Appearance;
//@property EvolutionGain *ev2Gain;
//
////두 번째 진화 관련
//@property id ev3Level;
//@property Appearance *ev3Appearance;
//@property EvolutionGain *ev3Gain;

@end



@implementation Pokemon

- (Pokemon *)initWithName:(NSString *)specificName
              health:(NSInteger)health
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
    
    SynastryCalculator *calculator = [[SynastryCalculator alloc] init];
    
    float synastryWeight = [calculator calcSynastryFrom:skill.type to:target.type];
    
    if (attacker.type == skill.type) {
        synastryWeight = synastryWeight * 1.5;
    }
    
    int damage = roundf(synastryWeight) * skill.damage;
    
    target.currentHealth = target.currentHealth - damage;
    
    if (target.currentHealth <= 0) {
        NSLog(@"%@가 %@에게 %@ 공격! %@가 기절했습니다.",attacker.specificName, target.specificName, skill.name, target.specificName);
    } else {
        NSLog(@"%@가 %@에게 %@ 공격! HP가 %ld으로 깍였습니다.", attacker.specificName, target.specificName, skill.name, (long)target.currentHealth );
    }
    
}

@end
