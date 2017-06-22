//
//  Fibonacci.m
//  FibonacciPrac
//
//  Created by 박종찬 on 2017. 2. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

+(NSArray *)makeFibonacciArray:(NSUInteger)numb {
    
    if (numb == 0) {
        NSArray *result = @[];
        return result;
    } else if (numb == 1) {
        NSArray *result = @[@0];
        return result;
    } else if (numb == 2) {
        NSArray *result = @[@0,@1];
        return result;
    } else {
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        [resultArray addObject:@0];
        [resultArray addObject:@1];

        
        for (NSInteger i=0; i<numb; i++) {
            [resultArray addObject: [NSNumber numberWithInteger:([resultArray[i] integerValue] + [resultArray[i+1] integerValue])]];
        }
        
        return resultArray;
        
    }
    
}


@end
