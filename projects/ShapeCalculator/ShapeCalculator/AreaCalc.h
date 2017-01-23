//
//  AreaCalc.h
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Rectangles;
@class Triangles;
@class Circles;

@interface AreaCalc : NSObject

-(double)calculateAreaOfRect:(Rectangles *)rectangle;
-(double)calculateAreaOfTriangle:(Triangles *)triangle;
-(double)calculateAreaOfCircle:(Circles *)circle;

@end
