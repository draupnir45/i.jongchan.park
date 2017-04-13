//
//  NSURL+JCAddition.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 4. 13..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "NSURL+JCAddition.h"

@implementation NSURL (JCAddition)

+ (NSURL *)percentEncodedURLWithURLString:(NSString *)urlString {
    NSString *encodedStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedStr];
    return url;
}

@end
