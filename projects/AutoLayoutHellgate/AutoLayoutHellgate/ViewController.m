//
//  ViewController.m
//  AutoLayoutHellgate
//
//  Created by 박종찬 on 2017. 2. 27..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.indicator startAnimating];
    [self.indicator setHidesWhenStopped:YES];
    [self.progressBar setProgressViewStyle:UIProgressViewStyleDefault];
    [self.progressBar setProgress:0.00 animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelected:(UIButton *)sender {
    self.myLabel.text = @"OK It's working";
//    [self.myLabel sizeToFit];
    [self.indicator stopAnimating];
    [self.progressBar setProgress:1.0 animated:YES];
}


@end
