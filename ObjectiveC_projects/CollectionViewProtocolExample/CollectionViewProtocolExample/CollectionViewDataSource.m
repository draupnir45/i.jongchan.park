//
//  CollectionViewDataSource.m
//  CollectionViewProtocolExample
//
//  Created by 박종찬 on 2017. 3. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CollectionViewDataSource.h"
#import "CustomCollectionViewCell.h"

@implementation CollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 750;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCellReuseID" forIndexPath:indexPath];
    
    cell.pmImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pm-sprite/%ld",indexPath.item]];
    
    return cell;
}

@end
