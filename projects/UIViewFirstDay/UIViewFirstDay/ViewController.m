//
//  ViewController.m
//  UIViewFirstDay
//
//  Created by 박종찬 on 2017. 2. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *testView1;
@property UIView *testView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testView1 = [[UIView alloc]initWithFrame:CGRectMake(15, 15, self.view.frame.size.width-30, 100)];
    [self.testView1 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.testView1];
    
    self.testView2 = [[UIView alloc]initWithFrame:CGRectMake(15, self.view.frame.size.height-115, self.view.frame.size.width-30, 100)];
    [self.testView2 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.testView2];
    
    
    
    
//    CGFloat fullWidth = self.view.frame.size.width;
//    CGFloat fullHeight = self.view.frame.size.height;
//    UIView *test = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 200)];
//    
//    [test setBounds:CGRectMake(0, 0, 100, 300)];
//    [test setCenter:CGPointMake(fullWidth/2,fullHeight/2)];
//    [test setAlpha:0.5];
//    [test setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
//    [test setContentMode:UIViewContentModeCenter];
//    [test setTintColor:[UIColor redColor]];
//    [test setClipsToBounds:YES];
//    
//    [self.view addSubview:test];
//    
//    UIView *subTestView = [[UIView alloc] init];
//    subTestView.frame = CGRectMake(10, 30, 500, 200);
//    subTestView.center = CGPointMake(test.frame.size.width/2, test.frame.size.height/2);
//    
//    [subTestView setBackgroundColor:[UIColor redColor]];
//    [test addSubview:subTestView];
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 300, 200)];
//    btn.titleLabel.text = @"hi";
//    [self.view addSubview:btn];
    
    
//    UIButton * testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
//    [testBtn.titleLabel setText:@"Hi"];
//    testBtn.titleLabel.textColor = test.tintColor;
//    [testBtn.titleLabel setTintColor:test.tintColor];
//    [self.view addSubview:testBtn];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
