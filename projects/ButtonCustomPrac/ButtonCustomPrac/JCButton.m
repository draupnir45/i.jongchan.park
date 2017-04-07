//
//  JCButton.m
//  ButtonCustomPrac
//
//  Created by 박종찬 on 2017. 4. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCButton.h"

@implementation JCButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)viewSelected:(id)sender {
    
    self.state = JCButtonStateSelected;
    
}

@end
