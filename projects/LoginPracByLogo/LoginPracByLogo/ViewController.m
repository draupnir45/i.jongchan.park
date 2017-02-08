//
//  ViewController.m
//  LoginPracByLogo
//
//  Created by 박종찬 on 2017. 2. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UITextField *email;
@property UITextField *pw;
@property UITextField *pw2;
@property UIButton *signIn;
@property UIButton *signUp;
@property UIButton *ok;
@property UIScrollView *loginScrollView;
@property UIImageView *logo;
@property BOOL signUpMode;
@property UIView *viewForBtnPosition;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIFont *font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:15];
    
    self.signUpMode = NO;
    
    CGSize frameSize = self.view.frame.size;
    
    self.loginScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.frame];
    [bg setImage:[UIImage imageNamed:@"blurred.png"]];
    [bg setContentMode:UIViewContentModeScaleAspectFill];
    [self.loginScrollView addSubview:bg];
    
    [self.loginScrollView addSubview:self.logo];

    [self.view addSubview:self.loginScrollView];
    
    UIView *textFieldOffset10 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    self.email = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [self.email setCenter: CGPointMake(frameSize.width/2, frameSize.height/2)];
    [self.email.layer setCornerRadius:20];
    [self.email setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.7]];
    [self.email setTag:100];
    [self.email setPlaceholder:@"ID"];
    [self.email setFont:font];
    [self.email setDelegate:self];
    [self.email setLeftView:textFieldOffset10];
    [self.email setRightView:textFieldOffset10];
    [self.email setLeftViewMode:UITextFieldViewModeAlways];
    [self.email setRightViewMode:UITextFieldViewModeAlways];
    [self.loginScrollView addSubview:self.email];
    
    self.pw = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
//    [self.pw setRightViewMode:UITextFieldViewModeAlways];
    [self.pw setCenter: CGPointMake(frameSize.width/2, frameSize.height/2 + 54)];
    [self.loginScrollView addSubview:self.pw];
    [self.pw.layer setCornerRadius:20];
    [self.pw setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.7]];
    [self.pw setTag:200];
    [self.pw setPlaceholder:@"Password"];
    [self.pw setFont:font];
    [self.pw setDelegate:self];
    [self.pw setLeftView:textFieldOffset10];
    [self.pw setRightView:textFieldOffset10];
    [self.pw setLeftViewMode:UITextFieldViewModeAlways];
    [self.pw setSecureTextEntry:YES];
//    [self.pw setRightViewMode:UITextFieldViewModeAlways];
    



    
    
    self.viewForBtnPosition = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [self.viewForBtnPosition setCenter: CGPointMake(frameSize.width/2, frameSize.height/2 + 108)];
    
    [self.loginScrollView addSubview:self.viewForBtnPosition];
    
    self.signIn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 93, 40)];
    [self.signIn setBackgroundColor:[UIColor colorWithRed:60.0/255 green:89.0/255 blue:165.0/255 alpha:1.0]];
    [self.signIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.signIn.titleLabel setFont:font];
    [self.signIn setTitle:@"Sign In" forState:UIControlStateNormal];
    [self.signIn.layer setCornerRadius:20];
    
    [self.viewForBtnPosition addSubview:self.signIn];
    
    self.signUp = [[UIButton alloc]initWithFrame:CGRectMake(93+14, 0, 93, 40)];
    [self.signUp setBackgroundColor:[UIColor colorWithRed:60.0/255 green:89.0/255 blue:165.0/255 alpha:1.0]];
    [self.signUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.signUp.titleLabel setFont:font];
    [self.signUp setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.signUp.layer setCornerRadius:20];
    [self.signUp addTarget:self action:@selector(makeSignUpMode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.viewForBtnPosition addSubview:self.signUp];
    
    self.ok = [[UIButton alloc]initWithFrame:CGRectMake(0, 54, 200, 40)];
    [self.ok setBackgroundColor:[UIColor colorWithRed:60.0/255 green:89.0/255 blue:165.0/255 alpha:1.0]];
    [self.ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.ok.titleLabel setFont:font];
    [self.ok setTitle:@"Submit" forState:UIControlStateNormal];
    [self.ok.layer setCornerRadius:20];
    [self.ok setAlpha:0.0];
    
    [self.viewForBtnPosition addSubview:self.ok];
    
    self.logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width - 100, 200)];
    [self.logo setImage:[UIImage imageNamed:@"logo.png"]];
    [self.logo setCenter:CGPointMake(self.view.center.x, frameSize.height/3)];
    [self.logo setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.loginScrollView addSubview:self.logo];
    
    
    self.pw2 = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    //    [self.pw setRightViewMode:UITextFieldViewModeAlways];
    [self.pw2 setCenter: CGPointMake(frameSize.width/2, frameSize.height/2 + 108)];
    [self.loginScrollView addSubview:self.pw2];
    [self.pw2.layer setCornerRadius:20];
    [self.pw2 setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.7]];
    [self.pw2 setTag:300];
    [self.pw2 setPlaceholder:@"Password"];
    [self.pw2 setFont:font];
    [self.pw2 setDelegate:self];
    [self.pw2 setLeftView:textFieldOffset10];
    [self.pw2 setRightView:textFieldOffset10];
    [self.pw2 setLeftViewMode:UITextFieldViewModeAlways];
    [self.pw2 setSecureTextEntry:YES];
    [self.pw2 setAlpha:0.0];

    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.signUpMode) {
        [self.loginScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
    } else {
        [self.loginScrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 100) {
        [self.pw becomeFirstResponder];
    } else if (textField.tag == 200){
        if (self.signUpMode) {
            [self.pw2 becomeFirstResponder];
        } else {
            [textField resignFirstResponder];
        }
    } else {
        [textField resignFirstResponder];
        [self.loginScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle) preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
}

-(void)makeSignUpMode:(UIButton *)sender {
    
    self.signUpMode = YES;
//    self.viewForBtnPosition.alpha =0.0;
    [self.view bringSubviewToFront:self.pw2];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{self.signIn.alpha = 0.0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{self.signUp.alpha = 0.0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{self.ok.alpha = 1.0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{self.pw2.alpha = 1.0;} completion:nil];
    
    
}




@end
