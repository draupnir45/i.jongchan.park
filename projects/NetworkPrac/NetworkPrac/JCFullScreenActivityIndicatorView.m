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
        self.indicator = [[UIActivityIndicatorView alloc] init];
        [self addSubview:self.indicator];
    }
    return self;
}



- (void)start {
    self.frame = self.superview.frame;
    self.indicator.frame = CGRectMake(0, 0, 200, 200);
    [self.indicator setCenter:self.center];
    [self.indicator startAnimating];
    [self.superview bringSubviewToFront:self];
}



- (void)startIndicatorOnView:(UIView *)targetView {
    [targetView addSubview:self];
    [self setFrame:targetView.frame];
    [self.indicator setCenter:self.center];
    [self.indicator startAnimating];
    [targetView bringSubviewToFront:self];
}



- (void)stopIndicator {
    [self.indicator stopAnimating];
    [self removeFromSuperview];
}

@end
