//
//  ButtonWithPrice.m
//  VendingMachine
//
//  Created by 박종찬 on 2017. 2. 5..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ButtonWithPrice.h"

@implementation ButtonWithPrice

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.price = 0;
    }
    return self;
}

@end
