//
//  Developer.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Developer.h"
#import "Designer.h"

@implementation Developer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewToDevelop = 0;
//        self.job = @"개발자";
        [self gotNewJob:@"개발자"];
    }
    return self;
}

- (void)developApp {
    self.viewToDevelop -= 1;
    NSLog(@"%@가 뷰를 하나 개발했습니다. 남은 뷰는 %lu개입니다.",self.name, (unsigned long)self.viewToDevelop);
}
- (void)goMeeting {
    [super goMeeting];
}

- (void)assignedByDesigner:(Designer *)designer {
    
    self.viewToDevelop += designer.finishedViews;
    NSLog(@"%@가 다 그린 디자인을 넘겨받았습니다. 남은 뷰는 %lu개입니다.",self.name, (unsigned long)self.viewToDevelop);
    if (self.viewToDevelop > 10) {
        NSLog(@"할 일이 10개가 넘은 개발자 %@가 미쳐 날뛰고 있습니다. 흥분한 나머지 디자인을 깎아내립니다.",self.name);
        NSUInteger rejectedViews = arc4random() % 10;
        [designer gotRejectedView:rejectedViews];
        self.viewToDevelop -= rejectedViews;
    }
}


@end
