//
//  ViewController.m
//  SegmentedControl
//
//  Created by 박종찬 on 2017. 3. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "ChildrenPowerViewController.h"

@interface ViewController ()
@property IBOutlet UIViewController *firstViewController;
@property IBOutlet UIViewController *secondViewController;
@property (weak, nonatomic) IBOutlet UIView *howToUse;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(UIButton *)sender {
    
    if (sender.tag) {
        
    }
    
}



@end
