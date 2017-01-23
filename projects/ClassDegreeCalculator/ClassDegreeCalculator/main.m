//
//  main.m
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "ClassCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *jongchan = [[Person alloc] initWithName:@"종찬"];
        jongchan.math = 4.534;
        jongchan.literature = 4.054;
        jongchan.science = 4.540;
        jongchan.society = 3.535;
        
        ClassCalculator * calculator = [[ClassCalculator alloc]init];
        
        NSLog(@"합계: %f, 평균: %f ",[calculator sumOfDegreesOf:jongchan], [calculator averageOf:jongchan]);
        
        
    }
    return 0;
}
