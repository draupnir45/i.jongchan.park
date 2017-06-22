//
//  Designer.h
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
@class Developer;

@interface Designer : Person

@property NSUInteger viewToDraw;
@property NSUInteger finishedViews;

- (void)designUI;
- (void)goMeetingWith:(Developer *)dev;
- (void)gotRejectedView:(NSUInteger)views;

@end
