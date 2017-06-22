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

//-(CGFloat)calculateAreaOfRect:(Rectangles *)rectangle;
//-(CGFloat)calculateAreaOfTriangle:(Triangles *)triangle;
//-(CGFloat)calculateAreaOfCircle:(Circles *)circle;

+(CGFloat)calculateAreaOfRect:(Rectangles *)rectangle;
+(CGFloat)calculateAreaOfTriangle:(Triangles *)triangle;
+(CGFloat)calculateAreaOfCircle:(Circles *)circle;

@end
