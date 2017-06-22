//
//  main.m
//  GradingPracCode
//
//  Created by 박종찬 on 2017. 1. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GradingCalc.h"


int main(int argc, const char * argv[]) {
    
    NSString *grade = [GradingCalc gradeWithMarks:96];
    CGFloat point = [GradingCalc pointWithGrades:grade];
    
    NSLog(@"점수는 %.1f, %@ 입니다.",point,grade);
    
    return 0;
}
