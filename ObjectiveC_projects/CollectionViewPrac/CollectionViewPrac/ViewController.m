//
//  ViewController.m
//  CollectionViewPrac
//
//  Created by 박종찬 on 2017. 3. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 151;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseID" forIndexPath:indexPath];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld",indexPath.row+1]]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView.frame.size.width) / 4 , collectionView.frame.size.width / 4 );
}

@end
