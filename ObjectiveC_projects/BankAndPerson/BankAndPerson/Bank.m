//
//  Bank.m
//  BankAndPerson
//
//  Created by 박종찬 on 2017. 1. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Bank.h"
#import "Person.h"


@interface Bank ()

@property (readwrite)NSString *name;
@property (readwrite)NSString *address;
@property (readwrite)NSMutableDictionary *accountInfo;
@property (readwrite)NSMutableArray *accountRef;

@end

@implementation Bank

- (instancetype)initWithName: (NSString *)name atAddress:(NSString *)address {
    self = [super init];
    if (self) {
        self.name = name;
        self.address = address;
        self.accountInfo = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (NSString *)makeNewAccountOf:(Person *)customer {
    //새로운 계좌번호를 만듭니다.
    NSInteger newAccountNumber = (NSInteger) arc4random() % 10000;
    NSString *accountNumber = [NSString stringWithFormat:@"%ld", (long)newAccountNumber];

    //기존에 있던 번호인지 확인합니다.
    while ([_accountRef containsObject:accountNumber]) {
        newAccountNumber = (NSInteger) arc4random() % 10000;
        accountNumber = [NSString stringWithFormat:@"%ld", (long)newAccountNumber];
    }
    
    //계좌번호를 계좌 리스트에 추가합니다.
    [_accountRef addObject:accountNumber];

    //어카운트 딕셔너리를 생성합니다.
    NSMutableDictionary *account = [[NSMutableDictionary alloc]init];
    [account setObject:@0 forKey:accountNumber];
    
    //계좌정보에 사람 이름과 함께 저장합니다.
    [self.accountInfo setObject:account forKey:customer.name];
    
    //계좌번호를 반환합니다.
    return accountNumber;
}

- (void)insertMoney:(NSInteger)money to:(NSString *)accountNumber of:(NSString *)customerName {
    //요청받은 계좌를 받아옵니다.
    NSMutableDictionary *customerAccount = [self.accountInfo objectForKey:customerName];
    NSNumber *balance = [customerAccount objectForKey:accountNumber];
    
    //계좌 잔고에 입금액을 더합니다.
    balance = @([balance integerValue] + money);
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc]init];
    [newDict setObject:balance forKey:accountNumber];
    [self.accountInfo removeObjectForKey:customerName];
    [self.accountInfo setObject:newDict forKey:customerName];
    
    //제대로 들어갔는지 테스트합니다.
    NSInteger test = [[[self.accountInfo objectForKey:customerName] objectForKey:accountNumber] doubleValue];
    NSLog(@"잔고가 %ld가 됩니다.",test);
    
}


@end
