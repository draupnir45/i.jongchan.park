//
//  Person.h
//  BankAndPerson
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Bank;

@interface Person : NSObject

@property (readonly) NSString *name;
@property (readonly) NSInteger moneyInHome;

-(void)insertMoney:(NSInteger)money to:(Bank *)bank;
-(void)makeNewAccountTo:(Bank *)bank;
-(instancetype)initWithName:(NSString *)name;
-(void)setMoneyInHome:(NSInteger)moneyInHome;

@end
