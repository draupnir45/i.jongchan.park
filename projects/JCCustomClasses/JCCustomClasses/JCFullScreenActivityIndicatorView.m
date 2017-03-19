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
        self.frame = self.superview.frame;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        self.indicator = [[UIActivityIndicatorView alloc] init];
        [self.indicator setCenter:self.center];
        [self addSubview:self.indicator];
        [self.indicator startAnimating];
    }
    return self;
}

- (void)start {
    [self.superview bringSubviewToFront:self];
}

@end
