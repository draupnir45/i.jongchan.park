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
@property NetworkManager *networkManager;
@property NSMutableDictionary *postImageDictionary;

+ (instancetype)sharedData;

//account
- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;
- (void)loginRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;

- (void)logOutRequestWithCompletion:(CompletionBlock)completion;

//post
- (void)getPostDataOnPage:(NSInteger)page completion:(CompletionBlock)completion;
- (void)loadImageWithURL:(NSURL *)url postPK:(NSInteger)postPK;
- (void)postTitle:(NSString *)title content:(NSString *)content imageData:(NSData *)imageData completion:(CompletionBlock)completion;


@end
