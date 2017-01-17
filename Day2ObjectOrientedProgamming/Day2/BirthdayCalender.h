//
//  BirthdayCalender.h
//  Day2
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BirthdayCalender : NSObject

@property id solarBirthdays;
@property id solarDateFromLunaBirthdays;
@property id basicCalender;

- (id)calculateAge;
- (id)lunaBirthdayToSolarDate;
- (void)setAgeTo:(id)person
             age:(id)age;

@end
