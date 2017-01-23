//
//  Bank.h
//  BankAndPerson
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Bank : NSObject

@property (readonly)NSString *name;
@property (readonly)NSString *address;

- (NSString *)makeNewAccountOf:(Person *)customer;
- (void)insertMoney:(NSInteger)money to:(NSString *)accountNumber of:(NSString *)customerName;
- (instancetype)initWithName: (NSString *)name atAddress:(NSString *)address;

@end
