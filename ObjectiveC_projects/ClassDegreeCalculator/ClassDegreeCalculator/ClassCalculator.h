//
//  ClassCalculator.h
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface ClassCalculator : NSObject


-(CGFloat)sumOfDegreesOf:(Person *)person;
-(CGFloat)averageOf:(Person *)person;

@end
