//
//  MainViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
//    BOOL autoLoginable = NO;
//    
//    if (!autoLoginable) {
//        [self performSegueWithIdentifier:@"LoginViewSegue" sender:nil];
//    }
}

- (IBAction)postBtnSelected:(id)sender {
    BOOL haveToken = YES;
    
    if (haveToken) {
        [self performSegueWithIdentifier:@"PostingViewSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
    }
    
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
