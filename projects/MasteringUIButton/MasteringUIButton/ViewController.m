//
//  ViewController.m
//  MasteringUIButton
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "ButtonDrawRectTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ButtonDrawRectTest *btn = [[ButtonDrawRectTest alloc] initWithFrame:CGRectMake(0, 0, 150, 200)];
    [btn setImage:[UIImage imageNamed:@"item0.png"] forState:UIControlStateNormal];
//    [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 50, 0)];
    
    [btn setCenter:self.view.center];
//    [btn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTitle:@"TEST" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)touched:(id)sender {
    NSLog(@"HI");
}

@end
