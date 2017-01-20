//
//  Company.h
//  Day2
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property id name;
@property id phoneNumber1;
@property id phoneNumber2;
@property id address;
@property id companyIdentity;
@property id oneLineDescription;
@property id mailAdress1;
@property id mailAdress2;

- (void)callBy:(id)PhoneNumber;
- (void)mailBy:(id)mailAdress1
          ccTo:(id)mailAdress2;
- (void)setCompanyIdentity:(id)photo;
- (void)setOneLineDescription:(id)descriptionText;

@end
