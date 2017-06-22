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
        
        //network manager
        self.networkManager = [[NetworkManager alloc] init];
        self.postImageDictionary = [[NSMutableDictionary alloc] init];
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"] length] > 0) {
            self.userToken =[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"];
        }
        
    }
    return self;
}

#pragma mark - account

- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion {

    [self.networkManager signUpRequestToServerWithUserName:userName password:password completion:^(BOOL sucess, NSDictionary *dataDict) {
        
        if ([dataDict objectForKey:@"key"]) {
            
            self.userToken = [dataDict objectForKey:@"key"];
            
            [[NSUserDefaults standardUserDefaults] setValue:self.userToken forKey:@"Token"];
        }
        completion(sucess, dataDict);
    }];

}


- (void)logInRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{

    [self.networkManager logInRequestToServerWithUserName:userName password:password completion:^(BOOL sucess, NSDictionary *dataDict) {
        if ([dataDict objectForKey:@"key"]) {
            self.userToken = [dataDict objectForKey:@"key"];
            
            [[NSUserDefaults standardUserDefaults] setValue:self.userToken forKey:@"Token"];
        }
        completion(sucess, dataDict);
    }];

}

- (void)logOutRequestWithCompletion:(CompletionBlock)completion {
    
    [self.networkManager logOutRequestToServerWithToken:self.userToken completion:^(BOOL sucess, NSDictionary *dataDict) {
        if (sucess) {
            [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"Token"];
            self.userToken = @"";
        }
        
        completion(sucess, dataDict);
    }];

    
}


#pragma mark - posts

///각 페이지별 포스트 데이터를 받습니다. api로부터 오는 포스트는 10개씩입니다.
- (void)getPostDataOnPage:(NSInteger)page completion:(CompletionBlock)completion {
    [self.networkManager getPostDataOnPage:page completion:completion];
}

///이미지 전송은 따로 요청하며, 이미지 데이터 역시 데이터센터에 따로 저장합니다. 제대로 받으면 노티를 보냅니다.
- (void)loadImageWithURL:(NSURL *)url postPK:(NSInteger)postPK {
    [self.networkManager loadImageWithURL:url postPK:postPK];
}

///포스팅합니다.
- (void)postTitle:(NSString *)title content:(NSString *)content imageData:(NSData *)imageData completion:(CompletionBlock)completion{
    [self.networkManager postTitle:title content:content imageData:imageData completion:completion];
}

@end
