//
//  JCDateManager.h
//  NSDateCustomClassByObjC
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCDateManager : NSObject

///데이트매니저의 날짜 나타내는 형식을 고정합니다.
@property (nonatomic) NSString *dateFormat;

+(instancetype)sharedInstance;


///포맷 텍스트의 형태로 받은 날짜의 스트링을 반환합니다.
- (NSString *)stringWithDate:(NSDate *)date
                      format:(NSString *)formatText;

///오늘 날짜를 받은 포맷 형태로 내보냅니다.
- (NSString *)stringByTodayWithFormat:(NSString *)formatText;


///설정된 포맷(dateFormat)에 따라 오늘 날짜를 반환합니다.
- (NSString *)today;

///설정된 포맷(dateFormat)에 따라 매개변수로 넘어간 날짜를 반환합니다.
- (NSString *)stringWithDate:(NSDate *)date;

@end
