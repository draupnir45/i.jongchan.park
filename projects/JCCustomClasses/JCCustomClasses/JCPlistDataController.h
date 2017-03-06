//
//  JCDataCenter.h
//  PlistPrac
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCPlistDataController : NSObject

@property NSFileManager *fileManager;
@property NSString *documentDirPath;
@property (readonly) NSArray *appData;


+ (instancetype)sharedData;
- (void)saveData;
- (void)addAppDataObject:(id)object;
- (void)removeAppDataObject:(id)object;


@end
