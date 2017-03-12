//
//  JCFilterOptionsViewController.m
//  JCFilteredTableView
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCFilterOptionsViewController.h"

@interface JCFilterOptionsViewController ()

@property NSArray *allCriteria;
@property NSMutableArray *selectedCriteria;

@end

@implementation JCFilterOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allCriteria = @[@"전기",@"물",@"비행"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)optionSelected:(UIButton *)sender {
    
    if ([self.selectedCriteria containsObject:self.allCriteria[sender.tag]]) {
        [self.selectedCriteria removeObject:self.allCriteria[sender.tag]];
    } else {
        [self.selectedCriteria addObject:self.allCriteria[sender.tag]];
    }
    
    
}


@end
