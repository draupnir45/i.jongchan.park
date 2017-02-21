//
//  ViewController.m
//  LowLevelCoding
//
//  Created by 박종찬 on 2017. 2. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    [button setTitle:@"전환" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushNewVC:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.button = button;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    self.title = @"First View";
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushNewVC:(UIButton *)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
