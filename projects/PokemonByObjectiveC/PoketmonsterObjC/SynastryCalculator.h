//
//  SynastryCalc.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class Pokemon;

@interface SynastryCalculator : NSObject


- (CGFloat)calcSynastryFrom:(NSString *)skillType
                     to:(NSString *)targetType;

@end
