//
//  EngStudent.m
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "EngStudent.h"
@interface EngStudent()


@property (readwrite) CGFloat eng;

@end

@implementation EngStudent

-(void)setDefaultWithZero {
    [super setDefaultWithZero];
    self.eng = 0;
}

-(instancetype)initWithName:(NSString*)name
                       math:(CGFloat)math
                 literature:(CGFloat)literature
                    science:(CGFloat)science
                    society:(CGFloat)society
                        eng:(CGFloat)eng{
    self = [super initWithName:name math:math literature:literature science:science society:society];
    self.eng = eng;
    
    return self;
}


@end
