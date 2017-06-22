//
//  DataCenter.m
//  BiblyPlay
//
//  Created by 박종찬 on 2017. 2. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedData {
    static DataCenter *data = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[DataCenter alloc] init];
    });
    
    return data;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInfos = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
