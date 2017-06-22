//
//  SnackStealer.m
//  DringkingGame
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SnackStealer.h"
#import "Snack.h"

@implementation SnackStealer

-(void)secretPouring {
    int randomIndex = arc4random() % 10;
    
    if (randomIndex < 4) {
        NSLog(@"%@이(가) 버리기에 성공합니다!",self.name);
        self.alcoholLevel -= self.alcoholysisCapacity;
    } else {
        NSLog(@"%@이(가) 버리다가 걸립니다! 두잔을 더 마십니다!",self.name);
        [super drink];
        [super drink];
    }
    
}
-(void)orderSnacks:(Snack *)todaysMenu {
    todaysMenu.leftAmount = 100;
}

-(void)drink {
    [self secretPouring];
}

@end
