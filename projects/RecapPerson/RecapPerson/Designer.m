//
//  Designer.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Designer.h"
#import "Developer.h"

@implementation Designer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewToDraw = 0;
        self.finishedViews = 0;
        [self gotNewJob:@"디자이너"];
    }
    return self;
}

- (void)designUI {
    self.viewToDraw -= 1;
    self.finishedViews += 1;
    NSLog(@"%@가 뷰를 하나 그렸습니다. 남은 뷰는 %lu개입니다.",self.name, (unsigned long)self.viewToDraw);
}

- (void)goMeetingWith:(Developer *)dev {
    [super goMeeting];
    if (self.finishedViews > 0) {
        [dev assignedByDesigner:self];
        NSLog(@"%@가 %lu개 뷰를 넘깁니다.",self.name, (unsigned long)self.finishedViews);
        self.finishedViews = 0;
    }
}

- (void)gotRejectedView:(NSUInteger)views {
    self.viewToDraw += views;
    NSLog(@"%@가 %lu개 시안을 거부당했습니다. 남은 뷰는 %lu개입니다.",self.name,views, (unsigned long)self.viewToDraw);
}

@end
