//
//  NetworkManager.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^CompletionBlock)(BOOL sucess, NSDictionary *dataDict);


@interface NetworkManager : NSObject


@property dispatch_queue_t imgLoadingQueue;


- (void)signUpRequestToServerWithUserName:(NSString *)userName
                                 password:(NSString *)password
                               completion:(CompletionBlock)completion;

- (void)loginRequestToServerWithUserName:(NSString *)userName
                                password:(NSString *)password
                              completion:(CompletionBlock)completion;

- (void)logOutRequestToServerWithToken:(NSString *)token;

- (void)getPostDataOnPage:(NSInteger)page
               completion:(CompletionBlock)completion;

- (void)loadImageWithURL:(NSURL *)url
                  postPK:(NSInteger)postPK;

- (void)postTitle:(NSString *)title
          content:(NSString *)content
        imageData:(NSData *)imageData
       completion:(CompletionBlock)completion;

- (void)logOutRequestToServerWithToken:(NSString *)token
                            completion:(CompletionBlock)completion;

@end
