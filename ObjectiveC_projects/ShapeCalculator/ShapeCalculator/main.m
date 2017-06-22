//
//  main.m
//  ShapeCalculator
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangles.h"
#import "Triangles.h"
#import "Circles.h"
#import "RectangularSolid.h"
#import "CircularCylinder.h"
#import "Sphere.h"
#import "Cone.h"
#import "AreaCalc.h"
#import "PerimeterCalc.h"
#import "VolumeCalc.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        AreaCalc *areaCalc = [[AreaCalc alloc]init];
//        PerimeterCalc *perimeterCalc = [[PerimeterCalc alloc] init];
//        VolumeCalc * volumeCalc = [[VolumeCalc alloc] init];
        
        Rectangles *rect = [[Rectangles alloc]init];
        rect.width = 100;
        rect.length = 30;
        
        [AreaCalc calculateAreaOfRect:rect];
        [PerimeterCalc calculatePerimeterOfRect:rect];
        
        Triangles *tri = [[Triangles alloc]init];
        tri.base = 100;
        tri.height = 50;
        [AreaCalc calculateAreaOfTriangle:tri];
        
        Circles *circle = [[Circles alloc]init];
        circle.radius = 100;
        [AreaCalc calculateAreaOfCircle:circle];
        [PerimeterCalc calculatePerimeterOfCircle:circle];
        
        RectangularSolid * rectSol = [[RectangularSolid alloc]init];
        rectSol.width = 100;
        rectSol.length = 50;
        rectSol.height = 40;
        
        [VolumeCalc volumeOfRectSolid:rectSol];
        
        CircularCylinder *cirCyl = [[CircularCylinder alloc] init];
        cirCyl.radius = 100;
        cirCyl.height = 50;
        
        [VolumeCalc volumeOfCircCylinder:cirCyl];
        
        Sphere *spr = [[Sphere alloc]init];
        spr.radius = 30;
        
        [VolumeCalc volumeOfSphere:spr];
        
        Cone *cone = [[Cone alloc] init];
        cone.height = 30;
        cone.radius = 30;
        [VolumeCalc volumeOfCone:cone];
    }
    return 0;
}
