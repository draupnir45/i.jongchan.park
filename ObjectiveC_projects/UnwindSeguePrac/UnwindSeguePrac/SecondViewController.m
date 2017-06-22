//
//  SecondViewController.m
//  UnwindSeguePrac
//
//  Created by 박종찬 on 2017. 4. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *firstVC = [self.tabBarController.viewControllers objectAtIndex:0];
    
    [firstVC removeFromParentViewController];
    [firstVC.view removeFromSuperview];
    
    NSMutableArray *vcs = [[self.tabBarController viewControllers] mutableCopy];
    [vcs replaceObjectAtIndex:0 withObject:self.navigationController];
//    [self.tabBarController addChildViewController:self.navigationController];
    [self.tabBarController setSelectedViewController:self.navigationController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
