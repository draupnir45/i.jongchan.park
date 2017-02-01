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
+(CGFloat)absoluteNum:(CGFloat)num;
+(CGFloat)roundFloatToPoint2:(CGFloat)num;
+(CGFloat)roundFloatFromLastNumPosition:(CGFloat)num;
+(CGFloat)calcOp:(NSString *)op
            num1:(CGFloat)num1
            num2:(CGFloat)num2;
+(bool)checkLeapYear:(NSUInteger)year;
+(NSInteger)lastDayOfmonth:(NSInteger)month
                      year:(NSUInteger)year;
+(NSUInteger)dayCalcWithFirstDay:(NSString *)firstDay
                    andLastDay:(NSString *)lastDay;
+(void)logMultiplicationTable:(NSInteger)numb;
+(NSArray *)findMultipleNum:(NSInteger)numb maxRange:(NSInteger)range;
+(NSInteger)addAllNum:(NSInteger)numb;
+(NSInteger)findStarInString:(NSString *)string;


@end
