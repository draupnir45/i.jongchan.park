//
//  ViewController.m
//  UIButtonHiddenTest
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton *buttonTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonTest = [[UIButton alloc] initWithFrame:CGRectMake(20, 50, 200, 50)];
    [self.buttonTest setTitle:@"TEST" forState:UIControlStateNormal];
    [self.buttonTest setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:self.buttonTest];
    
    [self.buttonTest addTarget:self action:@selector(hideIt:) forControlEvents:UIControlEventTouchUpInside];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)hideIt:(UIButton *)sender {
    [self.buttonTest setHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
