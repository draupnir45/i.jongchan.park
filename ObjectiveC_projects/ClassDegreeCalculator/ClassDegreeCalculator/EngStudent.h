//
//  EngStudent.h
//  ClassDegreeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"

@interface EngStudent : Person


@property (readonly) CGFloat eng;


-(instancetype)initWithName:(NSString*)name
                       math:(CGFloat)math
                 literature:(CGFloat)literature
                    science:(CGFloat)science
                    society:(CGFloat)society
                        eng:(CGFloat)eng;

@end
