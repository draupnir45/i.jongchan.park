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
    JCNetworkSignUpResponsePasswordNotStaisfying,
    JCNetworkSignUpResponseUnknownError
};

typedef NS_ENUM(NSUInteger, JCNetworkLogInResponse) {
    JCNetworkLogInResponseOK,
    JCNetworkLogInResponseUnknownError
};

typedef NS_ENUM(NSUInteger, JCUnknownError) {
    JCUnknownErrorNetworkIssue = 1000
};

typedef void (^CompletionBlock)(BOOL sucess, NSDictionary *dataDict);




@interface DataCenter : NSObject

@property NSString *userToken;
@property NetworkManager *networkManager;
@property NSMutableDictionary *postImageDictionary;

+ (instancetype)sharedData;

//ACCOUNT
- (void)signUpRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;
- (void)logInRequestWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion;

- (void)logOutRequestWithCompletion:(CompletionBlock)completion;

//POSTS
- (void)getPostDataOnPage:(NSInteger)page completion:(CompletionBlock)completion;
- (void)loadImageWithURL:(NSURL *)url postPK:(NSInteger)postPK;
- (void)postTitle:(NSString *)title content:(NSString *)content imageData:(NSData *)imageData completion:(CompletionBlock)completion;


@end
