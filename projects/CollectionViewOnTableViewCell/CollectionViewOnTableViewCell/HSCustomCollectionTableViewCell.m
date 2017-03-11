//
//  HSCustomCollectionTableViewCell.m
//  CollectionViewOnTableViewCell
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "HSCustomCollectionTableViewCell.h"
#import "HSCollectionViewCell.h"
#import "JCAlertController.h"

@implementation HSCustomCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HSCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HSCollectionViewCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - CollectionView Setting

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HSCollectionViewCell" forIndexPath:indexPath];
    
    cell.recipeCostLabel.text = @"코스트";
    cell.recipeTimeLabel.text = @"시간";
    cell.recipeTitleLabel.text = @"타이틀레시피";
    cell.squareThumb.image = [UIImage imageNamed:@"1.jpg"];
    cell.tag = collectionView.tag;
    
    return cell;
    
}



@end
