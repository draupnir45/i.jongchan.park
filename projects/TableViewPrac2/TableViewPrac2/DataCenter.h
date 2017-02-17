//
//  DataCenter.h
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)defaultData;

- (NSDictionary *)allAnimals;
- (NSArray *)sectionTitles;
- (NSInteger)sectionCount;
- (NSString *)imageNameWithAnimal:(NSString *)animal;
@end
