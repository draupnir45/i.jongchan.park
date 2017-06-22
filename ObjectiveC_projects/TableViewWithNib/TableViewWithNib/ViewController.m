//
//  ViewController.m
//  TableViewWithNib
//
//  Created by 박종찬 on 2017. 3. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CustomTableViewCell"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    
    cell.label1.text = @"1";
    cell.label2.text = @"깔깔깔";
    cell.label3.text = @"자동완성";
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"];
    
    return cell.bounds.size.height;
    
}


@end
