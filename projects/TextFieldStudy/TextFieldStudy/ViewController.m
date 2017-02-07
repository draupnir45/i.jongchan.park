//
//  ViewController.m
//  TextFieldStudy
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UITextField *testField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-80, 100, 40)];
    [testField setBackgroundColor:[UIColor whiteColor]];
    [testField setBorderStyle:UITextBorderStyleRoundedRect];
    testField.delegate = self;
    [self.view addSubview:testField];
    
    
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.center.y, self.view.frame.size.width, 40)];
    [self.label setTextColor:[UIColor whiteColor]];
    [self.label setFont:[UIFont systemFontOfSize:40 weight:-1.0]];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.label];
    
    
    
    
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.label setText:textField.text];
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing: %@",textField.text);
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing: %@",textField.text);
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing: %@",textField.text);
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing: %@",textField.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
