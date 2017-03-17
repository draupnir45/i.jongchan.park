//
//  NetworkManager.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "NetworkManager.h"

static NSString *ROOT_URL = @"https://fc-ios.lhy.kr/api";
static NSString *SIGN_UP = @"/member/signup/";
static NSString *LOG_IN = @"/member/login/";
static NSString *LOG_OUT = @"/member/logout/";
static NSString *POSTCREATE = @"/post/";
static NSString *POSTLIST = @"/post/";
static NSString *POSTRETIREVE = @"/post/<post_pk>/";





@implementation NetworkManager {

}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSMutableURLRequest *)mutableRequestWithApiURL:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ROOT_URL,urlStr]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    return request;
}


- (void)signUpRequestToServerWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:SIGN_UP];
    request.HTTPMethod = @"POST";
    
    //body data
    NSString *dataStr = [NSString stringWithFormat:@"username=%@&password1=%@&password2=%@",userName,password,password];
    request.HTTPBody = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionUploadTask *signUpTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (error == nil) {
            completion(YES, dataDict);
        } else {
            completion(NO, dataDict);
        }

    }];
    
    [signUpTask resume]; 
}


- (void)loginRequestToServerWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:LOG_IN];
    request.HTTPMethod = @"POST";
    
    //body data
    NSString *dataStr = [NSString stringWithFormat:@"username=%@&password=%@",userName,password];
    request.HTTPBody = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionUploadTask *logInTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (error == nil) {
            completion(YES, dataDict);
        } else {
            completion(NO, dataDict);
        }
        
    }];
    
    [logInTask resume];
}


- (void)logOutRequestToServerWithToken:(NSString *)token {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:LOG_OUT];
    NSString *headerStr = [NSString stringWithFormat:@"Token %@",token];
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    [request setValue:headerStr forHTTPHeaderField:@"Authorization"];

        
    NSURLSessionUploadTask *logOutTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (error == nil && [[dataDict objectForKey:@"detail"] isEqualToString:@"Successfully logged out."]) {
//            logOutSucess = !logOutSucess;
            NSLog(@"logOut완료!");
        }
        
    }];
    
    [logOutTask resume];
    
}




@end
