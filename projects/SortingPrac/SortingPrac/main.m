//
//  main.m
//  SortingPrac
//
//  Created by 박종찬 on 2017. 2. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberArraySorter.h"

int main(int argc, const char * argv[]) {
    
    
    //적은 배열 테스트
    NSArray *dataArray = @[@5,@3,@7,@1,@6,@9,@2];
    NSArray *resultArray = [NumberArraySorter mergeSort:dataArray];
    
    //    //큰 배열 테스트
    //    NSMutableArray *dataRandom = [[NSMutableArray alloc]init];
    //
    //    for (NSInteger i = 0; i<10000; i++) {
    //        NSInteger temp = arc4random() % 10000;
    //        [dataRandom addObject:[NSNumber numberWithInteger:temp]];
    //    }
    
    //    NSArray *resultArray = [self quickSort:dataRandom];
    
    
    NSLog(@"%@",resultArray);
    
    
    return 0;
}
