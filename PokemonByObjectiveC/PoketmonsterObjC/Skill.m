//
//  Skill.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Skill.h"

@implementation Skill

-(Skill *)initWithName:(id)name
                 type:(id)type
               damage:(int)damage {
    self = [self init];
    self.name = name;
    self.type = type;
    self.damage = damage;
    return self;
}

@end
