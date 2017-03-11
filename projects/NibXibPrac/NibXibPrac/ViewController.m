//
//  ViewController.m
//  NibXibPrac
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "HSCollectionViewCell.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HSCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HSRecipeCollectionCell"];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HSRecipeCollectionCell" forIndexPath:indexPath];
    
    cell.recipeCostLabel.text = @"코스트";
    cell.recipeTimeLabel.text = @"시간";
    cell.recipeTitleLabel.text = @"타이틀레시피";
    cell.squareThumb.image = [UIImage imageNamed:@"1.jpg"];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
