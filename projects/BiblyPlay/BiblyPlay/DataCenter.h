//
//  DataCenter.h
//  BiblyPlay
//
//  Created by 박종찬 on 2017. 2. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property NSMutableDictionary *userInfos;
+ (instancetype)sharedData;

@end
