//
//  DetailViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "MyDay.h"
#import "EditViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    titleLabel.text = self.day.content;
    [self.view addSubview:titleLabel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.day = self.day;
        [editViewController setEditViewStatus:MyDayEditViewStatusEditing];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
