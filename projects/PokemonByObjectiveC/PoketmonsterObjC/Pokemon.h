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

@interface Pokemon : NSObject

//기본정보
@property (readonly) NSString *specificName;
@property (readonly) id appearance;

//트레이너관련
@property (readonly) NSString *nickName;
@property (readonly) id trainer;
//@property id firstTrainer;

////레벨 관련
//@property id exp;
//@property id level;
//- (void)gainExp;

//전투에 의한 현 상태
@property (readonly)NSInteger currentHealth;
@property (readonly)NSInteger health;
//@property id status;

//기술
@property (readonly)NSMutableArray *skills;
//@property id skill2;
//@property id skill3;
//@property id skill4;

//타입
@property (readonly) NSString *type;
//@property id type2;

//능력치
@property (readonly) NSInteger attack;
@property (readonly) NSInteger defense;
@property (readonly) NSInteger specialAttack;
@property (readonly) NSInteger specialDefense;

//진화관련 상황
//@property id evolveStatus;
//@property id evolvable;
//- (void)evolve;

//일러스트
//@property (readonly) Appearance *rootAppearance;

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



//- (void)run;
- (Pokemon *)initWithName:(NSString *)specificName
              health:(NSInteger)health
                type:(NSString *)type;
- (void)damaged:(NSInteger)damage;
@end
