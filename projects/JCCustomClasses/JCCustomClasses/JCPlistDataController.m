//
//  JCPlistDataController.m
//  PlistPrac
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCPlistDataController.h"

@interface JCPlistDataController ()

@property NSArray *appData;

@end


@implementation JCPlistDataController


+ (instancetype)sharedData {
    static JCPlistDataController *sharedData = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData = [[JCPlistDataController alloc] init];
    });

    return sharedData;
}




- (instancetype)init
{
    self = [super init];
    if (self) {

        self.documentDirPath = [JCPlistDataController documentDiretoryPath];
        self.fileManager = [NSFileManager defaultManager];
        
        if ([self.fileManager fileExistsAtPath:self.documentDirPath]) {
            //저장했던 내용 로드
            self.appData = [NSArray arrayWithContentsOfFile:self.documentDirPath];
        } else  {
            
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"appData" ofType:@"plist"];
            //데이터용 프로퍼티에 번들 내용을 넣음
            self.appData = [NSArray arrayWithContentsOfFile:bundlePath];

        }
        
    }
    return self;
}

- (void)saveData {

    
    if (![self.fileManager fileExistsAtPath:self.documentDirPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"appData" ofType:@"plist"];
        [self.fileManager copyItemAtPath:bundlePath toPath:self.documentDirPath error:nil];
    }
    
    [self.appData writeToFile:self.documentDirPath atomically:NO];
    
}


+ (NSString *)documentDiretoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [(NSString *)([paths objectAtIndex:0]) stringByAppendingString:@"/appData.plist"];
    
    return docuPath;
}


- (void)addAppDataObject:(id)object {
    
    id mutableCopy = [self.appData mutableCopy];
    
    [mutableCopy addObject:object];
    
    self.appData = mutableCopy;
    
    [self saveData];
}

- (void)removeAppDataObject:(id)object {
    
    id mutableCopy = [self.appData mutableCopy];
    
    [mutableCopy removeObject:object];
    
    self.appData = mutableCopy;
    
    [self saveData];
}

@end
