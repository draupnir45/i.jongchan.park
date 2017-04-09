//
//  ViewController.m
//  ContainerViewControllerPrac
//
//  Created by 박종찬 on 2017. 4. 9..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ContainerViewController.h"
#import "RedViewController.h"
#import "BlueViewController.h"

@interface ContainerViewController ()

@property NSArray *viewControllers;
@property UIViewController *currentDetailVC;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RedViewController *redVC = [RedViewController new];
    BlueViewController *blueVC = [BlueViewController new];
    
    self.viewControllers = @[redVC, blueVC];
    [self presentDetailView:self.viewControllers[0]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentDetailView:(UIViewController *)newVC {
    if (self.currentDetailVC == newVC) {
        return;
    } else {
        
        newVC.view.frame = self.containerView.bounds;
        [self.containerView addSubview:newVC.view];
        [newVC didMoveToParentViewController:self];
        [self.currentDetailVC.view removeFromSuperview];
        [self.currentDetailVC removeFromParentViewController];
        self.currentDetailVC = newVC;
    }
}

- (IBAction)redBtnSelected:(id)sender {
    [self presentDetailView:self.viewControllers[0]];
}

- (IBAction)blueBtnSelected:(id)sender {
    [self presentDetailView:self.viewControllers[1]];
}

@end
