//
//  JCDateManager.m
//  NSDateCustomClassByObjC
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JCDateManager.h"

@interface JCDateManager()

@property NSDateFormatter *formatter;


@end



@implementation JCDateManager

+(instancetype)sharedInstance {
    
    static JCDateManager *dateManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateManager = [[JCDateManager alloc] init];
    });
    
    return dateManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.formatter = [[NSDateFormatter alloc] init];
    }
    return self;
}



- (NSString *)stringWithDate:(NSDate *)date
                      format:(NSString *)formatText {
    NSString *result;
    
    NSString *initialFormat = self.formatter.dateFormat;
    
    self.formatter.dateFormat = formatText;
    result = [self.formatter stringFromDate:date];
    
    self.formatter.dateFormat = initialFormat;
    
    return result;
}

- (NSString *)stringByTodayWithFormat:(NSString *)formatText {
    return [self stringWithDate:[NSDate date] format:formatText];
}

- (NSString *)today {
    return [self stringWithDate:[NSDate date] format:self.dateFormat];
}

- (NSString *)stringWithDate:(NSDate *)date {
    return [self stringWithDate:date format:self.dateFormat];
}

@end
