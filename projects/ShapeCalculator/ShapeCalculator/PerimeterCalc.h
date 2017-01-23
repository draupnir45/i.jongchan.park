//
//  PerimeterCalc.h
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Rectangles;
@class Triangles;
@class Circles;


@interface PerimeterCalc : NSObject

-(double)calculatePerimeterOfRect:(Rectangles *)rectangle;
//-(double)calculatePerimeterOfTriangle:(Triangles *)triangle;
-(double)calculatePerimeterOfCircle:(Circles *)circle;


@end
