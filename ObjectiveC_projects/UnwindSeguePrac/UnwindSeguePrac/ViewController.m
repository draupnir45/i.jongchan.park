//
//  ViewController.m
//  UnwindSeguePrac
//
//  Created by 박종찬 on 2017. 4. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIViewController *firstVC = [self.tabBarController.viewControllers objectAtIndex:0];
//    
//    [firstVC removeFromParentViewController];
//    [firstVC.view removeFromSuperview];
//    
//    NSMutableArray *vcs = [[self.tabBarController viewControllers] mutableCopy];
//    [vcs replaceObjectAtIndex:0 withObject:self.navigationController];
//    //    [self.tabBarController addChildViewController:self.navigationController];
//    [self.tabBarController setSelectedViewController:self.navigationController];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToMe:(UIStoryboardSegue *)segue {
    
}

@end
