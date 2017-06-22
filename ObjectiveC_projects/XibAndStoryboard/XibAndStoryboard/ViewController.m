//
//  ViewController.m
//  XibAndStoryboard
//
//  Created by 박종찬 on 2017. 2. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "XecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.button1 addTarget:self action:@selector(button1Selected:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)button1Selected:(UIButton *)sender {
    //스토리봗
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [secondViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:secondViewController animated:YES completion:nil];
    
    //XIB
//    XecondViewController *newVC = [[XecondViewController alloc] initWithNibName:@"XecondViewController" bundle:[NSBundle mainBundle]];
//    [newVC setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//    [self presentViewController:newVC animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
