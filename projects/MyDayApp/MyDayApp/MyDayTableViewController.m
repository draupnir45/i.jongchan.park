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
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reusableId = @"reusable!";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableId forIndexPath:indexPath];
    
    MyDay *item = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",item.writtenDate];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

-(void)editViewWillDoneEditing:(EditViewController *)editViewController {
    NSMutableArray *mutableCopy = [self.dataArray mutableCopy];
    [mutableCopy insertObject:editViewController.day atIndex:0];
    self.dataArray = mutableCopy;
    
    [self.dataController saveMyDayItem:editViewController.day];
    
    
    [self.tableView reloadData];
}

@end
