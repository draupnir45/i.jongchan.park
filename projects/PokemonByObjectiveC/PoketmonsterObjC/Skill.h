//
//  Skill.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject

@property NSString *name;
@property NSString *type;
@property NSInteger damage;
@property id effect;

-(Skill*)initWithName:(id)name
                 type:(NSString *)type
               damage:(int)damage;


@end
