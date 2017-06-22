//
//  Controller.h
//  Day2
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecialContact.h"
#import "Person.h"
#import "Company.h"

@interface Controller : NSObject

- (void)callTo:(Person *)person;
- (void)mailBy:(id)mailAdress;
- (SpecialContact *)makeSpecial:(Person *)person;
- (void)deleteEveryPhotoBy:(id)face;

@end
