//
//  main.m
//  StrongAndWeak
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"

int main(int argc, const char * argv[]) {

    
    TestClass *testInstance = [[TestClass alloc] init];
    
    NSLog(@"%p, %@", testInstance.strongOne, testInstance.strongOne);
    
    testInstance.strongOne = @"T";
    NSLog(@"%p, %@", testInstance.strongOne, testInstance.strongOne);
    
    
    testInstance.weakOne = testInstance.strongOne;
    
    testInstance.strongOne = nil;

    NSLog(@"%p, %@", testInstance.strongOne, testInstance.strongOne);
    
    NSLog(@"%p, %@", testInstance.weakOne, testInstance.weakOne);
    
    
    return 0;
}
