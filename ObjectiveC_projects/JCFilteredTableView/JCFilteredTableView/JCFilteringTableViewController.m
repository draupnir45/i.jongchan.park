//
//  JCFilteringTableViewController.m
//  JCFilteredTableView
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCFilteringTableViewController.h"
#import "DataCenter.h"
#import "JCArrayFilteringManager.h"

@interface JCFilteringTableViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property NSArray *originalDataArray;
@property NSArray *filteredDataArray;
@property (getter=isFiltering)BOOL filtering;

@end

@implementation JCFilteringTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"필터" style:UIBarButtonItemStylePlain target:self action:@selector(goToFilterView)];
    
    self.originalDataArray = [DataCenter sharedData].appData;
    self.filteredDataArray = [self.originalDataArray mutableCopy];
    
    self.filteredDataArray = [JCArrayFilteringManager filterArray:self.originalDataArray withCriteria:@[@"비행",@"노말"] forKey:@"타입"];

    //JCFilteringCell
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToFilterView {
    [self performSegueWithIdentifier:@"filter" sender:nil];
}


#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFilteringCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.filteredDataArray[indexPath.row] objectForKey:@"name"];
    
    return cell;
    
}


@end
