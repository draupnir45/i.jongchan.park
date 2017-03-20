//
//  JCFullScreenActivityIndicatorView.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCActivityIndicatorView : UIView

@property UIActivityIndicatorView *indicator;

- (void)startIndicatorOnView:(UIView *)targetView;
- (void)stopIndicator;

@end
