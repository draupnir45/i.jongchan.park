//
//  CalcButton.m
//  CalcCopy
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CalcButton.h"

@interface CalcButton ()

@property UIColor *primaryBackgroundColor;

@end

@implementation CalcButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    [super awakeFromNib];
    self.primaryBackgroundColor = self.backgroundColor;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    
    if (highlighted) {
        [self setBackgroundColor:[UIColor colorWithCGColor:CGColorCreateCopyWithAlpha([[self backgroundColor] CGColor], 0.7)]];
    } else {
        [self setBackgroundColor:self.primaryBackgroundColor];
    }

}

@end
