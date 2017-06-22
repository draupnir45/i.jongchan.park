//
//  JCArrayFilteringManager.m
//  JCFilteredTableView
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCArrayFilter.h"

@implementation JCArrayFilter


///어레이 - 딕셔너리 - 어레이 구조로 되어 있는 데이터를 필터링합니다. 딕셔너리 내부의 어레이가 담겨 있는 키값을 받습니다.
+(NSArray *)filterArray:(NSArray *)originalArray
           withCriteria:(NSArray <NSString *> *)criteria
                 forKey:(NSString *)key
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSString *criterion in criteria) {
        for (NSDictionary *item in originalArray) {
            if ([[item objectForKey:key] containsObject:criterion] && ![resultArray containsObject:item]) {
                [resultArray addObject:item];
            }
        }
    }
    
    return resultArray;
}

@end
