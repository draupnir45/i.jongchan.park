//
//  Person.h
//  DringkingGame
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Snack;

@interface Person : NSObject

@property NSString *name;
@property NSInteger drinkingCapacity;
@property NSInteger alcoholysisCapacity;
@property NSInteger alcoholLevel;

- (void)eat:(Snack *)snack;
- (void)drink;

@end
