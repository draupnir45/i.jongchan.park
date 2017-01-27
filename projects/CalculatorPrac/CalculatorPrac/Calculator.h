//
//  Calculator.h
//  CalculatorPrac
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property NSMutableArray *numbArray;
@property NSMutableArray *opArray;
@property NSMutableArray *formula;

-(BOOL)numOpChecker:(NSString *)character;
-(void)categorizeCharacterAfterNumbWith:(NSString *)nextChar nextTo:(NSUInteger)index;
-(void)categorizeCharacterAfterOpWith:(NSString *)nextChar nextTo:(NSUInteger)index;
-(CGFloat)calculteFormular:(NSString *)formula;

@end
