//
//  main.m
//  MemoApp
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoApp.h"


int main(int argc, const char * argv[]) {
    
    //객체생성
    MemoApp *memoApp = [[MemoApp alloc] init];
    
    //스트링 저장
    NSString *memo = @"우짜까";
    [memoApp saveString: memo];
    
    //스트링 불러오기
    NSString *result = [memoApp loadAtIndex: 0];
    NSLog(@"result: %@",result);
    
    return 0;
}
