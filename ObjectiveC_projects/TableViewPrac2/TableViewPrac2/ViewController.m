//
//  ViewController.m
//  TableViewPrac2
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>


@property UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 120, self.view.frame.size.width-30, self.view.frame.size.height-120) style:UITableViewStyleGrouped];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    [self.view addSubview:self.tableView];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    }
    
    cell.textLabel.text = @"Test";
    cell.customImageView.image = [UIImage imageNamed:@"0.jpg"];
    return cell;
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"해야됨";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


@end
