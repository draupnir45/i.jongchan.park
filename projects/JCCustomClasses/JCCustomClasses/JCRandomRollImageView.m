//
//  JCRandomRollImageView.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 10..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCRandomRollImageView.h"

@interface JCRandomRollImageView ()

@property NSTimer *rollingTimer;
@property NSInteger rollingIndex;
@property NSArray *imgArray;

@end


@implementation JCRandomRollImageView

- (void)rollWithImageArray:(NSArray <UIImage *>*)array timeIntervel:(NSTimeInterval)timeInterval {
//    __block NSInteger index = 0;
//    [NSTimer scheduledTimerWithTimeInterval:timeInterval repeats:YES block:^(NSTimer * _Nonnull timer) {
////        NSInteger index = 0;
//        self.image = array[index];
//        index ++;
//        if (array.count < index) {
//            NSLog(@"들어오긴 함?");
//            [timer invalidate];
//        }
//    }];

    self.imgArray = array;
    self.rollingIndex = 0;
    
    self.rollingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeImageWithArray) userInfo:nil repeats:YES];
    

    
    
}

- (void)changeImageWithArray {
    if (self.rollingIndex < self.imgArray.count) {
        self.image = self.imgArray[self.rollingIndex];
        self.rollingIndex++;
    } else { [self.rollingTimer invalidate];
        self.rollingTimer = nil;
        self.imgArray = @[];
        self.rollingIndex = 0;
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
