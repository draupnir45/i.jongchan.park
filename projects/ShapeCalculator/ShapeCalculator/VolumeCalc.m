//
//  VolumeCalc.m
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "VolumeCalc.h"
#import "RectangularSolid.h"
#import "CircularCylinder.h"
#import "Sphere.h"
#import "Cone.h"

@implementation VolumeCalc

-(CGFloat)volumeOfRectSolid:(RectangularSolid *)solid {
    CGFloat result = [self calculateAreaOfRect:solid] * solid.height;
    NSLog(@"직육면체의 부피는 %f 입니다.", result);
    return result;
}
-(CGFloat)volumeOfCircCylinder:(CircularCylinder *)cylinder{
        CGFloat result =[self calculateAreaOfCircle:cylinder] *cylinder.height;
        NSLog(@"원통의 부피는 %f 입니다.", result);
    return result;
}
-(CGFloat)volumeOfSphere:(Sphere *)sphere {
    CGFloat result = sphere.radius * [self calculateAreaOfCircle:sphere] * 4 / 3;
        NSLog(@"구체의 부피는 %f 입니다.", result);
    return result;
}
-(CGFloat)volumeOfCone:(Cone *)cone{
    CGFloat result = [self calculateAreaOfCircle:cone] * cone.height / 3;
        NSLog(@"원뿔의 부피는 %f 입니다.", result);
    return result;
}


@end
