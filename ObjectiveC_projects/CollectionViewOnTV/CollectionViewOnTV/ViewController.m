//
//  ViewController.m
//  CollectionViewOnTV
//
//  Created by 박종찬 on 2017. 3. 23..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CollectionContainerTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return 10;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            CollectionContainerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellForCollectionView" forIndexPath:indexPath];
            
            cell.collectionView.delegate = self;
            
            return cell;
        }
            break;
            
        default:
        {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell" forIndexPath:indexPath];
        
            return cell;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 180.0f;
            break;
            
        default:
            return 44.0f;
            break;
    }
}


@end
