//
//  Controller.h
//  PokemonByObjectiveC
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pokemon;
@class Skill;

@interface Controller : NSObject

- (void)attackWith:(Skill *)skill
           attacker:(Pokemon *)attacker
             target:(Pokemon *)target;


- (void)battleStartWith:(Pokemon *)mine To:(Pokemon *)enemy;

@end
