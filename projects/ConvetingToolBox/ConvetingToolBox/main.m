//
//  main.m
//  ConvetingToolBox
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConvertToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CGFloat cm = [ConvertToolBox inchToCm:100];
        [ConvertToolBox cmToInch:100];
        [ConvertToolBox m2ToPyeong:100];
        [ConvertToolBox pyeongToM2:100];
        [ConvertToolBox fahrenheitToCelsius:100];
        [ConvertToolBox celsiustoFahrenheit:100];
        NSLog(@"100inch는 %.0f cm",cm);
        
//        [ConvertToolBox absoluteNum:124];
        NSLog(@"%.3f", [ConvertToolBox absoluteNum:124]);
//        [ConvertToolBox absoluteNum:-124];
        NSLog(@"%.3f", [ConvertToolBox absoluteNum:-124]);
        NSLog(@"%.3f", [ConvertToolBox roundFloatToPoint2:3.134]);
        NSLog(@"%.3f", [ConvertToolBox roundFloatToPoint2:3.4552]);
        NSLog(@"%f", [ConvertToolBox roundFloatFromLastNumPosition:3.45528609]);
        NSLog(@"%.3f", [ConvertToolBox calcOp:@"+" num1:10 num2:3]);
        NSLog(@"%.3f", [ConvertToolBox calcOp:@"-" num1:10 num2:3]);
        NSLog(@"%.3f", [ConvertToolBox calcOp:@"-" num1:3 num2:10]);
        NSInteger result = [ConvertToolBox dayCalcWithFirstDay:@"2001/1/2" andLastDay:@"2002/1/2"];
        NSLog(@"%ld",(long)result);
        [ConvertToolBox logMultiplicationTable:9];
        [ConvertToolBox findMultipleNum:3 maxRange:1000];
        NSLog(@"%ld",(long)[ConvertToolBox addAllNum:1234567890]);
        NSLog(@"%ld",(long)[ConvertToolBox findStarInString:@"123*test"]);
        
    }
    return 0;
}
