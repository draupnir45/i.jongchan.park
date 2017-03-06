//
//  ViewController.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    [tempView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
