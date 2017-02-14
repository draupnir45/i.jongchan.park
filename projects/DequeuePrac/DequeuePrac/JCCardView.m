//
//  JCCardView.m
//  DequeuePrac
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCCardView.h"

@interface JCCardView ()

//- touchableAreaButton : 터치할 수 있는 부분을 만들어주는 UIButton입니다.
//- baseSheet : 베이스가 되는 UIView입니다.

@property (readwrite)UIButton *touchableAreaButton;
@property (readwrite)UIView *contentView;
@property (readwrite)UIView *baseSheet;
@property (readwrite)NSInteger index;

@end

@implementation JCCardView

- (instancetype)initWithFrame:(CGRect)frame
                         view:(UIView *)view
                        index:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView = view;
        self.contentView.frame = self.frame;
        self.index = index;
        self.touchableAreaButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 88)];
        
        [self.layer setCornerRadius:10];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowOpacity:0.2];
        [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [self addSubview:view];
        [self setTag:index];
        [self.contentView addSubview:self.touchableAreaButton];
        [self addSubview:self.contentView];

    }
    return self;
}

- (instancetype)changeContentWithView:(UIView *)view
                             andIndex:(NSInteger)index {
    [self.touchableAreaButton removeFromSuperview];
    [self.contentView removeFromSuperview];
    self.contentView = view;
    self.contentView.frame = self.frame;
    self.index = index;
    [self.contentView addSubview:self.touchableAreaButton];
    [self addSubview:self.contentView];
    return self;
}


@end
