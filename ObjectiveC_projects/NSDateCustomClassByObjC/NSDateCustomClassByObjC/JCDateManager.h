//
//  JCDateManager.h
//  NSDateCustomClassByObjC
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCDateManager : NSObject

@property (nonatomic) NSString *dateFormat;

+(instancetype)sharedInstance;

- (NSString *)stringWithDate:(NSDate *)date
                      format:(NSString *)formatText;
- (NSString *)stringByTodayWithFormat:(NSString *)formatText;
- (NSString *)today;
- (NSString *)stringWithDate:(NSDate *)date;

@end
