//
//  ViewController.m
//  PrintingCenterCharPrac
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>


@property UITextField *field;
@property UILabel *middleCharLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize frameSize = self.view.frame.size;
    
    self.field = [[UITextField alloc] initWithFrame:CGRectMake(frameSize.width/2-100, 100, 200, 30)];
    [self.field.layer setBorderWidth:1];
    [self.field.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.view addSubview:self.field];
    self.field.delegate = self;
    
    self.middleCharLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameSize.width/2 -100, 200, 200, 30)];
    [self.middleCharLabel setTextAlignment:NSTextAlignmentCenter];
    [self.middleCharLabel setTextColor:[UIColor blackColor]];
    [self.middleCharLabel setText:@"HI"];
    [self.view addSubview:self.middleCharLabel];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.middleCharLabel.text = string;
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField.text.length % 2) {
        self.middleCharLabel.text = [textField.text substringWithRange:NSMakeRange((textField.text.length/2), 1)];
    } else {
        self.middleCharLabel.text = [textField.text substringWithRange:NSMakeRange((textField.text.length/2)-1, 2)];
    }
    
    return YES;
}

@end
