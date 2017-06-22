//
//  MemoApp.m
//  MemoApp
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "MemoApp.h"

@implementation MemoApp

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.memos = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)saveString:(NSString *)string {
    [self.memos addObject:string];
}


-(NSString *)loadAtIndex:(NSUInteger)index{
    NSString *result = self.memos[index];
    return result;
}

@end
