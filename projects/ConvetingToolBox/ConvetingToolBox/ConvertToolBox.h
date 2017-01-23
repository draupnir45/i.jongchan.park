//
//  ConvertToolBox.h
//  ConvetingToolBox
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConvertToolBox : NSObject

+(CGFloat)inchToCm:(CGFloat)inch;
+(CGFloat)cmToInch:(CGFloat)cm;
+(CGFloat)m2ToPyeong:(CGFloat)m2;
+(CGFloat)pyeongToM2:(CGFloat)pyeong;
+(CGFloat)fahrenheitToCelsius:(CGFloat)fahrenheit;
+(CGFloat)celsiustoFahrenheit:(CGFloat)celsius;


@end
