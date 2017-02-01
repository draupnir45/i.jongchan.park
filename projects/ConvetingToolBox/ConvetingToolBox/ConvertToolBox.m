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
+(CGFloat)absoluteNum:(CGFloat)num {
    if (num > 0 || num == 0) {
        return num;
    } else {
        return -num;
    }
}
+(CGFloat)roundFloatToPoint2:(CGFloat)num {
    NSInteger numInteger = (num+0.005)*100;
    return (CGFloat)numInteger/100;
}
+(CGFloat)calcOp:(NSString *)op
            num1:(CGFloat)num1
            num2:(CGFloat)num2 {
    if ([op isEqualToString:@"+"]) {
        return num1 + num2;
    } else if ([op isEqualToString:@"-"]){
        return [ConvertToolBox absoluteNum:(num1 - num2)];
    } else {
        NSLog(@"잘못된 연산자입니다. 0이 반환됩니다.");
        return 0;
    }
}
+(bool)checkLeapYear:(NSUInteger)year {
    if (year % 400 == 0) {
        return YES;
    } else {
        return NO;
    }
}
+(NSInteger)lastDayOfmonth:(NSInteger)month year:(NSUInteger)year {
    switch (month) {
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
            break;
        case 2:
            if ([ConvertToolBox checkLeapYear:year]) {
                return 29;
            }else {
                return 28;
            }
            break;
        default:
            return 31;
            break;
    }
}
+(NSUInteger)dayCalcWithFirstDay:(NSString *)firstDay
                      andLastDay:(NSString *)lastDay {
    NSArray *firstDayArray = [firstDay componentsSeparatedByString:@"/"];
    NSArray *lastDayArray = [lastDay componentsSeparatedByString:@"/"];
    
    
    NSUInteger wholeMonths = (([[lastDayArray objectAtIndex:0] integerValue]-[[firstDayArray objectAtIndex:0]integerValue])*12) + [[lastDayArray objectAtIndex:1] integerValue] - [[firstDayArray objectAtIndex:1] integerValue];
    
    NSInteger yearSave = [[firstDayArray objectAtIndex:0] integerValue];
    NSInteger monthSave = [[firstDayArray objectAtIndex:1] integerValue];
    NSInteger i = 0;
    NSUInteger result = 0;
    for (i = 0; i < wholeMonths; i++) {
        result += [ConvertToolBox lastDayOfmonth:monthSave year:yearSave];
        if (monthSave == 12) {
            monthSave = 1;
            yearSave++;
        } else {
            monthSave++;
        }
    }
    result -= [[firstDayArray objectAtIndex:2] integerValue];
    result += [[lastDayArray objectAtIndex:2] integerValue];
    
    return result;
    
}


@end
