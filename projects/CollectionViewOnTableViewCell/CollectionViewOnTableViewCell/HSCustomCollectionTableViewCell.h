//
//  HSCustomCollectionTableViewCell.h
//  CollectionViewOnTableViewCell
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSCustomCollectionTableViewCell : UITableViewCell
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
