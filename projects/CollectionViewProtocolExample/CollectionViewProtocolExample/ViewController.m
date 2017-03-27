//
//  ViewController.m
//  CollectionViewProtocolExample
//
//  Created by 박종찬 on 2017. 3. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewDataSource.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property CollectionViewDataSource *collectionViewDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CollectionViewDataSource *dataSource = [[CollectionViewDataSource alloc] init];
    self.collectionViewDataSource = dataSource;
    self.collectionView.dataSource = self.collectionViewDataSource;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width - 60.0f)/3.0f, (self.view.frame.size.width - 60.0f)/3.0f);
}


@end
