//
//  ViewController.m
//  TextViewInTableViewPrac
//
//  Created by 박종찬 on 2017. 4. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "TextViewCell.h"



@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray new];
    [self.dataArray addObject:@""];
    // Do any additional setup after loading the view, typically from a nib.
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
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataArray.count) {
        TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextViewCell" forIndexPath:indexPath];
        cell.textView.delegate = self;
        cell.textView.text = self.dataArray[indexPath.row];
        
        cell.textView.tag = indexPath.row;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"redCell" forIndexPath:indexPath];
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

@end
