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
@property UILabel *resultLabel;

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
    
    
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 40)];
    [self.view addSubview:self.resultLabel];
    [self.resultLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    
    
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
    if ([self isHashedNumber]) {
        [self.resultLabel setText:@"HASH!"];
    } else {
        [self.resultLabel setText:@"NOPE, NOT AT ALL."];
    }
    return YES;
}

-(BOOL)isHashedNumber {
    NSString *inputText = self.inputTextField.text;
    NSInteger length = inputText.length;
    NSUInteger sumOfNumbers = 0;
    for (NSInteger i=0; i<length; i++) {
        NSString *charFromText = [inputText substringWithRange:NSMakeRange(i, 1)];
        
        sumOfNumbers += [charFromText integerValue];
    }
    
    if ([inputText integerValue] % sumOfNumbers) {
        return NO;
    } else {
        return YES;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
