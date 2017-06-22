//
//  CollectionViewDataSource.h
//  DataSourcePrac
//
//  Created by 박종찬 on 2017. 3. 27..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CollectionViewDataSource : NSObject
<UICollectionViewDataSource>

@property NSArray *dataArray;
- (instancetype)initWithDataArray:(NSArray *)dataArray;

@end
