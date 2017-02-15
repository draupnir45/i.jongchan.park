//
//  CoreDataController.h
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "MyDayEntity+CoreDataClass.h"
@class MyDay;


@interface CoreDataController : NSObject

-(void)saveMyDayItem:(MyDay *)day;
-(NSArray *)fetchedArrayFromCoreData;


@end
