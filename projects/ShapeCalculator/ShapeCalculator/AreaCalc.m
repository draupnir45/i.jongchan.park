//
//  AreaCalc.m
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "AreaCalc.h"
#import "Rectangles.h"
#import "Triangles.h"
#import "Circles.h"

@implementation AreaCalc

-(double)calculateAreaOfRect:(Rectangles *)rectangle{
    double result = rectangle.width * rectangle.length;
    NSLog(@"사각형의 넓이는 %f 입니다.", result);
    return result;
}
-(double)calculateAreaOfTriangle:(Triangles *)triangle{
    double result = triangle.base * triangle.height;
        NSLog(@"삼각형의 넓이는 %f 입니다.", result);
    return result;
}
-(double)calculateAreaOfCircle:(Circles *)circle {
    double pi = 3.14159265359;
    double result = circle.radius * circle.radius * pi;
        NSLog(@"원의 넓이는 %f 입니다.", result);
    return result;
}


@end
