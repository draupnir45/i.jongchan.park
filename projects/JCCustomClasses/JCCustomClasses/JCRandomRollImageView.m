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
@property NSInteger repeatNumb;

@end


@implementation JCRandomRollImageView

- (void)rollWithImageArray:(NSArray <UIImage *>*)array timeIntervel:(NSTimeInterval)timeInterval {
    
    self.imgArray = array;
    self.rollingIndex = 0;
    
    self.rollingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
}

- (void)rollWithImageArray:(NSArray <UIImage *>*)array timeIntervel:(NSTimeInterval)timeInterval repeatNumb:(NSInteger)repeatNumb {
    
    self.imgArray = array;
    self.rollingIndex = 0;
    self.repeatNumb = repeatNumb;
    
    self.rollingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeImageRepeat) userInfo:nil repeats:YES];
    
    
    
}

- (void)changeImage {
    if (self.rollingIndex < self.imgArray.count * 3) {
        self.image = self.imgArray[self.rollingIndex % self.imgArray.count];
        self.rollingIndex++;
    } else {
        [self.rollingTimer invalidate];
        self.rollingTimer = nil;
        self.imgArray = @[];
        self.rollingIndex = 0;
    }
    
}

- (void)changeImageRepeat{
    if (self.rollingIndex < self.imgArray.count * self.repeatNumb) {
        self.image = self.imgArray[self.rollingIndex % self.imgArray.count];
        self.rollingIndex++;
    } else {
        [self.rollingTimer invalidate];
        self.rollingTimer = nil;
        self.imgArray = @[];
        self.rollingIndex = 0;
    }
    
}



@end
