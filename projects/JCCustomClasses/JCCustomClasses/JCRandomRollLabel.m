//
//  JCRandomRollLabel.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCRandomRollLabel.h"

@implementation JCRandomRollLabel

- (void)rollWithArray:(NSArray <NSString *>*)array timeIntervel:(NSTimeInterval)timeInterval {
    
    self.textArray = array;
    self.rollingIndex = 0;
    
    self.rollingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
}

- (void)rollWithImageArray:(NSArray <NSString *>*)array timeIntervel:(NSTimeInterval)timeInterval repeatNumb:(NSInteger)repeatNumb {
    
    self.textArray = array;
    self.rollingIndex = 0;
    self.repeatNumb = repeatNumb;
    
    self.rollingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeImageRepeat) userInfo:nil repeats:YES];
    
    
    
}

- (void)changeImage {
    if (self.rollingIndex < self.textArray.count * 3) {
        self.text = self.textArray[self.rollingIndex % self.textArray.count];
        self.rollingIndex++;
    } else {
        [self.rollingTimer invalidate];
        self.rollingTimer = nil;
        self.textArray = @[];
        self.rollingIndex = 0;
    }
    
}

- (void)changeImageRepeat{
    if (self.rollingIndex < self.textArray.count * self.repeatNumb) {
        self.text = self.textArray[self.rollingIndex % self.textArray.count];
        self.rollingIndex++;
    } else {
        [self.rollingTimer invalidate];
        self.rollingTimer = nil;
        self.textArray = @[];
        self.rollingIndex = 0;
    }
    
}


@end
