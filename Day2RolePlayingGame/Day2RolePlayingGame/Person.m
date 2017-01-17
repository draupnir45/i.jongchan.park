//
//  Person.m
//  Day2RolePlayingGame
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"

@implementation Person
/**
 *퀵헬프 설명을 테스트합니다.
 *그러합니다요.
 *@Author 종찬
*/
-(id)eat {
    NSLog(@"%@이(가) 밥을 먹는다.", self.name);
    return nil;
}

-(id)run {
    NSLog(@"%@이(가) 뛴다.", self.name);
    return nil;
}

-(id)walk {
    NSLog(@"%@이(가) 걷는다.", self.name);
    return nil;
}

@end
