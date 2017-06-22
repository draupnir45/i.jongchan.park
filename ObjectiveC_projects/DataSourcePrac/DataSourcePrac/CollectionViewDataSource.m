//
//  CollectionViewDataSource.m
//  DataSourcePrac
//
//  Created by 박종찬 on 2017. 3. 27..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CollectionViewDataSource.h"

@implementation CollectionViewDataSource

- (instancetype)initWithDataArray:(NSArray *)dataArray
{
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseIDForCollectionItem" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    
    return cell;
}

@end
