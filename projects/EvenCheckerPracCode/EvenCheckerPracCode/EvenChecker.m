//
//  EvenChecker.m
//  EvenCheckerPracCode
//
//  Created by 박종찬 on 2017. 1. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "EvenChecker.h"

@implementation EvenChecker

+ (BOOL)isEvenNumber:(NSInteger)number {
    if (number % 2) {
        NSLog(@"홀수");
    } else {
        NSLog(@"짝수");
    }
    
    return !(number % 2);
}

@end
