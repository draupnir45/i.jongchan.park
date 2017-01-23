//
//  VolumeCalc.h
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AreaCalc.h"
@class RectangularSolid;
@class CircularCylinder;
@class Sphere;
@class Cone;

@interface VolumeCalc : AreaCalc

//-(CGFloat)volumeOfRectSolid:(RectangularSolid *)solid;
//-(CGFloat)volumeOfCircCylinder:(CircularCylinder *)cylinder;
//-(CGFloat)volumeOfSphere:(Sphere *)sphere;
//-(CGFloat)volumeOfCone:(Cone *)cone;

+(CGFloat)volumeOfRectSolid:(RectangularSolid *)solid;
+(CGFloat)volumeOfCircCylinder:(CircularCylinder *)cylinder;
+(CGFloat)volumeOfSphere:(Sphere *)sphere;
+(CGFloat)volumeOfCone:(Cone *)cone;


@end
