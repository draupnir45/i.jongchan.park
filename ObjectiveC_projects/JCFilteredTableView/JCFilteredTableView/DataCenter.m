//
//  DataCenter.m
//  JCFilteredTableView
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DataCenter.h"

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
        self.appData = @[
                         @{ @"name":@"피카츄", @"타입":@[@"전기"]},
                         @{ @"name":@"갸라도스", @"타입":@[@"물", @"비행"]},
                         @{ @"name":@"리자몽", @"타입":@[@"불", @"비행"]},
                         @{ @"name":@"프테라", @"타입":@[@"바위", @"비행"]},
                         @{ @"name":@"라플레시아", @"타입":@[@"풀", @"독"]},
                         @{ @"name":@"잠만보", @"타입":@[@"노말"]},
                         ];
    }
    return self;
}

@end
