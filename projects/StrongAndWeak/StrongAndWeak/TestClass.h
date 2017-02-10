//
//  TestClass.h
//  StrongAndWeak
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject


@property (nonatomic)NSString *strongOne;
@property (nonatomic)NSString *somethingElse;
@property (weak, nonatomic) NSString *weakOne;


@end
