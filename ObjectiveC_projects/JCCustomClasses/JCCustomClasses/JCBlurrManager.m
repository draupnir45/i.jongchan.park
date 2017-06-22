//
//  JCBlurrManager.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCBlurrManager.h"

@implementation JCBlurrManager

+ (void)blurrView:(UIView *)view
  withEffectStyle:(UIBlurEffectStyle)effectStyle {
    
    UIBlurEffect *blurrEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurrEffect];
    visualEffectView.frame = view.bounds;
    [view addSubview:visualEffectView];
}

+ (void)    blurrView:(UIView *)view
      withEffectStyle:(UIBlurEffectStyle)effectStyle
  animateWithDuration:(CGFloat)duration
                delay:(CGFloat)delay
              options:(UIViewAnimationOptions)options {
    
    UIBlurEffect *blurrEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurrEffect];
    visualEffectView.frame = view.bounds;
    [view addSubview:visualEffectView];
    
    [visualEffectView setAlpha:0.0];
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        
        [visualEffectView setAlpha:1.0];
        
    } completion:nil];
    
}

@end
