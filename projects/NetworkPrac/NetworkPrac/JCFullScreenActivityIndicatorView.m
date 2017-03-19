//
//  JCFullScreenActivityIndicatorView.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCFullScreenActivityIndicatorView.h"

@implementation JCFullScreenActivityIndicatorView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }
    return self;
}

- (void)start {
    self.frame = self.superview.frame;
    self.indicator = [[UIActivityIndicatorView alloc] init];
    self.indicator.frame = CGRectMake(0, 0, 200, 200);
    [self.indicator setCenter:self.center];
    [self addSubview:self.indicator];
    [self.indicator startAnimating];
    [self.superview bringSubviewToFront:self];
}

@end
