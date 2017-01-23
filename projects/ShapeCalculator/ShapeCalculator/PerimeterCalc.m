//
//  PerimeterCalc.m
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PerimeterCalc.h"
#import "Rectangles.h"
#import "Triangles.h"
#import "Circles.h"

@implementation PerimeterCalc

-(double)calculatePerimeterOfRect:(Rectangles *)rectangle {
    double result = (rectangle.length + rectangle.width)*2;
        NSLog(@"사각형의 둘레는 %f 입니다.", result);
    return result;
}
//-(double)calculatePerimeterOfTriangle:(Triangles *)triangle{
//    double result =
//    return result;
//}
-(double)calculatePerimeterOfCircle:(Circles *)circle{
    double pi = 3.14159265359;
    double result = 2*circle.radius*pi;
    NSLog(@"원의 둘레는 %f 입니다.", result);
    return result;
}

@end
