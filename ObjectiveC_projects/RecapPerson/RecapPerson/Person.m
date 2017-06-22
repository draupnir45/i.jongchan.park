//
//  Person.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
@interface Person()

@property (readwrite) NSString *name;
@property (readwrite) NSUInteger age;
@property (readwrite) NSDate *birthday;
@property (readwrite) NSString *job;
@property (readwrite) NSString *bloodType;

@end


@implementation Person

- (instancetype)initWithName:(NSString *)name
                 andBirthday:(NSDate *)birthday
                andBloodType:(NSString *)bloodType
{
    self = [super init];
    if (self) {
        self.name = name;
        self.birthday = birthday;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"yyyy";
        NSInteger birthYearInt = [[dateFormatter stringFromDate:self.birthday] integerValue];
        NSInteger year = [[dateFormatter stringFromDate:[NSDate date]] integerValue];
        self.age = year - birthYearInt;
        self.bloodType = bloodType;
    }
    return self;
}

- (void)gotNewJob:(NSString *)job {
    self.job = job;
}

-(bool)isBirthDayToday {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM-dd";
    NSDate *today = [NSDate date];
    NSString *todayStr = [dateFormatter stringFromDate:today];
    NSString *myBirthday = [dateFormatter stringFromDate:self.birthday];
    if (todayStr == myBirthday) {
        return YES;
    } else {
        return NO;
    }
    
    
}

-(void)goMeeting {
    NSLog(@"%@가 회의에 참석합니다!",self.name);
}



@end
