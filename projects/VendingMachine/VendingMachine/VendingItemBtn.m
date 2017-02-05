//
//  VendingItemBtn.m
//  VendingMachine
//
//  Created by 박종찬 on 2017. 2. 5..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "VendingItemBtn.h"
#import "ButtonWithPrice.h"

@interface VendingItemBtn ()

@property UIView *imageViewHolder;

@end


@implementation VendingItemBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageViewHolder = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.width-20)];
        [self.imageViewHolder setBackgroundColor:[UIColor whiteColor]];
        [self.imageViewHolder.layer setCornerRadius:10.0];

        
        self.itemImage = [[ButtonWithPrice alloc] initWithFrame:CGRectMake(30, 30, self.imageViewHolder.frame.size.width-60, self.imageViewHolder.frame.size.width-60)];
        
        self.itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, _imageViewHolder.frame.size.height, self.frame.size.width-10, self.frame.size.height - _imageViewHolder.frame.size.height)];
        [self.itemTitle setTextColor:[UIColor whiteColor]];
        [self.itemTitle setTextAlignment:NSTextAlignmentCenter];
        [self.itemTitle setFont: [UIFont fontWithName:@"ArialRoundedMTBold" size:17.0]];

        [self.imageViewHolder addSubview:self.itemImage];        
        [self addSubview:self.itemTitle];
        [self addSubview:self.imageViewHolder];
        [self setUserInteractionEnabled:YES];
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
