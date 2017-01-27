//
//  MemoApp.h
//  MemoApp
//
//  Created by 박종찬 on 2017. 1. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoApp : NSObject

@property NSMutableArray *memos;

-(void)saveString:(NSString *)string;
-(NSString *)loadAtIndex:(NSUInteger)index;

@end
