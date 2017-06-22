//
//  MyTableViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "MyDayTableViewController.h"
#import "MyDay.h"
#import "DetailViewController.h"
#import "CoreDataController.h"
#import "EditViewController.h"

@interface MyDayTableViewController ()
<EditViewControllerDelegate>

@property NSArray *dataArray;
@property CoreDataController *dataController;

@end

@implementation MyDayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataController = [[CoreDataController alloc] init];
    
    self.dataArray = [self.dataController fetchedArrayFromCoreData];
    
    self.navigationController.hidesBarsOnSwipe = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reusableId = @"reusable!";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableId forIndexPath:indexPath];
    
    MyDay *item = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = item.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",item.writtenDate];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSMutableArray *arrayForDelete = [self.dataArray mutableCopy];
        [arrayForDelete removeObjectAtIndex:indexPath.row];
        [self.dataController deleteMyDayItemAtIndex:indexPath.row];
        self.dataArray = arrayForDelete;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    }
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"sender : %@",sender);
    NSLog(@"%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        detailViewController.day = self.dataArray[indexPath.row];
        
    } else if ([segue.identifier isEqualToString:@"AddSegue"]) {
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.delegate = self;
        [editViewController setEditViewStatus:MyDayEditViewStatusAdding];
    }
}

-(void)editViewWillDoneEditing:(EditViewController *)editViewController {
    if (editViewController.editViewStatus == MyDayEditViewStatusAdding) {
        NSMutableArray *mutableCopy = [self.dataArray mutableCopy];
        [mutableCopy insertObject:editViewController.day atIndex:0];
        self.dataArray = mutableCopy;
        
        [self reloadTableView];
    }

}

#pragma mark - TableView

-(void)reloadTableView {
    self.dataArray = [self.dataController fetchedArrayFromCoreData];
    [self.tableView reloadData];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}


@end
