//
//  main.m
//  DringkingGame
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drinker.h"
#import "SnackStealer.h"
#import "Snack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Drinker *jongchan = [[Drinker alloc] init];
        jongchan.name = @"종찬";
        jongchan.drinkingCapacity = 100;
        jongchan.alcoholLevel = 0;
        jongchan.alcoholysisCapacity = 10;
        
        Drinker *byungjun = [[Drinker alloc] init];
        byungjun.name = @"병준";
        byungjun.drinkingCapacity = 100;
        byungjun.alcoholLevel = 0;
        byungjun.alcoholysisCapacity = 10;
        
        
        SnackStealer *youngjin = [[SnackStealer alloc] init];
        youngjin.name = @"영진";
        youngjin.drinkingCapacity = 90;
        youngjin.alcoholLevel = 0;
        youngjin.alcoholysisCapacity = 5;
        
        
        SnackStealer *junmin = [[SnackStealer alloc] init];
        junmin.name = @"준민";
        junmin.drinkingCapacity = 80;
        junmin.alcoholLevel = 0;
        junmin.alcoholysisCapacity = 5;
        
        Snack *menu = [[Snack alloc] init];
        menu.leftAmount = 100;
        NSMutableArray *table = [[NSMutableArray alloc] init];
        [table addObject:jongchan];
        [table addObject:byungjun];
        [table addObject:youngjin];
        [table addObject:junmin];
        
        [jongchan offerToastTo:table];
        [youngjin eat:menu];
        [byungjun offerToastTo:table];
        [junmin eat:menu];
        [jongchan offerToastTo:table];
        [youngjin eat:menu];
        [byungjun offerToastTo:table];
        [junmin eat:menu];
        [jongchan offerToastTo:table];
        [youngjin eat:menu];
        [byungjun offerToastTo:table];
        [junmin eat:menu];
    }
    return 0;
}
