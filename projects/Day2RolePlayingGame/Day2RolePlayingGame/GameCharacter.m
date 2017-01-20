//
//  GameCharacter.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter ()

@property (readwrite) NSString *name;
@property (readwrite) NSInteger health;
@property (readwrite) NSInteger physicalPower;
@property (readwrite) NSInteger magicalPower;
@property (readwrite) NSInteger defensePoint;
@property (readwrite) NSString *className;
@property (readwrite) BOOL isFainted;


@end

@implementation GameCharacter

-(void)damaged:(NSInteger)damage {

    if (!self.isFainted) {
        damage -= self.defensePoint;
        self.health = self.health - damage;
            if (self.health <= 0) {
                NSLog(@"------------------------------------");
                NSLog(@"*********%@이(가) 기절했습니다!*********",self.name);
                NSLog(@"------------------------------------");
                self.health = 0;
                self.isFainted = YES;
            } else {
                NSLog(@"%@ %@의 HP가 %ld가 되었습니다!",self.className,self.name,(long)self.health);
            }
    }

}


- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.isFainted = NO;
    }
    return self;
}

-(void)setDefaultWithClassName:(NSString *) className
                        health:(NSInteger)  health
                 physicalPower:(NSInteger)  physicalPower
                  magicalPower:(NSInteger)  magicalPower
                  defensePoint:(NSInteger)  defensePoint{
    self.className = className;
    self.health = health;
    self.physicalPower = physicalPower;
    self.magicalPower = magicalPower;
    self.defensePoint = defensePoint;
}



@end
