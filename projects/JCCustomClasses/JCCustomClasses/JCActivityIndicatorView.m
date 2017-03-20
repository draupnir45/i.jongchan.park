//
//  JCFullScreenActivityIndicatorView.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCActivityIndicatorView.h"

@implementation JCActivityIndicatorView

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
