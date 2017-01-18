//
//  Person.m
//  DringkingGame
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
#import "Snack.h"

@implementation Person

- (void)eat:(Snack *)snack {
    if (snack.leftAmount <= 0) {
        NSLog(@"%@이(가) 안주를 먹으려 했지만, 안주가 남아있지 않습니다.", self.name);
    } else {
        NSLog(@"%@이(가) 안주를 먹습니다. 술이 조금 분해됩니다.", self.name);
        self.alcoholLevel -= self.alcoholysisCapacity;
    }
}
- (void)drink {
    NSLog(@"%@이(가) 술을 마십니다.", self.name);
    self.alcoholLevel += 10;
    if (self.drinkingCapacity <= self.alcoholLevel) {
        NSLog(@"%@이(가) 꽐라가 되었습니다!", self.name);
    }
}

@end
