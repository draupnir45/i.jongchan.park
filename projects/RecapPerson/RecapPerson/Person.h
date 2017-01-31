//
//  Person.h
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (readonly) NSString *name;
@property (readonly) NSUInteger age;
@property (readonly) NSDate *birthday;
@property (readonly) NSString *job;
@property (readonly) NSString *bloodType;

- (instancetype)initWithName:(NSString *)name
                 andBirthday:(NSDate *)birthday
                andBloodType:(NSString *)bloodType;
- (void)gotNewJob:(NSString *)job;
- (bool)isBirthDayToday;
- (void)goMeeting;


@end
