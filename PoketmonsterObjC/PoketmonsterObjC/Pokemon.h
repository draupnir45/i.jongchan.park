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

@interface Pokemon : NSObject

//트레이너 관련
@property id specificName;
@property id nickName;
@property id trainer;
@property id firstTrainer;

//레벨 관련
@property id exp;
@property id level;

//전투에 의한 현 상태
@property id currentHealth;
@property id health;
@property id status;

//기술
@property id skill1;
@property id skill2;
@property id skill3;
@property id skill4;

//타입
@property id type;
@property id type2;

//능력치
@property id attack;
@property id defense;
@property id specialAttack;
@property id specialDefense;

//진화관련
@property id evolveStatus;
@property id appearance;
@property id evolutionable;

- (void)evolve;
- (void)gainExp;

@end
