//
//  Person.h
//  Day2
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property id name;
@property id yearOfBirth;
@property id occupation;
@property id sex;
@property id phoneNumber1;
@property id phoneNumber2;
@property id birthday;
@property id lunaOrSolar;
@property id lunaBirthday;
@property id address;
@property id profilePhoto;
@property id oneLineDescription;
@property id mailAdress;

- (void)callBy:(id)PhoneNumber;
- (void)mailBy:(id)mailAdress;
- (void)setProfilePhoto:(id)photo;
- (void)setOneLineDescription:(id)descriptionText;

@end
