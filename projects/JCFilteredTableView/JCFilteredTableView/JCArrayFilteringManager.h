//
//  JCArrayFilteringManager.h
//  JCFilteredTableView
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCArrayFilteringManager : NSObject

+(NSArray *)filterArray:(NSArray *)originalArray
           withCriteria:(NSArray <NSString *> *)criteria
                 forKey:(NSString *)key;


@end
