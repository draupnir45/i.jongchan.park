//
//  GradingCalc.h
//  GradingPracCode
//
//  Created by 박종찬 on 2017. 1. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GradingCalc : NSObject

+(NSString *)gradeWithMarks:(NSInteger)marks;
+(CGFloat)pointWithGrades:(NSString *)grades;

@end
