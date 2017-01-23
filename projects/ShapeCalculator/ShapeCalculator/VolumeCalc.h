//
//  VolumeCalc.h
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RectangularSolid;
@class CircularCylinder;
@class Sphere;
@class Cone;

@interface VolumeCalc : NSObject

-(double)volumeOfRectSolid:(RectangularSolid *)solid;
-(double)volumeOfCircCylinder:(CircularCylinder *)cylinder;
-(double)volumeOfSphere:(Sphere *)sphere;
-(double)volumeOfCone:(Cone *)cone;

@end
