//
//  Person.h
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (readonly) NSString *name;
@property (readonly) double math;
@property (readonly) double literature;
@property (readonly) double science;
@property (readonly) double society;

-(instancetype)initWithName:(NSString*)name;
-(void)setMath:(double)math;
-(void)setLiterature:(double)literature;
-(void)setScience:(double)science;
-(void)setSociety:(double)society;

@end
