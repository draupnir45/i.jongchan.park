//
//  ClassCalculator.m
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ClassCalculator.h"
#import "Person.h"

@implementation ClassCalculator

-(CGFloat)sumOfDegreesOf:(Person *)person {
    CGFloat sum = person.math + person.literature + person.science + person.society;
    return sum;
}
-(CGFloat)averageOf:(Person *)person {
    CGFloat avg = [self sumOfDegreesOf:person] / 4;
    return avg;
}

@end
