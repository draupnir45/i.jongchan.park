//
//  ToolBox.m
//  RecapPerson
//
//  Created by 박종찬 on 2017. 1. 31..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ToolBox.h"
#import "Person.h"
#import "Developer.h"

@implementation ToolBox

+(bool)isDeveloper:(Person *)person {
        if ([person isMemberOfClass:[Developer class]]) {
            NSLog(@"개발자");
            return YES;
        } else {
            NSLog(@"개발자 아님");
            return NO;
        }
}

+(bool)haveSameBloodType:(Person *)person1
               andPerson:(Person *)person2 {
    if ([person1.bloodType isEqualToString:person2.bloodType]) {
        NSLog(@"혈액형이 같습니다.");
        return YES;
    } else {
        return NO;
    }
}

+(bool)checkIfThis:(Person *)person1
       isOlderThan:(Person *)person2 {
    if (person1.age > person2.age) {
        NSLog(@"더 형이 맞습니다.");
        return YES;
    } else {
        return NO;
    }
}

@end
