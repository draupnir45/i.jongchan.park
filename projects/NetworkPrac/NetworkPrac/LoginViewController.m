//
//  LoginViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"
#import "JCAlertController.h"
#import "JCActivityIndicatorView.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property JCActivityIndicatorView *indicatorView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //인디케이터뷰
    self.indicatorView = [[JCActivityIndicatorView alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)logIn:(id)sender {
    
//    [self.userNameTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
    [self.view resignFirstResponder];
    
    [self.indicatorView startIndicatorOnView:self.view];

    //필수항목누락 예외처리
    if (self.userNameTextField.text.length == 0 || self.userNameTextField.text.length == 0 || self.userNameTextField.text.length == 0) {
        [self.indicatorView removeFromSuperview];
        [self presentViewController:[JCAlertController alertControllerWithTitle:@"필수 항목이 빠졌습니다."
                                                                        message:@"아이디, 비밀번호를 모두 넣어 주세요."
                                                                 preferredStyle:UIAlertControllerStyleAlert
                                                                    cancelTitle:@"확인"]
                           animated:YES
                         completion:nil];
    } else {
        
        [[DataCenter sharedData] logInRequestWithUserName:self.userNameTextField.text password:self.passwordTextField.text completion:^(BOOL sucess, NSDictionary *dataDict) {
            
            NSUInteger loginResponse = 100;
            
            if (sucess) {
                loginResponse = JCNetworkLogInResponseOK;
            } else {
                loginResponse = JCNetworkLogInResponseUnknownError;
            }
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.indicatorView stopIndicator];
                [self actionWithResult:loginResponse];
                
            });
            
            
        }];
    }
}

- (void)actionWithResult:(NSUInteger)result {
    
    switch (result) {
        case JCNetworkLogInResponseOK:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"로그인 성공!" message:nil preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
            
        case JCNetworkLogInResponseUnknownError:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"로그인 실패" message:@"로그인 정보를 확인해 주세요!" preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self.userNameTextField becomeFirstResponder];
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}



@end
