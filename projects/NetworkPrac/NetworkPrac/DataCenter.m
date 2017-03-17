//
//  DataCenter.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DataCenter.h"
#import "NetworkManager.h"
#import "SignUpViewController.h"


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
        self.nManager = [[NetworkManager alloc] init];
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"] length] > 0) {
            self.userToken =[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"];
        }
        
    }
    return self;
}



- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion {
    //회원가입, 로그인 시키고 토큰 저장, 오류 처리, 성공여부 리턴
//        __block NSUInteger resultCode;
    
    [self.nManager signUpRequestToServerWithUserName:userName password:password completion:^(BOOL sucess, NSDictionary *dataDict) {
        
        if ([dataDict objectForKey:@"key"]) {
            
            self.userToken = [dataDict objectForKey:@"key"];
            
            [[NSUserDefaults standardUserDefaults] setValue:self.userToken forKey:@"Token"];
        }
        completion(sucess, dataDict);
    }];
    
    //    return resultCode;
}


- (void)loginRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{
    //로그인 요청하고 토큰 저장, 오류 처리, 성공여부 리턴
    [self.nManager loginRequestToServerWithUserName:userName password:password completion:^(BOOL sucess, NSDictionary *dataDict) {
        if ([dataDict objectForKey:@"key"]) {
            self.userToken = [dataDict objectForKey:@"key"];
            
            [[NSUserDefaults standardUserDefaults] setValue:self.userToken forKey:@"Token"];
        }
        completion(sucess, dataDict);
    }];

}

- (void)logOutRequest {
    [self.nManager logOutRequestToServerWithToken:self.userToken];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"Token"];
    self.userToken = @"";
}



@end
