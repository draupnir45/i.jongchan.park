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

-(double)volumeOfRectSolid:(RectangularSolid *)solid {
    double result = solid.width * solid.length * solid.height;
    NSLog(@"직육면체의 부피는 %f 입니다.", result);
    return result;
}
-(double)volumeOfCircCylinder:(CircularCylinder *)cylinder{
    double pi = 3.14159265359;
        double result = cylinder.radius * cylinder.radius * pi *cylinder.height;
        NSLog(@"원통의 부피는 %f 입니다.", result);
    return result;
}
-(double)volumeOfSphere:(Sphere *)sphere {
    double pi = 3.14159265359;
    double result = sphere.radius * sphere.radius * sphere.radius* pi *4 / 3;
        NSLog(@"구체의 부피는 %f 입니다.", result);
    return result;
}
-(double)volumeOfCone:(Cone *)cone{
    double pi = 3.14159265359;
    double result = cone.radius* cone.radius * pi * cone.height / 3;
        NSLog(@"원뿔의 부피는 %f 입니다.", result);
    return result;
}


@end
