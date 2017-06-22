//
//  main.m
//  BankAndPerson
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Bank.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *test = [[Person alloc] initWithName:@"테스트"];
        Bank *testBank = [[Bank alloc] initWithName:@"신한" atAddress:@"서울"];
        
        [test setMoneyInHome:10000];
        [test makeNewAccountTo:testBank];
        [test insertMoney:300 to:testBank];
        
    }
    return 0;
}
