//
//  ConvertToolBox.m
//  ConvetingToolBox
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ConvertToolBox.h"

@implementation ConvertToolBox

+(CGFloat)inchToCm:(CGFloat)inch {
    CGFloat result = inch*2.54;
    NSLog(@"%.0f inch는 %.0f cm",inch,result);
    return result;
}
+(CGFloat)cmToInch:(CGFloat)cm {
    CGFloat result = cm/2.54;
    NSLog(@"%.0f cm는 %.0f inch",cm,result);
    return result;
}
+(CGFloat)m2ToPyeong:(CGFloat)m2 {
    CGFloat result = m2*0.3025;
    NSLog(@"%.0f 평방미터는 %.0f 평",m2,result);
    return result;
}
+(CGFloat)pyeongToM2:(CGFloat)pyeong {
    CGFloat result = pyeong/0.3025;
    NSLog(@"%.0f 평은 %.0f 평방미터",pyeong,result);
    return result;
}
+(CGFloat)fahrenheitToCelsius:(CGFloat)fahrenheit {
    CGFloat result = (fahrenheit-32) / 1.8;
    NSLog(@"%.0f 화씨는 %.0f 섭씨",fahrenheit,result);
    return result;
}
+(CGFloat)celsiustoFahrenheit:(CGFloat)celsius {
    CGFloat result = (celsius * 1.8) + 32;
    NSLog(@"%.0f 섭씨는 %.0f 화씨",celsius,result);
    return result;
}


@end
