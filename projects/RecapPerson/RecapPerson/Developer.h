//
//  Developer.h
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
@class Designer;

@interface Developer : Person

@property NSUInteger viewToDevelop;

- (void)developApp;
- (void)goMeeting;
- (void)assignedByDesigner:(Designer *)designer;

@end
