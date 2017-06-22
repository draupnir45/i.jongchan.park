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
@property (readonly) CGFloat math;
@property (readonly) CGFloat literature;
@property (readonly) CGFloat science;
@property (readonly) CGFloat society;

-(instancetype)initWithName:(NSString*)name
                       math:(CGFloat)math
                 literature:(CGFloat)literature
                    science:(CGFloat)science
                    society:(CGFloat)society;
-(void)setDefaultWithZero;
-(void)setDefaultWithMath:(CGFloat)math
               literature:(CGFloat)literature
                  science:(CGFloat)science
                  society:(CGFloat)society;



@end
