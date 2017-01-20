//
//  GameCharacter.h
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject

@property (readonly) NSString *name;
@property (readonly) NSInteger health;
@property (readonly) NSInteger physicalPower;
@property (readonly) NSInteger magicalPower;
@property (readonly) NSInteger defensePoint;
@property (readonly) NSString *className;
@property (readonly) BOOL isFainted;

-(void)damaged:(NSInteger)damage;
-(instancetype)initWithName:(NSString *)name;
-(void)setDefaultWithClassName:(NSString *) className
                        health:(NSInteger)  health
                 physicalPower:(NSInteger)  physicalPower
                  magicalPower:(NSInteger)  magicalPower
                  defensePoint:(NSInteger)  defensePoint;
-(void)setName:(NSString *)name;

@end
