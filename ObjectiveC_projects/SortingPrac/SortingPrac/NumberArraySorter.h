//
//  NumberArraySorter.h
//  SortingPrac
//
//  Created by 박종찬 on 2017. 2. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberArraySorter : NSObject

+ (NSArray *)bubbleSort:(NSArray *)dataArray;
+ (NSArray *)quickSort:(NSArray *)dataArray;
+ (NSArray *)mergeSort:(NSArray *)dataArray;

@end
