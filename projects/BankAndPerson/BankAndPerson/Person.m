//
//  Person.m
//  BankAndPerson
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@interface Person ()

@property (readwrite) NSString *name;
@property (readwrite) NSMutableDictionary *accountNumber;
@property (readwrite) NSInteger moneyInHome;

@end



@implementation Person

-(instancetype)initWithName:(NSString *)name {
    if (self) {
        self.name = name;
        self.accountNumber = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)makeNewAccountTo:(Bank *)bank {
    [self.accountNumber setObject:[bank makeNewAccountOf:self] forKey:bank.name];
}

-(void)insertMoney:(NSInteger)money to:(Bank *)bank {
    //돈이 있는지 없는지 확인합니다.
    if (money > self.moneyInHome) {
        NSLog(@"%@가 %lu원을 입금하려 했으나 그만한 돈이 없습니다!",self.name, (unsigned long)money);
    } else {
        //자신의 계좌번호를 불러옵니다.
        NSString *accountNumb = [self.accountNumber objectForKey:bank.name];
        NSLog(@"%@가 %@은행에 %lu원을 입금합니다.", self.name, bank.name, (unsigned long)money);
        //은행에게 입금을 요청합니다.
        [bank insertMoney:money to:accountNumb of:self.name];
    }
    
}

@end
