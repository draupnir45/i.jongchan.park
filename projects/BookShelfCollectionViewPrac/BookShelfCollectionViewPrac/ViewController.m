//
//  ViewController.m
//  BookShelfCollectionViewPrac
//
//  Created by 박종찬 on 2017. 4. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "BookCoverCollectionViewCell.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"BookCoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"BookCoverCollectionViewCell"];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookCoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookCoverCollectionViewCell" forIndexPath:indexPath];
    
    cell.coverImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row % 5]];
    NSLog(@"cellForItemAtIndexPath");
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat heightByWidthRatio = [BookCoverCollectionViewCell getImageRatioWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row % 5]]];
    
    if (heightByWidthRatio <= (172.0f/96.0f)) {
        return CGSizeMake(96.0f, 172.0f);
    } else {
        CGFloat newWidth = 172.0f / heightByWidthRatio;
        return CGSizeMake(newWidth, 172.0f);
    }
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    NSLog(@"minimumLineSpacingForSectionAtIndex");
//    return 8.0;
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 8.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0,16,0,16); // top, left, bottom, right
}

@end
