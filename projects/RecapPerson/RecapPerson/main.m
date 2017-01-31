//
//  main.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Designer.h"
#import "Developer.h"
#import "Calender.h"
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
        NSDate *testBithday = [dateFormatter dateFromString:@"1988-01-31"];
        
        Person *test = [[Person alloc] initWithName:@"테스트" andBirthday:testBithday andBloodType:@"O"];
        
        [test gotNewJob:@"개발자"];
        
        if ([test isBirthDayToday]) {
            NSLog(@"%lu번째 생일입니다!", (unsigned long)test.age);
        }
        
        Designer *jongchan = [[Designer alloc] initWithName:@"종찬" andBirthday:[dateFormatter dateFromString:@"1988-01-31"] andBloodType: @"O"];
        Developer *someDev = [[Developer alloc]initWithName:@"누군가" andBirthday:[dateFormatter dateFromString:@"1980-01-31"] andBloodType: @"O"];
//        
//        [jongchan setViewToDraw:20];
//        [someDev setViewToDevelop:0];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan goMeetingWith:someDev];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [someDev developApp];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [someDev developApp];
//        [jongchan goMeetingWith:someDev];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [someDev developApp];
//        [jongchan designUI];
//        [jongchan designUI];
//        [jongchan designUI];
//        [someDev developApp];
//        [jongchan goMeetingWith:someDev];
//        if ([someDev isMemberOfClass:[Developer class]]) {
//            NSLog(@"그는 개발자가 맞습니다.");
//        }
//        
//        
//        
//        NSLog(@"~~마지막 날 계산기~~");
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 1, [Calender lastDayOfmonth:1]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 2, [Calender lastDayOfmonth:2]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 3, [Calender lastDayOfmonth:3]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 4, [Calender lastDayOfmonth:4]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 5, [Calender lastDayOfmonth:5]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 6, [Calender lastDayOfmonth:6]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 7, [Calender lastDayOfmonth:7]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 8, [Calender lastDayOfmonth:8]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 9, [Calender lastDayOfmonth:9]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 10, [Calender lastDayOfmonth:10]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 11, [Calender lastDayOfmonth:11]);
//        NSLog(@"%d월의 마지막 날은 %lu일입니다.", 12, [Calender lastDayOfmonth:12]);
        [ToolBox isDeveloper:someDev];
        [ToolBox checkIfThis:someDev isOlderThan:jongchan];
        
    }
    return 0;
}
