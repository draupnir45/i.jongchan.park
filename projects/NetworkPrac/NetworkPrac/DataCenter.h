//
//  DataCenter.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NetworkManager;
@class SignUpViewController;



typedef NS_ENUM(NSUInteger, JCNetworkSignUpResponse) {
    JCNetworkSignUpResponseOK,
    JCNetworkSignUpResponseUserNameAlreadyTaken,
    JCNetworkSignUpResponsePasswordNotStaisfying
};

typedef NS_ENUM(NSUInteger, JCNetworkLogInResponse) {
    JCNetworkLogInResponseOK,
    JCNetworkLogInResponseFailed
};

typedef void (^CompletionBlock)(BOOL sucess, NSDictionary *dataDict);




@interface DataCenter : NSObject

@property NSString *userToken;
@property NetworkManager *nManager;

+ (instancetype)sharedData;
//- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password;
- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;
- (void)loginRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;
- (void)logOutRequest;

@end
