//
//  NSMutableAttributedString+JCAdditions.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 4. 12..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (JCAdditions)

+ (NSAttributedString *)attrStringWithString:(NSString *)string lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing;

@end
