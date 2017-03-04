//
//  DataCenter.m
//  PlistPrac
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter


+ (instancetype)sharedData {
    static DataCenter *sharedData = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData = [[DataCenter alloc] init];
    });
    
    return sharedData;
}




- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSString *aDocumentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        
//        NSString *aFilePath = [NSString stringWithFormat:@"%@/contacts.plist", aDocumentsDirectory];
        

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSLog(@"%@", paths);
        
        NSString *basePath = [paths objectAtIndex:0];
        
        NSString *docuPath = [basePath stringByAppendingString:@"/contacts.plist"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath:docuPath]) {
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"contacts2" ofType:@"plist"];
            self.contacts = [NSArray arrayWithContentsOfFile:bundlePath];
        } else  {
            self.contacts = [NSArray arrayWithContentsOfFile:docuPath];
        }
        
    }
    return self;
}

- (void)saveData {
    
//    NSString *aDocumentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
//    
//    NSString *aFilePath = [NSString stringWithFormat:@"%@/contacts.plist", aDocumentsDirectory];
//    
//    bool what = [self.contacts writeToFile:aFilePath atomically:NO];
//    
//    NSLog(@"hmm, %d", what);
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"%@", paths);
    
    NSString *basePath = [paths objectAtIndex:0];
    
    NSString *docuPath = [basePath stringByAppendingString:@"/contacts.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSLog(@"%d", [fileManager fileExistsAtPath:docuPath]);
    
    if (![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"contacts2" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    [self.contacts writeToFile:docuPath atomically:NO];
    
}


@end
