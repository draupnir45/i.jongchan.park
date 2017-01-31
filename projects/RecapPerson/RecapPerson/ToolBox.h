//
//  ToolBox.h
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface ToolBox : NSObject

+(bool)isDeveloper:(Person *)person;
+(bool)checkIfThis:(Person *)person1
       isOlderThan:(Person *)person2;
+(bool)haveSameBloodType:(Person *)person1
               andPerson:(Person *)person2;

@end
