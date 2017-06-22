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
#import "EngStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Person *jongchan = [[Person alloc] initWithName:@"종찬"];
        
        Person *jongchan = [[Person alloc] initWithName:@"종찬" math:50 literature:40 science:30 society:45];
        
        ClassCalculator * calculator = [[ClassCalculator alloc]init];
        
        NSLog(@"합계: %f, 평균: %f ",[calculator sumOfDegreesOf:jongchan], [calculator averageOf:jongchan]);
        
        [jongchan setDefaultWithZero];
        NSLog(@"합계: %f, 평균: %f ",[calculator sumOfDegreesOf:jongchan], [calculator averageOf:jongchan]);
        
        [jongchan setDefaultWithMath:100 literature:100 science:100 society:100];
        
        NSLog(@"합계: %f, 평균: %f ",[calculator sumOfDegreesOf:jongchan], [calculator averageOf:jongchan]);
        
        EngStudent *test = [[EngStudent alloc]initWithName:@"test" math:203 literature:384 science:879 society:987 eng:768];
    }
    return 0;
}
