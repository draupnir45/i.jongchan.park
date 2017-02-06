//
//  ButtonTest.m
//  MasteringUIButton
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ButtonTest.h"

@implementation ButtonTest



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        [image setImage:[UIImage imageNamed:@"item0.png"]];
        [image setUserInteractionEnabled:YES];
        [self addSubview:image];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
