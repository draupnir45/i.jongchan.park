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
    }
    return 0;
}
