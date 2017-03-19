//
//  PostModel.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject

@property NSInteger postPK;
@property NSString *title;
@property NSString *content;


- (instancetype)initWithDict:(NSDictionary *)dict;

@end
