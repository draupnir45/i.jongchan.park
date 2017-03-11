//
//  CollectionTableViewCell.m
//  TableViewHellgate2
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CollectionTableViewCell.h"

@implementation CollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 10;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cCellID" forIndexPath:indexPath];
//    
//    return cell;
//}

@end
