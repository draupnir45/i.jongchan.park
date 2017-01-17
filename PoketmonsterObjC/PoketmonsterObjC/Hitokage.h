//
//  Hitokage.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Pokemon.h"

@interface Hitokage : Pokemon

@property Appearance *rootAppearance;

//첫 번째 진화 관련
@property id ev2Level;
@property Appearance *ev2Appearance;
@property EvolutionGain *ev2Gain;

//두 번째 진화 관련
@property id ev3Level;
@property Appearance *ev3Appearance;
@property EvolutionGain *ev3Gain;

@end
