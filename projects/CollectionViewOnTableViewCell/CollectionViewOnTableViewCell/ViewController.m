//
//  ViewController.m
//  CollectionViewOnTableViewCell
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "HSCustomCollectionTableViewCell.h"
#import "JCAlertController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HSCustomCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID" forIndexPath:indexPath];
    
    cell.collectionView.delegate = self;
    cell.collectionView.dataSource = cell;
    cell.collectionView.tag = indexPath.row;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    NSString *message = [NSString stringWithFormat:@"%ld, %ld",(long)cell.tag, (long)indexPath.row];
    JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"눌려짐?" message:message preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"구드"];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
