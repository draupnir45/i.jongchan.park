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
@property (readwrite) CGFloat math;
@property (readwrite) CGFloat literature;
@property (readwrite) CGFloat science;
@property (readwrite) CGFloat society;

@end


@implementation Person

-(instancetype)initWithName:(NSString*)name
                       math:(CGFloat)math
                 literature:(CGFloat)literature
                    science:(CGFloat)science
                    society:(CGFloat)society {
    self = [super init];
    if (self) {
        self.name = name;
        self.math = math;
        self.literature = literature;
        self.science = science;
        self.society = society;
    }
    return self;
}

-(void)setDefaultWithZero {
    self.math = 0;
    self.literature = 0;
    self.science = 0;
    self.society = 0;
}

-(void)setDefaultWithMath:(CGFloat)math
           literature:(CGFloat)literature
              science:(CGFloat)science
              society:(CGFloat)society {
        self.math = math;
        self.literature = literature;
        self.science = science;
    self.society = society;
}

@end
