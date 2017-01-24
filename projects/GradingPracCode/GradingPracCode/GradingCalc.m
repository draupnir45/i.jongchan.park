//
//  GradingCalc.m
//  GradingPracCode
//
//  Created by 박종찬 on 2017. 1. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "GradingCalc.h"

@implementation GradingCalc

+(NSString *)gradeWithMarks:(NSInteger)marks {
    if (marks > 95) {
        return @"A+";
    } else if (marks > 90) {
        return @"A";
    } else if (marks > 85) {
        return @"B+";
    } else if (marks > 80) {
        return @"B";
    } else if (marks > 75) {
        return @"C+";
    } else if (marks > 70) {
        return @"C";
    } else if (marks > 55) {
        return @"D+";
    } else if (marks > 50) {
        return @"D";
    } else {
        return @"F";
    }
}

+(CGFloat)pointWithGrades:(NSString *)grades {

    if ([grades isEqualToString:@"A+"]) {
        return 4.5;
    } else if ([grades isEqualToString:@"A"]) {
        return 4.0;
    } else if ([grades isEqualToString:@"B+"]) {
        return 3.5;
    } else if ([grades isEqualToString:@"B"]) {
        return 3.0;
    } else if ([grades isEqualToString:@"C+"]) {
        return 2.5;
    } else if ([grades isEqualToString:@"C"]) {
        return 2.0;
    } else if ([grades isEqualToString:@"D+"]) {
        return 1.5;
    } else if ([grades isEqualToString:@"D"]) {
        return 1.0;
    } else if ([grades isEqualToString:@"F"]) {
        return 0.0;
    } else {
        NSLog(@"잘못된 학점입니다.");
        return 0.0;
    }
    
}

@end
