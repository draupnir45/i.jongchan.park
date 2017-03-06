//
//  ViewController.m
//  NSDateCustomClassByObjC
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "JCDateManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [[JCDateManager sharedInstance] stringByTodayWithFormat:@"yyyy.MM.dd."]);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
