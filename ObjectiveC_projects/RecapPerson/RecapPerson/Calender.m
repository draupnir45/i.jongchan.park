//
//  Calender.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Calender.h"

@implementation Calender

+(NSInteger)lastDayOfmonth:(NSInteger)month {
    switch (month) {
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
            break;
        case 2:
            return 28;
            break;
        default:
            return 31;
            break;
    }
}

@end
