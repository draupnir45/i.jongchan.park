//
//  Drinker.m
//  DringkingGame
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Drinker.h"

@implementation Drinker

-(void)offerToastTo:(NSMutableArray *)table {
    NSLog(@"%@이(가) 건배를 제안합니다!", self.name);
    NSInteger size = [table count];
    NSInteger i;
    for (i=0; i<size; i++) {
        Person *target = ((Person *)table[i]);
        [target drink];
    }
}
-(void)BottomsupWith:(Person *)target {
    [self drink];
    [target drink];
}
//-(void)dyingMsg{
//    
//}

@end
