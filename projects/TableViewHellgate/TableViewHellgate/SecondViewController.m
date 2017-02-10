//
//  SecondViewController.m
//  TableViewHellgate
//
//  Created by 박종찬 on 2017. 2. 8..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "SecondViewController.h"
#import "JournalItems.h"

@interface SecondViewController ()



@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *temp = [[UIButton alloc] initWithFrame: CGRectMake(self.view.frame.size.width-95, 50, 75, 30)];
    [temp setTitle:@"닫기" forState:UIControlStateNormal];
    [temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [temp.layer setCornerRadius:15];
    [temp setBackgroundColor:[UIColor blackColor]];
    [temp setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [temp setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [temp addTarget:self
             action:@selector(btnSelected:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:temp];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnSelected:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
