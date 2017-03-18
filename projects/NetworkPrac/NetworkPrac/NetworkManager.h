//
//  NetworkManager.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^CompletionBlock)(BOOL sucess, NSDictionary *dataDict);


@interface NetworkManager : NSObject


- (void)signUpRequestToServerWithUserName:(NSString *)userName
                                 password:(NSString *)password
                               completion:(CompletionBlock)completion;

- (void)loginRequestToServerWithUserName:(NSString *)userName
                                password:(NSString *)password
                              completion:(CompletionBlock)completion;

- (void)logOutRequestToServerWithToken:(NSString *)token;

- (void)getPostDataOnPage:(NSInteger)page
               completion:(CompletionBlock)completion;

@end
