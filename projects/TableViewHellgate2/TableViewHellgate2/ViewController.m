//
//  ViewController.m
//  TableViewHellgate2
//
//  Created by 박종찬 on 2017. 3. 11..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CollectionTableViewCell.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectionTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellFromNib"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellFromNib"];
    
//    if (cell == nil) {
//
//        cell = [tableView dequeueReusableCellWithIdentifier:@"cellFromNib"];
//    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellFromNib"];
    
    return cell.bounds.size.height;
}


@end
