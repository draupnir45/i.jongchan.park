//
//  ViewController.m
//  UIScrollViewStudy
//
//  Created by 박종찬 on 2017. 2. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIScrollView *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    self.test = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height)];
//    [self.test setPagingEnabled:YES];
    [self.test setContentSize:CGSizeMake(frameSize.width * 2, frameSize.height * 2)];
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height)];
    [subView1 setBackgroundColor:[UIColor blackColor]];
    [self.test addSubview:subView1];
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(frameSize.width, 0, frameSize.width, frameSize.height)];
    [subView2 setBackgroundColor:[UIColor blueColor]];
    [self.test addSubview:subView2];
    UIView *subView3 = [[UIView alloc] initWithFrame:CGRectMake(0, frameSize.height, frameSize.width, frameSize.height)];
    [subView3 setBackgroundColor:[UIColor redColor]];
    [self.test addSubview:subView3];
    UIView *subView4 = [[UIView alloc] initWithFrame:CGRectMake(frameSize.width, frameSize.height, frameSize.width, frameSize.height)];
    [subView4 setBackgroundColor:[UIColor whiteColor]];
    [self.test addSubview:subView4];
    
    [self.view addSubview:self.test];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
