//
//  Person.m
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
@interface Person()

@property (readwrite) NSString *name;
@property (readwrite) double math;
@property (readwrite) double literature;
@property (readwrite) double science;
@property (readwrite) double society;

@end


@implementation Person

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.math = 0.0;
        self.literature = 0.0;
        self.science = 0.0;
        self.society = 0.0;
    }
    return self;
}

@end
