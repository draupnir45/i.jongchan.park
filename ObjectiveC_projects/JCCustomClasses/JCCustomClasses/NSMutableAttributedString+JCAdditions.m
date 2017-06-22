//
//  NSMutableAttributedString+JCAdditions.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 4. 12..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSMutableAttributedString+JCAdditions.h"

@implementation NSMutableAttributedString (JCAdditions)

+ (NSAttributedString *)attrStringWithString:(NSString *)string lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpacing];
    [style setParagraphSpacing:paragraphSpacing];
    [attrString addAttribute:NSParagraphStyleAttributeName
                       value:style
                       range:NSMakeRange(0, attrString.length)];
    return attrString;
}

@end
