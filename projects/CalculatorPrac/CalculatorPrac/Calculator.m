//
//  Calculator.m
//  CalculatorPrac
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

/**
 * 필요한 프로퍼티들을 리셋합니다.
 */
- (void)reset
{
    self.numbArray = nil;
    self.opArray = nil;
    self.formula = nil;
    self.numbArray = [[NSMutableArray alloc] init];
    self.opArray = [[NSMutableArray alloc] init];
    self.formula = [[NSMutableArray alloc] init];
}

/**
 *숫자인지 기호인지 확인하고 숫자일 경우 YES를 리턴합니다.
 */
-(BOOL)numOpChecker:(NSString *)character {
    NSCharacterSet *nonNumericSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([character rangeOfCharacterFromSet:nonNumericSet].location == NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

/**
 * 앞 글자가 숫자일 경우에 현재 처리할 숫자가 숫자인지 기호인지에 따라 해당하는 배열에 집어넣는 합수입니다.
 */
-(void)categorizeCharacterAfterNumbWith:(NSString *)nextChar nextTo:(NSUInteger)index {
    
    if ([self numOpChecker:nextChar]) {
        NSString *newNumb = [NSString stringWithFormat:@"%@%@",self.numbArray[index],nextChar];
//        self.numbArray[index] + nextChar;
        [self.numbArray replaceObjectAtIndex:index withObject:newNumb];
        
    } else {
        [self.opArray addObject:nextChar];
    }
    
}

/**
 * 앞 글자가 기호일 경우에 현재 처리할 숫자가 숫자인지 기호인지에 따라 해당하는 배열에 집어넣는 합수입니다.
 */
-(void)categorizeCharacterAfterOpWith:(NSString *)nextChar nextTo:(NSUInteger)index {
    
    if ([self numOpChecker:nextChar]) {
        [self.numbArray addObject:nextChar];
    } else {
        [self.opArray replaceObjectAtIndex:index withObject:nextChar];
    }
    
}

/**
 * 식을 받아 식 배열(_formula)에 넣고, 나머지 메서드들을 조합하여 계산값을 산출, 리턴합니다.
 */
-(CGFloat)calculteFormular:(NSString *)formula {
    //프로퍼티를 리셋하고 지나갑니다.
    [self reset];
    
    //받은 식을 한 글자씩 잘라 전체 어레이에 담습니다.
    NSUInteger length = [formula length];
    NSInteger i;
    for (i=0; i<length; i++) {
        [self.formula addObject:[formula substringWithRange:(NSMakeRange(i, 1))]];
    }
    
    //첫번째 글자가 숫자냐 기호냐에 따라 처리해줍니다.
    //-숫자의 경우 : +값을 가진 숫자이므로, 기호 배열의 첫 번째에 + 를 넣고 숫자도 넣습니다.
    //-기호의 경우 : 기호 배열 첫 번째인 opArray[0]에 넣습니다.
    NSString *first = self.formula[0];
    if ([self numOpChecker:first]) {
        [self.opArray addObject:@"+"];
        [self categorizeCharacterAfterOpWith:first nextTo:0];
    } else {
        [self.opArray addObject:first];
    }
    
    //두번째 self.formula[1]부터 마지막까지 앞 글자가 무엇이냐에 따라 분류해서 배열에 넣습니다.
    for (i=1; i<[formula length]; i++) {
        if ([self numOpChecker:self.formula[i-1]]) {
            [self categorizeCharacterAfterNumbWith:self.formula[i] nextTo:[self.numbArray count]-1];
        } else {
            [self categorizeCharacterAfterOpWith:self.formula[i] nextTo:[self.opArray count]-1];
        }
    }
    
    //맨앞에 나누기나 곱하기가 있으면 무시하고 +로 바꾸어 줍니다.
    if ([self.opArray[0] containsString:@"*"] || [self.opArray[0] containsString:@"/"]) {
        [self.opArray replaceObjectAtIndex:0 withObject:@"+"];
    }
    
    //계산합니다.
    [self calculcateTimesAndDivide];
    CGFloat result = [self calculateRest];
    
    
    return result;
}

/**
 * 완성된 기호 배열과 수 배열에서 나누기와 곱하기를 먼저 찾아 계산합니다.
 */
-(void)calculcateTimesAndDivide {
    
    //나누기나 곱하기가 있는지 검색하는 것을 이용, 없어질 때까지 돌립니다.
    while ([self.opArray containsObject:@"/"]) {
        NSInteger index = [self.opArray indexOfObject:@"/"];
        if ([self.numbArray[index] integerValue] == 0) {
            NSLog(@"오류입니다.");
            break;
        }
        CGFloat firstNumb = [self.numbArray[index - 1] floatValue];
        CGFloat secondNumb = [self.numbArray[index] floatValue];
        NSNumber *result = [NSNumber numberWithFloat:(firstNumb / secondNumb)];
        [self.numbArray replaceObjectAtIndex:index-1 withObject:result];
        [self.numbArray removeObjectAtIndex:index];
        [self.opArray removeObjectAtIndex:index];
    }
    
    while ([self.opArray containsObject:@"*"]) {
        NSInteger index = [self.opArray indexOfObject:@"*"];
        CGFloat firstNumb = [self.numbArray[index - 1] floatValue];
        CGFloat secondNumb = [self.numbArray[index] floatValue];
        NSNumber *result = [NSNumber numberWithFloat:(firstNumb * secondNumb)];
        [self.numbArray replaceObjectAtIndex:index-1 withObject:result];
        [self.numbArray removeObjectAtIndex:index];
        [self.opArray removeObjectAtIndex:index];

    }
}

/**
 * 더하기와 빼기만 남은 식을 모두 처리합니다.
 */
-(CGFloat)calculateRest {
    CGFloat result = 0;
    for (NSInteger i=0; i<[self.opArray count]; i++) {
        if ([self.opArray[i] isEqualToString:@"+"]) {
            result += [self.numbArray[i] floatValue];
        } else {
            result -= [self.numbArray[i] floatValue];
        }
    }
    
    return result;
}

@end
