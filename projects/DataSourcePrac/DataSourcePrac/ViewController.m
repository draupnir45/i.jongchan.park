//
//  ViewController.m
//  DataSourcePrac
//
//  Created by 박종찬 on 2017. 3. 27..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "CollectionViewDataSource.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property CollectionViewDataSource *dataSourceForFirstCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *collDataArr = @[@"1", @"2",@"3",@"4",@"5",@"6"];
    
    self.dataSourceForFirstCollectionView = [[CollectionViewDataSource alloc] initWithDataArray:collDataArr];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellForCollectionView" forIndexPath:indexPath];
    
//    CollectionViewDataSource *source = [[CollectionViewDataSource alloc] init];
    
    cell.collectionView.delegate = self;
    cell.collectionView.dataSource = self.dataSourceForFirstCollectionView;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(180, 180);
}

@end
