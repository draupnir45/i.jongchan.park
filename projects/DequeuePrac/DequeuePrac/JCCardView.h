//
//  JCCardView.h
//  DequeuePrac
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface JCCardView : UIView

@property (readonly)UIButton *touchableAreaButton;
@property (readonly)UIView *contentView;
@property (readonly)UIView *baseSheet;
@property (readonly)NSInteger index;


- (instancetype)initWithFrame:(CGRect)frame
                         view:(UIView *)view
                        index:(NSInteger)index;
- (instancetype)changeContentWithView:(UIView *)view
                             andIndex:(NSInteger)index;

@end
