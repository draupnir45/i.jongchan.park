//
//  ButtonDrawRectTest.m
//  MasteringUIButton
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ButtonDrawRectTest.h"

@interface ButtonDrawRectTest ()

@property UIImage *imageToDraw;

@end

@implementation ButtonDrawRectTest

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *test = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height-self.frame.size.width)];
        [test setText:@"HIHI"];
        
        [self addSubview:test];
    }
    return self;
}


//- (void)drawRect:(CGRect)rect {
////    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGRect squareRect = CGRectMake(10, 10, rect.size.width-20, rect.size.width-20);
//    [self.imageToDraw drawInRect:squareRect];
//    
//    
//}

@end
