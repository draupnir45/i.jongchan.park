//
//  JCRandomRollImageView.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 10..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCRandomRollImageView.h"

@implementation JCRandomRollImageView

- (void)rollWithImageArray:(NSArray <UIImage *>*)array timeIntervel:(NSTimeInterval)timeInterval {
    __block NSInteger index = 0;
    [NSTimer scheduledTimerWithTimeInterval:timeInterval repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.image = array[index];
        index ++;
        if (array.count <= index) {
            timer = nil;
        }
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
