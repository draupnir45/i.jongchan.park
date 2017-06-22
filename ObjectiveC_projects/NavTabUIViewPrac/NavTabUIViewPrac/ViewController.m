//
//  ViewController.m
//  NavTabUIViewPrac
//
//  Created by 박종찬 on 2017. 2. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [container setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
    [self.view addSubview:container];
    
    UIView *block1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 10)];
    [block1 setBackgroundColor: [UIColor redColor]];
    UIView *block2 = [[UIView alloc] initWithFrame:CGRectMake(90, 0, 10, 90)];
    [block2 setBackgroundColor: [UIColor blueColor]];
    UIView *block3 = [[UIView alloc] initWithFrame:CGRectMake(10, 90, 90, 10)];
    [block3 setBackgroundColor: [UIColor yellowColor]];
    UIView *block4 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 10, 90)];
    [block4 setBackgroundColor: [UIColor greenColor]];

    
    [container addSubview:block1];
    [container addSubview:block2];
    [container addSubview:block3];
    [container addSubview:block4];
    
    UIView *navHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [navHolder setBackgroundColor: [UIColor grayColor]];
    [self.view addSubview:navHolder];
    
    UIView *tabHolder = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -48, self.view.frame.size.width, 48)];
    [tabHolder setBackgroundColor: [UIColor grayColor]];
    [self.view addSubview:tabHolder];
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    [myLabel setText:@""];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
