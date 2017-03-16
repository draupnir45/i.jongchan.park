//
//  DataCenter.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedData {
    static DataCenter *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataCenter alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password {
    //회원가입, 로그인 시키고 토큰 저장, 오류 처리, 성공여부 리턴
    
    return YES;
}

- (BOOL)loginRequestWithUserName:(NSString *)userName password:(NSString *)password {
    //로그인 요청하고 토큰 저장, 오류 처리, 성공여부 리턴
    
    return YES;
}





@end
