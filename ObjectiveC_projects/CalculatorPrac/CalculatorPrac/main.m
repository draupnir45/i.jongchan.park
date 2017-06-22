//
//  main.m
//  CalculatorPrac
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    
    NSString *form = @"";
    char word[100];
    
    while (![form containsString:@"quit"]) {
        NSLog(@"\n원하는 수식을 입력하세요. (100자 이내, 연산자는 +, -, * 와 / 로 제한, 다른 값이 들어가면 오류, quit으로 종료)");
        scanf("%s", word);
        
        form = [NSString stringWithUTF8String:word];
        
        
        
        //    NSString *form = @"21+7/8*4+-+9";
        Calculator *calc = [[Calculator alloc]init];
        [calc calculteFormular:form];
        
        
        NSLog(@"\n답은 %0.3f", [calc calculteFormular:form]);
    }

    
    
    return 0;
}
