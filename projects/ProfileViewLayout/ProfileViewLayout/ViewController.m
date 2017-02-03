//
//  ViewController.m
//  ProfileViewLayout
//
//  Created by 박종찬 on 2017. 2. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    UIView *coverImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 168)];
    [coverImage setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:coverImage];
    
    
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scroll];

    
    UIView *whiteSheet = [[UIView alloc] initWithFrame:CGRectMake(0, 168, self.view.frame.size.width, 2000)];
    [whiteSheet setBackgroundColor:[UIColor whiteColor]];
    [scroll addSubview:whiteSheet];
    
    [scroll setContentSize:whiteSheet.frame.size];
    
    UIView *profileContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 128, self.view.frame.size.width, 140)];
    [scroll addSubview:profileContainer];
    
    UIView *profileImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [profileImage setCenter:CGPointMake(profileContainer.frame.size.width/2, 40)];
    [profileImage setBackgroundColor:[UIColor grayColor]];
    [profileContainer addSubview:profileImage];
    
    UIView *userID = [[UIView alloc] initWithFrame:CGRectMake(profileContainer.frame.size.width/2-40, 83, 80, 25)];
    [userID setBackgroundColor:[UIColor grayColor]];
    [profileContainer addSubview:userID];
    
    UIView *userInfo = [[UIView alloc] initWithFrame:CGRectMake(profileContainer.frame.size.width/2-40, 110, 80, 13)];
    [userInfo setBackgroundColor:[UIColor grayColor]];
    [profileContainer addSubview:userInfo];

    UIView *tabContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 268, self.view.frame.size.width, 45)];
    [tabContainer setBackgroundColor:[UIColor grayColor]];
    [scroll addSubview:tabContainer];
    
    UIImageView *imageView;
    UIButton *btn;
    UILabel *label;
    NSMutableAttributedString *string;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
