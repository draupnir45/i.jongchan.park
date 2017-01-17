//
//  Pokemon.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appearance.h"
#import "EvolutionGain.h"
#import "Skill.h"
#import "SynastryCalc.h"

@interface Pokemon : NSObject

//기본정보
@property id specificName;
@property id appearance;

//트레이너관련
@property id nickName;
@property id trainer;
//@property id firstTrainer;

////레벨 관련
//@property id exp;
//@property id level;
//- (void)gainExp;

//전투에 의한 현 상태
@property int currentHealth;
@property int health;
//@property id status;

//기술
@property NSMutableArray *skills;
//@property id skill2;
//@property id skill3;
//@property id skill4;

//타입
@property id type;
//@property id type2;

//능력치
@property id attack;
@property id defense;
@property id specialAttack;
@property id specialDefense;

//진화관련 상황
//@property id evolveStatus;
//@property id evolvable;
//- (void)evolve;

//일러스트
@property Appearance *rootAppearance;

////첫 번째 진화 관련
//@property id ev2Level;
//@property Appearance *ev2Appearance;
//@property EvolutionGain *ev2Gain;
//
////두 번째 진화 관련
//@property id ev3Level;
//@property Appearance *ev3Appearance;
//@property EvolutionGain *ev3Gain;
//


- (void)attackEnemy:(Skill *)skill
         attacker:(Pokemon *)attacker
           target:(Pokemon *)target;
//- (void)run;
- (Pokemon *)initWithName:(id)specificName
              health:(int)health
                type:(id)type;

@end
