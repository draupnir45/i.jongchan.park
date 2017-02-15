//
//  ViewController.m
//  HashNumbGetter
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UITextField *inputTextField;
@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width /2 - 100, 100, 200, 40)];
    self.inputTextField.delegate = self;
    [self.inputTextField.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    [self.inputTextField.layer setBorderWidth:1.0];
    [self.inputTextField.layer setCornerRadius:10];
    [self.view addSubview:self.inputTextField];
//    [self.inputTextField setKeyboardType:UIKeyboardTypeNumberPad];
    
   
    
    NSLog(@"viewDidLoad");
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
   NSLog(@"viewWillAppear");
}

-(void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    [self.inputTextField setFrame:CGRectMake(0, 0, 100, 2000)];
    
    NSLog(@"viewWillLayoutSubviews");
}

-(void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear");
}
-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self sumOfDivisor:textField.text];
    
    [self resignFirstResponder];

    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSArray *views = [self.view subviews];
    for (NSInteger i=1; i<views.count; i++) {
        if ([views[i] isMemberOfClass:[UILabel class]]) {
                    [views[i] removeFromSuperview];
        }

    }
}

-(void)sumOfDivisor:(NSString *)numberString {
    NSInteger number = [numberString integerValue];
    NSInteger result = 0;
    for (NSInteger i =1; i<=number; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, 200 + i*20, 300, 20)];
        [label setTextAlignment:NSTextAlignmentCenter];

        if (number % i) {
            [label setText:[NSString stringWithFormat:@"%ld는 약수가 아닙니다.",i]];
        } else {
            result += i;
            [label setText:[NSString stringWithFormat:@"%ld는 약수입니다. 결과값: %ld.",i,result]];
        }
        [self.view addSubview:label];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
