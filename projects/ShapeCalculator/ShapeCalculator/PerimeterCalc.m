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

-(CGFloat)calculatePerimeterOfRect:(Rectangles *)rectangle {
    CGFloat result = (rectangle.length + rectangle.width)*2;
        NSLog(@"사각형의 둘레는 %f 입니다.", result);
    return result;
}

//-(CGFloat)calculatePerimeterOfTriangle:(Triangles *)triangle{
//    CGFloat result =
//    return result;
//}
-(CGFloat)calculatePerimeterOfCircle:(Circles *)circle{
    CGFloat pi = 3.14159265359;
    CGFloat result = 2*circle.radius*pi;
    NSLog(@"원의 둘레는 %f 입니다.", result);
    return result;
}

@end
