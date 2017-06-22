//
//  SBQuotationsViewController.m
//  SooBook
//
//  Created by 박종찬 on 2017. 4. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SBQuotationsViewController.h"
#import "SBTextViewCell.h"
//#import "SZTextView.h"

@interface SBQuotationsViewController ()
<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *dataArray;

@end

@implementation SBQuotationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray new];
    [self.dataArray addObject:@""];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count + 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count) {
        return 80;
    } else {
        return UITableViewAutomaticDimension;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataArray.count) {
        SBTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SBTextViewCell" forIndexPath:indexPath];
        cell.textView.delegate = self;
        cell.textView.text = self.dataArray[indexPath.row];
        
        cell.textView.tag = indexPath.row;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddQuotationCell" forIndexPath:indexPath];
        return cell;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    self.dataArray[textView.tag] = textView.text;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count) {
        [self.dataArray addObject:@""];
        [tableView reloadData];
    }
}


- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (IBAction)cancelButtonSelected:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}


@end
